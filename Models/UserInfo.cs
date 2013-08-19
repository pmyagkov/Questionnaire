using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.Serialization;
using System.Web;

namespace Questionnaire.Models
{
    public class UserInfo
    {
        [DataMember]
        public List<QuestionInfo> Questions { get; set; }
        [DataMember]
        public string CV { get; set; }
        [DataMember]
        public string MK { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string Phone { get; set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public string Additional { get; set; }
        [DataMember]
        public string Recommend { get; set; }

        public UserInfo()
        {
            Questions = new List<QuestionInfo>();
        }
    }

    [DataContract]
    public class QuestionInfo
    {
        [DataMember]
        public string Question { get; set; }
        [DataMember]
        public string Answer { get; set; }
        [DataMember]
        public string Option { get; set; }
    }
}