﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeRecords.Models
{
    public class EmployeeReferenceModel
    {
        public int ID { get; set; }
        public int EmployeeNumber { get; set; }
        public string Name { get; set; }
        public string Contact { get; set; }
        public string Occupation { get; set; }
    }
}