using System;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using Questionnaire.Externals;
using Questionnaire.Models;

namespace Questionnaire.Controllers
{
    public class HomeController : Controller
    {
        [HttpPost]
        public ActionResult Save(HttpPostedFileBase cv)
        {
            var response = new JsonResponse();
            var userInfo = new UserInfo();
            try
            {
                var form = Request.Form;

                userInfo.Email = Server.HtmlEncode(form["email"]);
                var builder = new StringBuilder(userInfo.Email);
                builder.Append(" - CV");

                // проверяем файл резюме и, если валидный, сохраняем на диск
                if (cv != null && cv.ContentLength > 0)
                {
                    if (cv.ContentLength > 250000)
                    {
                        response.AddError("cv",
                            "Файл резюме превышает 250Кб. Попробуйте его укоротить и отправить еще раз.");
                    }
                    else
                    {
                        builder.Append(Path.GetExtension(cv.FileName));
                        var path = Path.Combine(Server.MapPath("~/App_Data"), builder.ToString());
                        cv.SaveAs(path);
                    }
                }

                // просматриваем все ответы и сохраняем их
                foreach (var key in form.AllKeys.Where(k => k.StartsWith("q")))
                {
                    var question = new QuestionInfo { Question = key, Answer = Server.HtmlEncode(form[key]) };
                    if (form.AllKeys.Contains(key + "_o"))
                    {
                        question.Option = Server.HtmlEncode(form[key + "_o"]);
                    }
                    userInfo.Questions.Add(question);
                }

                // сохраняем личную информацию
                userInfo.CV = builder.ToString();
                userInfo.MK = Server.HtmlEncode(form["mk"]);
                userInfo.Name = Server.HtmlEncode(form["name"]);
                userInfo.Phone = Server.HtmlEncode(form["phone"]);
                userInfo.Additional = Server.HtmlEncode(form["additional"]);
                userInfo.Recommend = Server.HtmlEncode(form["recommend"]);

                var serializer = new DataContractSerializer(typeof(UserInfo));

                // строим безопасное имя файла анкеты в смысле файловой системы
                // при построении имен файлов предполагается, что email уникален
                builder = new StringBuilder(userInfo.Email);
                builder = Path.GetInvalidFileNameChars().Aggregate(builder, (current, c) => current.Replace(c, '_'));
                builder.Append(".xml");

                // сериализуем объект в xml и сохраняем
                using (var fs = System.IO.File.Open(Server.MapPath(builder.Insert(0, "~/App_Data/").ToString()), FileMode.Create))
                {
                    using (var xmlWriter = XmlWriter.Create(fs, new XmlWriterSettings() {Indent = true}))
                    {
                        serializer.WriteObject(xmlWriter, userInfo);
                    }
                }
            }
            catch (Exception e)
            {
                response.AddError("hidden", "Неожиданная ошибка на сервере. Попробуйте еще раз позже.");
            }

            return new NewtonsoftJsonResult(response);
            
        }

    }
}
