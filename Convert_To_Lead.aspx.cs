using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using ShoppingCart.BL;

public partial class Convert_To_Lead : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDDL_AcadYear();
            FillDDL_Division();
        }
    }

    private void BindDDL(DropDownList ddl, DataTable dt, string txtField, string valField)
    {
        ddl.DataSource = dt;
        ddl.DataTextField = txtField;
        ddl.DataValueField = valField;
        ddl.DataBind();
    }

    private void FillDDL_AcadYear()
    {

        try
        {

            DataSet ds = CRM_Controller.GetAllActiveUser_AcadYear();
            BindDDL(ddlAcadYear, ds.Tables[0], "Description", "id");
            ddlAcadYear.Items.Insert(0, "Select");
            ddlAcadYear.SelectedIndex = 0;

        }
        catch (Exception ex)
        {
            Msg_Error.Visible = true;
            lblerror.Text = ex.ToString();
        }

    }

    private void FillDDL_Division()
    {

        try
        {
            HttpCookie cookie = Request.Cookies.Get("CRMCookiesLoginInfo");;
            string Username = cookie.Values["UserName"];
            string password = cookie.Values["Password"];
            string UserId = cookie.Values["UserID"];

            DataSet ds = CRM_Controller.GetAllDivision_TabStagging(UserId);
            BindDDL(ddlDivision, ds.Tables[0], "Source_Division_ShortDesc", "Source_Division_Code");
            ddlDivision.Items.Insert(0, "Select");
            ddlDivision.SelectedIndex = 0;
            ddlCenter.Items.Insert(0, "Select");
            ddlCenter.SelectedIndex = 0;

        }
        catch (Exception ex)
        {
            Msg_Error.Visible = true;
            lblerror.Text = ex.ToString();
        }

    }

    protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDDL_Center();
    }

    private void FillDDL_Center()
    {

        try
        {
            String Division = ddlDivision.SelectedValue;

            DataSet dsCenters = CRM_Controller.GetAllCenter_By_Division(Division, 1);

            BindDDL(ddlCenter, dsCenters.Tables[0], "center_name", "center_code");
            ddlCenter.Items.Insert(0, "Select");
            ddlCenter.SelectedIndex = 0;
        }

        catch (Exception ex)
        {
            Msg_Error.Visible = true;
            lblerror.Text = ex.ToString();
        }



    }

    protected void btnConvertToLeadSearch_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            if (txtUserName.Text == "" || txtMobileNo.Text == "")
            {
                Msg_Error.Visible = true;
                Msg_Success.Visible = false;
                lblerror.Text = "Enter Name Or Mobile No.";

                if (txtMobileNo.Text != "")
                {
                    if (txtMobileNo.Text.Length < 10)
                    {
                        Msg_Error.Visible = true;
                        Msg_Success.Visible = false;
                        lblerror.Text = "Mobile Number length must be between 10 to 12 characters";

                        return;
                    }
                }

            }

            if (txtUserName.Text != "" || txtMobileNo.Text != "")
            {
                if (txtMobileNo.Text != "")
                {
                    if (txtMobileNo.Text.Length < 10)
                    {
                        Msg_Error.Visible = true;
                        Msg_Success.Visible = false;
                        lblerror.Text = "Mobile Number length must be between 10 to 12 characters";

                        return;
                    }
                }
               // lblConvertToLeadError.InnerText = "";
                Msg_Error.Visible = false;
                Msg_Success.Visible = false;
                DataSet ds = CRM_Controller.CRM_GET_CONTACT_DETAILS(1, txtUserName.Text, txtMobileNo.Text);
                if (ds != null)
                {

                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            dlConvertToLead.DataSource = ds.Tables[0];
                            dlConvertToLead.DataBind();
                            //lblConvertToLeadError.InnerText = "";
                            divConvertToLeadSearch.Visible = false;
                            divConvertToLeadData.Visible = true;
                            divAddConvertToLead.Visible = false;
                            btnBack.Visible = true;
                            Msg_Error.Visible = false;
                            Msg_Success.Visible = false;
                        }
                        else
                        {

                            Msg_Error.Visible = true;
                            Msg_Success.Visible = false;
                            lblerror.Text = "Records not found..!";
                            UpdatePanelMsgBox.Update();
                            return;
                        }
                    }
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }
      
    }

   
    protected void dlConvertToLead_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            if (e.CommandName == "Lead")
            {
                divConvertToLeadSearch.Visible = false;
                divConvertToLeadData.Visible = false;
                divAddConvertToLead.Visible = true;

                lblPkey.Text = e.CommandArgument.ToString();

                // FillConvertToLeadDetails(lblPkey.Text);
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
        }
        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }
    }

    //private void FillConvertToLeadDetails(string PKey)
    //{


    //    HttpCookie LoginInfo = new HttpCookie("CRMCookiesLoginInfo");
    //    string Username = Request.Form["UserName"];
    //    string password = Request.Form["Password"];
    //    string UserId = Request.Form["UserID"];




    //    DataSet dsIssue = CRM_Controller.GetAnswerSheetIssueDetails_ByPKey(PKey, TeacherID, 1);

    //    if (dsIssue.Tables[0].Rows.Count > 0)
    //    {
    //        lblContactName.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["Source_Division_ShortDesc"]);
    //        lblHandphone1.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["Acad_Year"]);
    //        lblGender.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["course_Name"]);
    //        lblEmail.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["Source_Center_Name"]);

    //        ddlAcadYear.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);
    //        ddlDivision.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["TestCategory_Name"]);
    //        ddlCenter.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["TestType_Name"]);
            
           
    //    }


    //}

    protected void btnClose_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            divConvertToLeadSearch.Visible = false;
            divConvertToLeadData.Visible = true;

            divAddConvertToLead.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);

        }

        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }
    }

    protected void btnConvertToLeadClear_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            txtUserName.Text = "";
            txtMobileNo.Text = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
        }
        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
           
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            divConvertToLeadSearch.Visible = true;
            divConvertToLeadData.Visible = false;
            divAddConvertToLead.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
        }
        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }
        
    }
}