using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using ShoppingCart.BL;


public partial class Convert_To_Opportunity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDDL_AcadYear();
            FillDDL_Division();
            FillDDL_SalesStage();
           
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

    private void FillDDL_SalesStage()
    {

        try
        {


            DataSet ds = CRM_Controller.GetSalesStage(1);
            BindDDL(ddlSalesStage, ds.Tables[0], "Sales_Stage_Desc", "Sales_Id");
            ddlSalesStage.Items.Insert(0, "Select");
            ddlSalesStage.SelectedIndex = 0;



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
           

        }
        catch (Exception ex)
        {
            Msg_Error.Visible = true;
            lblerror.Text = ex.ToString();
        }

    }

    protected void btnConvertToOpportunitySearch_Click(object sender, EventArgs e)
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

               // lblConvertToOpportunityError.InnerText = "";
                Msg_Error.Visible = false;
                Msg_Success.Visible = false;
                DataSet ds = CRM_Controller.CRM_GET_CONTACT_DETAILS(1, txtUserName.Text, txtMobileNo.Text);
                if (ds != null)
                {

                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            dlConvertToOpportunity.DataSource = ds.Tables[0];
                            dlConvertToOpportunity.DataBind();
                           // lblConvertToOpportunityError.InnerText = "";
                            divConvertToOpportunitySearch.Visible = false;
                            divConvertToOpportunityData.Visible = true;
                            divAddConvertToOpportunity.Visible = false;
                            //btnConvertToOpportunityBack.Visible = true;
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

    protected void dlConvertToOpportunity_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            if (e.CommandName == "Opportunity")
            {
                divConvertToOpportunitySearch.Visible = false;
                divConvertToOpportunityData.Visible = false;
                divAddConvertToOpportunity.Visible = true;
                //ddlAcadYear.Enabled = false;
                //ddlDivision.Enabled = false;
                //ddlCenter.Enabled = false;

                lblPkey.Text = e.CommandArgument.ToString();

                // FillConvertToOpportunityDetails(lblPkey.Text);
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

//    private void FillConvertToOpportunityDetails(string PKey)
//    {


//        HttpCookie LoginInfo = new HttpCookie("CRMCookiesLoginInfo");
//        string Username = Request.Form["UserName"];
//        string password = Request.Form["Password"];
//        string UserId = Request.Form["UserID"];




//        DataSet dsIssue = CRM_Controller.GetAnswerSheetIssueDetails_ByPKey(PKey, TeacherID, 1);

//        if (dsIssue.Tables[0].Rows.Count > 0)
//        {
//            lblContactName.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["Source_Division_ShortDesc"]);
//            lblHandphone1.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["Acad_Year"]);
//            lblGender.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["course_Name"]);
//            lblEmail.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["Source_Center_Name"]);

//            ddlAcadYear.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);
//            ddlDivision.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["TestCategory_Name"]);
//            ddlCenter.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["TestType_Name"]);
//            lblDOJ.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["TestType_Name"]);


//            ddlSalesStage.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);
//            ddlProduct.SelectedValue = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);
//            txtClosureDate.Value = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);
//            txtProbability.Text = Convert.ToString(dsIssue.Tables[0].Rows[0]["BatchName"]);

//        }
//}

    protected void btnClose_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            divConvertToOpportunitySearch.Visible = false;
            divConvertToOpportunityData.Visible = true;

            divAddConvertToOpportunity.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);

        }

        catch (Exception ex)
        {

            Msg_Error.Visible = true;
            Msg_Success.Visible = false;
            lblerror.Text = ex.ToString();
        }
    }

    protected void btnConvertToOpportunityClear_Click(object sender, EventArgs e)
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

    protected void btnConvertToOpportunityBack_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
        try
        {
            
            Msg_Error.Visible = false;
            Msg_Success.Visible = false;
            divConvertToOpportunitySearch.Visible = true;
            divConvertToOpportunityData.Visible = false;
            divAddConvertToOpportunity.Visible = false;
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