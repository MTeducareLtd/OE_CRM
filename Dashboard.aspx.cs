using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Dashboard : System.Web.UI.Page
{
    public string Version = ConfigurationManager.AppSettings["Version"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}