using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PresentationLayer
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        BusinessEntityLayer.BusinessEntityClass beObj = new BusinessEntityLayer.BusinessEntityClass();
        BusinessAccessLayer.BusinessAccessClass baObj = new BusinessAccessLayer.BusinessAccessClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GridBind();
            }
        }
        void GridBind()
        {
            DataTable list = baObj.GetList();
            GridView1.DataSource = list;
            GridView1.DataBind();
        }
        void reset()
        {
            txtAddr.Text = "";
            txtDate.Text = "";
            txtPh.Text = "";
            txtName.Text = "";
        }

        protected void btnInsrt_Click(object sender, EventArgs e)
        {
            beObj.Name = txtName.Text;
            beObj.Address = txtAddr.Text;
            beObj.PhNumber = txtPh.Text;
            beObj.date = Convert.ToDateTime(txtDate.Text);
            beObj.Gender = Convert.ToChar(RadioButtonList1.SelectedValue);
            if (baObj.InsertStudent(beObj) > 0)
            { lblMsg.Text = "Record inserted."; }
            else { lblMsg.Text = "Record is not inserted."; }
            GridBind();
            reset();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];
            hid.Value= row.Cells[0].Text;
            txtName.Text = row.Cells[1].Text;
            txtAddr.Text = row.Cells[2].Text;
            RadioButtonList1.SelectedValue = row.Cells[3].Text.ToUpper();
            txtPh.Text = row.Cells[4].Text;
            txtDate.Text = (Convert.ToDateTime(row.Cells[5].Text)).ToString("MM/dd/yyyy");

            btnInsrt.Visible = false;
            BtnDlete.Visible = true;
            BtnUpdate.Visible = true;

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToString("MM/dd/yyyy");
            Calendar1.Visible = false; 
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            beObj.id = Convert.ToInt32(hid.Value);
            beObj.Name = txtName.Text;
            beObj.Address = txtAddr.Text;
            beObj.PhNumber = txtPh.Text;
            beObj.date = Convert.ToDateTime(txtDate.Text);
            beObj.Gender = Convert.ToChar(RadioButtonList1.SelectedValue);

           if(baObj.UpdateStudent(beObj)>0)
            { lblMsg.Text = "Record updated."; }
            else { lblMsg.Text = "Record is not updated."; }
            GridBind();
            reset();

            btnInsrt.Visible = true;
            BtnDlete.Visible = false;
            BtnUpdate.Visible = false;
        }

        protected void BtnDlete_Click(object sender, EventArgs e)
        {
            if (baObj.DeleteStudent(Convert.ToInt32(hid.Value)) > 0)
            { lblMsg.Text = "Record deleted."; }
            else { lblMsg.Text = "Record is not deleted."; }
            btnInsrt.Visible = true;
            BtnDlete.Visible = false;
            BtnUpdate.Visible = false;
            reset();
            GridBind();
        }
    }
}