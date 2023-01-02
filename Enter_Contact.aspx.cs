using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using ShoppingCart.BL;
using System.Net;
using System.Net.Mail;
using System.Configuration;

public partial class Enter_Contact : System.Web.UI.Page
{
    public string Version = ConfigurationManager.AppSettings["Version"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    FillDDL_ContactSource();
           
        //}
       
    }

    //private void BindDDL(DropDownList ddl, DataTable dt, string txtField, string valField)
    //{
    //    ddl.DataSource = dt;
    //    ddl.DataTextField = txtField;
    //    ddl.DataValueField = valField;
    //    ddl.DataBind();
    //}

    //private void FillDDL_ContactSource()
    //{

    //    try
    //    {


    //        DataSet ds = CRM_Controller.GetallactiveleadSource();
    //        BindDDL(ddlContactSource,ds.Tables[0],"description","id");
    //        ddlContactSource.Items.Insert(0, "Select");
    //        ddlContactSource.SelectedIndex = 0;


            
    //    }
    //    catch (Exception ex)
    //    {
    //        Msg_Error.Visible = true;
    //        lblerror.Text = ex.ToString();
    //    }

    //}

    

    //protected void btnEnterContactSearch_Click(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
    //    try
    //    {
           
    //        if (txtUserName.Text == "" || txtMobileNo.Text == "")
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Enter Name Or Mobile";

    //            if (txtMobileNo.Text != "")
    //            {
    //                if (txtMobileNo.Text.Length < 10)
    //                {
    //                    Msg_Error.Visible = true;
    //                    Msg_Success.Visible = false;
    //                    lblerror.Text = "Mobile Number length must be between 10 to 12 characters";

    //                    return;
    //                }
    //            }



    //        }
    //        if (txtUserName.Text != "" || txtMobileNo.Text != "")
    //        {
    //            if (txtMobileNo.Text != "")
    //            {
    //                if (txtMobileNo.Text.Length < 10)
    //                {
    //                    Msg_Error.Visible = true;
    //                    Msg_Success.Visible = false;
    //                    lblerror.Text = "Mobile Number length must be between 10 to 12 characters";

    //                    return;
    //                }
    //            }

    //            //lblEnterContactError.InnerText = "";
    //            Msg_Error.Visible = false;
    //            Msg_Success.Visible = false;

    //            DataSet ds = CRM_Controller.CRM_GET_CONTACT_DETAILS(1, txtUserName.Text, txtMobileNo.Text);
    //            if (ds != null)
    //            {

    //                if (ds.Tables.Count > 0)
    //                {
    //                    if (ds.Tables[0].Rows.Count > 0)
    //                    {

    //                        dlContact.DataSource = ds.Tables[0];
    //                        dlContact.DataBind();
                           
    //                        txtHandPhone1.Text = txtMobileNo.Text;
    //                        txtFirstname.Text = txtUserName.Text;
    //                        //lblEnterContactError.InnerText = "";
    //                        divEnterContactSearch.Visible = false;
    //                        divEnterContactData.Visible = true;

    //                        Msg_Error.Visible = false;
    //                        Msg_Success.Visible = false;
    //                    }
    //                    else
    //                    {


    //                        divEnterContactSearch.Visible = false;
    //                        divEnterContactData.Visible = false;

    //                        divAddEnterContact.Visible = true;
    //                        btnSaveEdit.Visible = false;
    //                        btnSave.Visible = true;
    //                        txtHandPhone1.Text = txtMobileNo.Text;
    //                        txtFirstname.Text = txtUserName.Text;
    //                    }
    //                }
    //                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);

    //            }
    //            else
    //            {
    //                Response.Redirect("Login.aspx");
    //            }

                
    //        }
           

    //    }
    //    catch (Exception ex)
    //    {

    //        Msg_Error.Visible = true;
    //        Msg_Success.Visible = false;
    //        lblerror.Text = ex.ToString();
    //    }
       
            
           
    //}

    
    
    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
    //    try
    //    {
            
            
    //        if (ddlContactSource.SelectedIndex == 0)
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Select Contact Sourse";

    //            return;
    //        }




    //        if (txtFirstname.Text.Trim() == "")
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Enter First Name";

    //            return;
    //        }

    //        if (txtMiddleName.Text.Trim() == "")
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Enter Middle Name";

    //            return;
    //        }

    //        if (txtLastName.Text.Trim() == "")
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Enter Last name";

    //            return;
    //        }

            

            

    //        if (ddlGender.SelectedIndex == 0)
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Select Gender";

    //            return;
    //        }

