using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessAccessLayer
{
    public class BusinessAccessClass
    {

        DataAccessLayer.DataAccessClass daobj = new DataAccessLayer.DataAccessClass();
        public int InsertStudent(BusinessEntityLayer.BusinessEntityClass obj)
        {
                
            return daobj.InsertStudent(obj);
        }
        public DataTable GetList()
        {
            return daobj.SudentList();
        }
        public int UpdateStudent(BusinessEntityLayer.BusinessEntityClass obj)
        {
            return daobj.UpdateStudent(obj);
        }
        public int DeleteStudent(int id)
        {
            return daobj.DeleteStudent(id);
        }
    }
}
