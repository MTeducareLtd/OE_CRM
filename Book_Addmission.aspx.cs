using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using ShoppingCart.BL;

public partial class Book_Addmission : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDDL_AcadYear();
            FillDDL_Division();
            FillDDL_PayPaln();
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

    private void FillDDL_Product()
    {

        try
        {
            String Center = ddlCenter.SelectedValue;
            DataSet ds = CRM_Controller.GetProductby_Center_AcademicYear(Center, ddlAcadYear.SelectedValue);
            BindDDL(ddlProduct, ds.Tables[0], "stream_sdesc", "stream_code");
            ddlProduct.Items.Insert(0, "Select");
            ddlProduct.SelectedIndex = 0;
            //UpdatePanel2.Update();


        }
        catch (Exception ex)
        {
            Msg_Error.Visible = true;
            lblerror.Text = ex.ToString();
        }

    } 

    private void FillDDL_PayPaln()
    {

        try
        {

            DataSet ds = CRM_Controller.GetAllPayplan();
            BindDDL(ddlPayPlan, ds.Tables[0], "Pay_Plan_Description", "Pay_Plan_Code");
            ddlPayPlan.Items.Insert(0, "Select");
            ddlPayPlan.SelectedIndex = 0;

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
            HttpCookie cookie = Request.Cookies.Get("CRMCookiesLoginInfo"); ;
            string Username = cookie.Values["UserName"];
            string password = cookie.Values["Password"];
            string UserId = cookie.Values["UserID"];

            DataSet ds = CRM_Controller.GetAllDivision_TabStagging(UserId);
            BindDDL(ddlDivision, ds.Tables[0], "Source_Division_ShortDesc", "Source_Division_Code");
            ddlDivision.Items.Insert(0, "Select");
            ddlDivision.SelectedIndex = 0;
            ddlCenter.Items.Insert(0, "Select");
            ddlCenter.SelectedIndex = 0;
           // UpdatePanel1.Update();
           

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

    protected void ddlCenter_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDDL_Product();
    }

    protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindOptionalSubject(ddlProduct.SelectedValue, ddlCenter.SelectedValue);
    }

    private void BindOptionalSubject(string StreamName, string Center)
    {
        DataSet ds = CRM_Controller.GetSubjectsbyStreamCode(5, ddlProduct.SelectedValue, ddlCenter.SelectedValue);
        if (ds.Tables[0] != null)
        {
            dlGroupSelection.DataSource = ds;
            dlGroupSelection.DataBind();
        }

    }

    protected void btnBookAdmissionSearch_Click(object sender, EventArgs e)
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

                //lblBookAdmissionError.InnerText = "";
                Msg_Error.Visible = false;
                Msg_Success.Visible = false;
                DataSet ds = CRM_Controller.CRM_GET_CONTACT_DETAILS(1, txtUserName.Text, txtMobileNo.Text);
                if (ds != null)
                {

                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            dlBookAdmission.DataSource = ds.Tables[0];
                            dlBookAdmission.DataBind();
                            //lblBookAdmissionError.InnerText = "";
                            divBookAdmissionSearch.Visible = false;
                            divBookAdmissionData.Visible = true;
                            //btnBookAdmissionBack.Visible = true;
                            divContactDetails.Visible = false;
                            divLeadDetails.Visible = false;
                            divOpportunityDetails.Visible = false;
                            divAdmissionDetails.Visible = false;
                            divAddmissionConfirmed.Visible = false;
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

    protected void dlBookAdmission_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
           
            if (e.CommandName == "BookAdmission")
            {
                divBookAdmissionSearch.Visible = false;
                divBookAdmissionData.Visible = false;
                //divAddBookAdmission.Visible = true;
                //divAddmissionConfirmed.Visible = false;
                divContactDetails.Visible = true;
                divLeadDetails.Visible = true;
                divOpportunityDetails.Visible = true;
                divAdmissionDetails.Visible = true;
                divAddmissionConfirmed.Visible = false;
                //ddlAcadYear.Enabled = false;
                //ddlDivision.Enabled = false;
                //ddlCenter.Enabled = false;
                ddlSalesStage.Enabled = false;

                lblPkey.Text = e.CommandArgument.ToString();
               
                // FillBookAdmissionDetails(lblPkey.Text);
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

    //private void FillBookAdmissionDetails(string PKey)
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
    //        lblDOJ.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["TestType_Name"]);


    //        ddlSalesStage.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);
    //        txtClosureDate.Value = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);
    //        txtProbability.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);

    //        ddlProduct.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);
    //        ddlPayPlan.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);



    //    }
    //}

    protected void btnBack_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            divBookAdmissionSearch.Visible = false;
            divBookAdmissionData.Visible = false;
            divContactDetails.Visible = true;
            divLeadDetails.Visible = true;
            divOpportunityDetails.Visible = true;
            divAdmissionDetails.Visible = true;
            divAddmissionConfirmed.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);

        }

        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }
    }

    protected void btnBookAdmissionClear_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            txtUserName.Text = "";
            txtMobileNo.Text = "";
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
        }
        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }
    }

    protected void btnBookAdmissionBack_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            divBookAdmissionSearch.Visible = true;
            divBookAdmissionData.Visible = false;
            divContactDetails.Visible = false;
            divLeadDetails.Visible = false;
            divOpportunityDetails.Visible = false;
            divAdmissionDetails.Visible = false;
            divAddmissionConfirmed.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
        }
        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }

    }

    protected void btnbookAdmissionProceed_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            string Oppurid = "";
            //Msg_Error.Visible = false;
            //Msg_Success.Visible = false;

           

            if (ddlProduct.SelectedIndex == 0)
            {
                Msg_Error.Visible = true;
                Msg_Success.Visible = false;
                lblerror.Text = "Select Product";
                ddlProduct.Focus();
                return;
            }

            if (ddlPayPlan.SelectedIndex == 0)
            {
                Msg_Error.Visible = true;
                Msg_Success.Visible = false;
                lblerror.Text = "Select Pay Plan";
                ddlPayPlan.Focus();
                return;
            }

            int TotalRecord = 0;

            foreach (DataListItem dtlItem in dlGroupSelection.Items)
            {
                CheckBox chkStudent = (CheckBox)dtlItem.FindControl("chkStudent");

                if (chkStudent.Checked == true)
                {
                    TotalRecord = TotalRecord + 1;
                }
            }
            if (TotalRecord == 0)
            {
                Msg_Error.Visible = true;
                Msg_Success.Visible = false;
                lblerror.Text = "Select Atleast One Subject Group";
                return;
            }


            ddlProduct1.Enabled = false;
            ddlPayPlan1.Enabled = false;
            //ddlProduct.Enabled = true;
            //ddlPayPlan.Enabled = true; 



            ddlProduct1.SelectedValue = ddlProduct.SelectedValue;

            ddlPayPlan1.SelectedValue = ddlPayPlan.SelectedValue;

            object obj = null;
            //CheckBox Chk = default(CheckBox);
            //Label lblSelectmaterialcode = default(Label);
            //List<string> list = new List<string>();
            //List<string> List1 = new List<string>();
            //string Sgrcode = "";
            //CheckBox cb = default(CheckBox);

            //foreach (DataListItem li in dlGroupSelection.Items)
            //{
            //    obj = li.FindControl("lblmaterialcodeadd");
            //    if (obj != null)
            //    {
            //        lblSelectmaterialcode = (Label)obj;
            //    }

            //    cb = (CheckBox)li.FindControl("chkStudent");
            //    if (cb != null)
            //    {
            //        Chk = (CheckBox)cb;
            //    }

            //    if (Chk.Checked == true)
            //    {
            //        list.Add(lblSelectmaterialcode.Text);
            //        Sgrcode = string.Join(",", list.ToArray());
            //    }
            //}

            //Display Subject Group
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("SGR_DESC", typeof(string)));

            foreach (DataListItem dtlItem in dlGroupSelection.Items)
            {
                CheckBox chkStudent1 = (CheckBox)dtlItem.FindControl("chkStudent");
                if (chkStudent1.Checked == true)
                {
                    dr = dt.NewRow();
                    // object obj = null;
                    Label lblSubgrpDesc = default(Label);
                    obj = dtlItem.FindControl("lblSubgrpDesc");
                    if (obj != null)
                    {
                        lblSubgrpDesc = (Label)obj;
                        dr["SGR_DESC"] = lblSubgrpDesc.Text;
                    }
                    dt.Rows.Add(dr);
                }
            }


            dlGroupSelectionConfirmed.DataSource = dt;
            dlGroupSelectionConfirmed.DataBind();


            DataSet ds1 = CRM_Controller.GetFeesComponent(2, Oppurid);
            if (ds1.Tables[0] != null)
            {
                dlFeeStucture.DataSource = ds1;
                dlFeeStucture.DataBind();
            }

            divBookAdmissionSearch.Visible = false;
            divBookAdmissionData.Visible = false;
            divContactDetails.Visible = true;
            divLeadDetails.Visible = true;
            divOpportunityDetails.Visible = true;
            divAdmissionDetails.Visible = false;
            divAddmissionConfirmed.Visible = true;

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
        }
        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }

    }

    protected void btnBack1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
           
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            divBookAdmissionSearch.Visible = false;
            divBookAdmissionData.Visible = true;
            divContactDetails.Visible = false;
            divLeadDetails.Visible = false;
            divOpportunityDetails.Visible = false;
            divAdmissionDetails.Visible = false;
            divAddmissionConfirmed.Visible = false;
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