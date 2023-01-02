using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using ShoppingCart.BL;
using System.Configuration;

public partial class OE_CRM : System.Web.UI.MasterPage
{
    public string Version = ConfigurationManager.AppSettings["Version"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["CRMCookiesLoginInfo"] != null)
            {
                try
                {
                    BindUserInfo();
                }
                catch (Exception ex)
                {

                }
            }

            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
    private void BindUserInfo()
    {
        HttpCookie cookie = Request.Cookies.Get("CRMCookiesLoginInfo");
        string UserID = cookie.Values["UserID"];
        string UserName = cookie.Values["UserName"];
        if (UserID != "")
        {

            lblUserName.Text = UserName;

        }
    }
}
