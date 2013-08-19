using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Dynamic;
using System.Linq;
using System.Web.Mvc;

namespace Questionnaire.Externals
{
    public class JsonResponse
    {

        public bool Result { get; set; }
        public string Message { get; set; }
        public Dictionary<string, string> Errors { get; set; } 
        public dynamic Additional { get; set; }

        public string ReturnUrl { get; set; }

        public JsonResponse()
        {
            Result = true;
            Message = String.Empty;
            Additional = new ExpandoObject();
            Errors = new Dictionary<string, string>();
        }

        public void AddError(String field, String message)
        {
            Result = false;
            Errors.Add(field, message);
        }
    }
}