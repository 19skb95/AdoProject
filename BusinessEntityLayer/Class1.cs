using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntityLayer
{
    public class BusinessEntityClass
    {
        public int id { get; set; }
        public string Name { get; set; }

        public string Address { get; set; }
        public char Gender { get; set; }

        public string PhNumber { get; set; }
        public  DateTime date { get; set; }
    }
}
