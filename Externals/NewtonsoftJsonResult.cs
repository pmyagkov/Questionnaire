using System;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace Questionnaire.Externals
{
    public class NewtonsoftJsonResult : JsonResult
    {
        public NewtonsoftJsonResult(object data)
        {
            Data = data;
        }

        public NewtonsoftJsonResult(object data, string contentType)
            : this(data)
        {
            ContentType = contentType;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("context");
            }

            HttpResponseBase response = context.HttpContext.Response;
            response.ContentType = !string.IsNullOrEmpty(this.ContentType) ? this.ContentType : "application/json";
            if (this.ContentEncoding != null)
            {
                response.ContentEncoding = this.ContentEncoding;
            }
            if (this.Data != null)
            {
                response.Write(JsonConvert.SerializeObject(this.Data, Formatting.Indented,
                    new JsonSerializerSettings { TypeNameHandling = TypeNameHandling.None }));
            }
        }
    }
}