    //        if (txtDOB.Value.Trim() == "")
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Enter Date Of Birth";

    //            return;
    //        }

    //        if (txtEmailId.Text.Trim() == "")
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Enter Email Id";

    //            return;
    //        }

    //        if (txtHandPhone1.Text.Trim() == "")
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Enter Handphone1";

    //            return;
    //        }

    //        if (txtHandPhone1.Text.Length < 10)
    //        {
    //            Msg_Error.Visible = true;
    //            Msg_Success.Visible = false;
    //            lblerror.Text = "Mobile Number length must be between 10 to 12 characters";

    //            return;
    //        }



    //        HttpCookie LoginInfo = new HttpCookie("CRMCookiesLoginInfo");
    //        string Username = Request.Form["UserName"];
    //        string password = Request.Form["Password"];
    //        string UserId = Request.Form["UserID"];


    //        DataSet ds = CRM_Controller.CRM_Insert_Contacts_Detail(1, "", ddlContactSource.SelectedValue, "", "", "", "", "", txtFirstname.Text.Trim(), txtMiddleName.Text.Trim(), txtLastName.Text.Trim(), ddlGender.SelectedValue, txtDOB.Value.Trim(), txtHandPhone1.Text.Trim(), txtEmailId.Text.Trim(), txtAddress1.Text.Trim(), txtAddress2.Text.Trim(), txtStreet.Text.Trim(), "", UserId);

    //        if (ds != null)
    //        {
    //            if (ds.Tables.Count > 0)
    //            {
    //                if (ds.Tables[0].Rows.Count > 0)
    //                {
    //                    if (ds.Tables[0].Rows[0]["ErrorSaveMessageCode"].ToString() == "1")  //If record save successfully 
    //                    {

    //                        divEnterContactSearch.Visible = true;
    //                        divEnterContactData.Visible = false;
                           
    //                        divAddEnterContact.Visible = false;
    //                        Msg_Error.Visible = false;
    //                        Msg_Success.Visible = true;
    //                        btnSave.Visible = true;
    //                        btnSaveEdit.Visible = false;
    //                        lblerror.Text = "Record Saved Successfully";

    //                    }

    //                    else
    //                    {
    //                        lblerror.Text = "Record Not Saved";
    //                    }
    //                }
    //            }
    //        }
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);

    //    }
    //    catch (Exception ex)
    //    {

    //        Msg_Error.Visible = true;
    //        Msg_Success.Visible = false;
    //        lblerror.Text = ex.ToString();
    //    }
     

    //}
    //protected void btnClose_Click(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);
    //    try
    //    {
    //        Msg_Error.Visible = false;
    //        Msg_Success.Visible = false;
    //        divEnterContactSearch.Visible = false;
    //        divAddEnterContact.Visible = false;
    //        divEnterContactData.Visible = true;
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
    //    }
    //    catch (Exception ex)
    //    {

    //        Msg_Error.Visible = true;
    //        Msg_Success.Visible = false;
    //        lblerror.Text = ex.ToString();
    //    }
       
    //}

    //protected void btnEnterContactClear_Click(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);

    //    try
    //    {
    //        Msg_Error.Visible = false;
    //        Msg_Success.Visible = false;
    //        txtUserName.Text = "";
    //        txtMobileNo.Text = "";
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
    //    }
    //    catch (Exception ex)
    //    {

    //        Msg_Error.Visible = true;
    //        Msg_Success.Visible = false;
    //        lblerror.Text = ex.ToString();
    //    }
       
    //}

    //protected void btnAdd_onclick(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);

    //    try
    //    {
    //        divEnterContactSearch.Visible = false;
    //        divEnterContactData.Visible = false;

    //        divAddEnterContact.Visible = true;
    //        btnSaveEdit.Visible = false;
    //        btnSave.Visible = true;
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
    //    }
    //    catch (Exception ex)
    //    {

    //        Msg_Error.Visible = true;
    //        Msg_Success.Visible = false;
    //        lblerror.Text = ex.ToString();
    //    }

        
    

    //}


    //protected void btnBack_Click(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindStart()", true);

    //    try
    //    {
    //        divEnterContactSearch.Visible = true;
    //        divEnterContactData.Visible = false;

    //        divAddEnterContact.Visible = false;
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CallMyFunction", "bindComplt()", true);
    //    }
    //    catch (Exception ex)
    //    {

    //        Msg_Error.Visible = true;
    //        Msg_Success.Visible = false;
    //        lblerror.Text = ex.ToString();
    //    }
       

    //}


    

   

    
}