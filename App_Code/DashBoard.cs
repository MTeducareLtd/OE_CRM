using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Collections;
using System.Data;
using ShoppingCart.BL;

/// <summary>
/// Summary description for DashBoard
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class DashBoard : System.Web.Services.WebService {

    //public DashBoard () {

    //    //Uncomment the following line if using designed components 
    //    //InitializeComponent(); 
    //}


    [WebMethod]
    public ArrayList BindContactCount(string UserId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetUser_Role_Campaign_count(1, UserId);
            //var Campaign_Count = ds.Tables[0].Rows.Count.ToString();

            if (ds != null && ds.Tables.Count != 0)
            {

                //foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                //{
                    bindDropDown.Add(new
                    {
                        //lblCount = drContactDetails["ConatctCount"].ToString(),
                        Lblleadcount = ds.Tables[0].Rows[0]["LEADCOUNT"].ToString(),
                        Lblopportunity = ds.Tables[0].Rows[0]["OPPORTUNITYCOUNT"].ToString(),
                        lblCount = ds.Tables[0].Rows[0]["TOTALCOUNT"].ToString(),
                        lblCamcount = ds.Tables[0].Rows[0]["campaigncount"].ToString(),
                        Lbltodays = ds.Tables[0].Rows[0]["tODAYSFLOWUP"].ToString(),
                        Lbloverdue = ds.Tables[0].Rows[0]["OVERDUEFLLOWUP"].ToString(),
                       
                       
                        
                        
                    });
                //}
            }


        }
        catch (Exception ex)
        {


        }

        return bindDropDown;
    }

    //[WebMethod]
    //public ArrayList BindCampaingCount(string UserId)
    //{
    //    ArrayList bindDropDown = new ArrayList();
    //    try
    //    {

    //        DataSet ds = new DataSet();

    //        ds = CRM_Controller.GetUser_Role_Campaign_count(2, UserId);
    //        //var Campaign_Count = ds.Tables[0].Rows.Count.ToString();

    //        if (ds != null && ds.Tables.Count != 0)
    //        {

    //            foreach (DataRow drContactDetails in ds.Tables[0].Rows)
    //            {
    //                bindDropDown.Add(new
    //                {
    //                    lblCamcount = drContactDetails["Campaign_Id"].ToString(),

    //                });
    //            }
    //        }


    //    }
    //    catch (Exception ex)
    //    {


    //    }

    //    return bindDropDown;
    //}

    //[WebMethod]
    //public ArrayList BindCampaingLeadCount(string UserId)
    //{
    //    ArrayList bindDropDown = new ArrayList();
    //    try
    //    {

    //        DataSet ds = new DataSet();

    //        ds = CRM_Controller.GetUser_Role_Campaign_count_lead(3, UserId);
    //        //var Campaign_Count = ds.Tables[0].Rows.Count.ToString();

    //        if (ds != null && ds.Tables.Count != 0)
    //        {

    //            //foreach (DataRow drContactDetails in ds.Tables[0].Rows)
    //            //{
    //                bindDropDown.Add(new
    //                {
    //                    Lblleadcount = ds.Tables[0].Rows[0]["LEADCOUNT"].ToString(),
    //                    Lblopportunity = ds.Tables[0].Rows[0]["OPPORTUNITYCOUNT"].ToString(),
    //                    Lbloverdue = ds.Tables[0].Rows[0]["LBLoverDueFllowup"].ToString(),
    //                    Lbltodays = ds.Tables[0].Rows[0]["LBLtodaysfallowup"].ToString(),
    //                    lblCount = ds.Tables[0].Rows[0]["ConatctCount"].ToString(),

    //                });
    //            //}
    //        }


    //    }
    //    catch (Exception ex)
    //    {


    //    }

    //    return bindDropDown;
    //}

    //[WebMethod]
    //public ArrayList BindCampaingOPPORTUNITYCount(string UserId)
    //{
    //    ArrayList bindDropDown = new ArrayList();
    //    try
    //    {

    //        DataSet ds = new DataSet();

    //        ds = CRM_Controller.GetUser_Role_Campaign_count_lead(4, UserId);
    //        //var Campaign_Count = ds.Tables[0].Rows.Count.ToString();

    //        if (ds != null && ds.Tables.Count != 0)
    //        {

    //            foreach (DataRow drContactDetails in ds.Tables[0].Rows)
    //            {
    //                bindDropDown.Add(new
    //                {
    //                    Lblopportunity = drContactDetails["OpportunityCOUNT"].ToString(),

    //                });
    //            }
    //        }


    //    }
    //    catch (Exception ex)
    //    {


    //    }

    //    return bindDropDown;
    //}

   }
