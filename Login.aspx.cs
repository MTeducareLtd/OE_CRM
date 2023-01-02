using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ShoppingCart.BL;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    public string Version = ConfigurationManager.AppSettings["Version"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}