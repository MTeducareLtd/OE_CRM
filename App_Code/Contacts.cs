using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Collections;
using System.Data;
using ShoppingCart.BL;

/// <summary>
/// Summary description for Contacts
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class Contacts : System.Web.Services.WebService {

    [WebMethod]
    public  ArrayList ContactDetail(string UserName1, string MobileNo)
    {
        ArrayList lstContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_CONTACT_DETAILS(1, UserName1, MobileNo);

            string count = ds.Tables[0].Rows.Count.ToString();

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstContactDetail.Add(new
                    {
                        rowcount = count.ToString(),
                        Student_Name = drContactDetails["Student_Name"].ToString(),
                        contact_Source = drContactDetails["contact_Source"].ToString(),
                        Gender = drContactDetails["Gender"].ToString(),
                        Handphone1 = drContactDetails["Handphone1"].ToString(),
                        Emailid = drContactDetails["Emailid"].ToString(),
                        Con_Id = drContactDetails["Con_Id"].ToString(),
                        FirstName = drContactDetails["firstname"].ToString()

                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstContactDetail;
    }


    [WebMethod]
    public ArrayList BindContactSource()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetallactiveleadSource();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        SourceId = drContactDetails["id"].ToString(),
                        Source_Name = drContactDetails["description"].ToString()
                    });
                }
            }


        }
        catch (Exception ex)
        {

            //ErrorHandler.LogError("StudentAssessment", "StudentTestSummary", ex);
        }

        return bindDropDown;
    }


    [WebMethod]
    public ArrayList ContactSaveDetail(string ContactSource, string FirstName, string MiddleName, string LastName, string Gender, string DOB, string HandPhone1, string EmailId, string Address1, string Address2, string Street, string UserId)
    {
        ArrayList lstSaveContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_Insert_Contacts_Detail(1, "", ContactSource, "", FirstName, MiddleName, LastName, Gender, DOB, HandPhone1, EmailId, Address1, Address2, Street, UserId,"");

          
            if (ds != null && ds.Tables.Count != 0)
            {

                    lstSaveContactDetail.Add(new
                    {
                       result = ds.Tables[0].Rows[0]["ErrorSaveMessageCode"].ToString(),
                       result1 = ds.Tables[0].Rows[0]["ErrorSaveMessage"].ToString()
                    });
                
            }

        }
        catch (Exception ex)
        {


        }

        return lstSaveContactDetail;
    }

    [WebMethod]
    public ArrayList EnterContactDetail(string ConId)
    {
        ArrayList lstEnterContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_ENTERCONTACT_DETAILS(1, ConId);

            //string Con_Id = ds.Tables[0].Rows[0]["Con_Id"].ToString();

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drEnterContactDetails in ds.Tables[0].Rows)
                {
                    lstEnterContactDetail.Add(new
                    {
                       
                        ContactSource = drEnterContactDetails["ContactSource"].ToString(),
                        FirstName = drEnterContactDetails["FirstName"].ToString(),
                        MiddleName = drEnterContactDetails["MiddleName"].ToString(),
                        LastName = drEnterContactDetails["LastName"].ToString(),
                        Gender = drEnterContactDetails["Gender"].ToString(),
                        DOB = drEnterContactDetails["DOB"].ToString(),
                        Handphone1 = drEnterContactDetails["Handphone1"].ToString(),
                        Emailid = drEnterContactDetails["Emailid"].ToString(),
                        Address1 = drEnterContactDetails["Address1"].ToString(),
                        Address2 = drEnterContactDetails["Address2"].ToString(),
                        Street = drEnterContactDetails["Street"].ToString(),
                        //Campaign = drEnterContactDetails["Campaign"].ToString(),
                        Con_Id = drEnterContactDetails["Con_Id"].ToString(),
                        Contact_Source_Code = drEnterContactDetails["Contact_Source_Code"].ToString(),
                        StudentName = drEnterContactDetails["StudentName"].ToString()
                    });
                }
            }

        }
        catch (Exception ex)  
        {


        }

        return lstEnterContactDetail;
    }

    [WebMethod]
    public ArrayList ContactUpdateDetail(string ConId, string ContactSource, string FirstName, string MiddleName, string LastName, string Gender, string DOB, string HandPhone1, string EmailId, string Address1, string Address2, string Street, string UserId)
    {
        ArrayList lstEditContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_Insert_Contacts_Detail(2, ConId, ContactSource, "", FirstName, MiddleName, LastName, Gender, DOB, HandPhone1, EmailId, Address1, Address2, Street, UserId,"");


            if (ds != null && ds.Tables.Count != 0)
            {

                lstEditContactDetail.Add(new
                {
                    result = ds.Tables[0].Rows[0]["ErrorSaveMessageCode"].ToString(),
                    result1 = ds.Tables[0].Rows[0]["ErrorSaveMessage"].ToString()
                });

            }

        }
        catch (Exception ex)
        {


        }

        return lstEditContactDetail;
    }

    [WebMethod]
    public ArrayList BindCampaign(string UserId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetUser_Role_Campaign(8, UserId, "", "");

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        CampaignId = drContactDetails["Campaign_Id"].ToString(),
                        Campaign_Name = drContactDetails["Camp_Name"].ToString()
                    });
                }
            }


        }
        catch (Exception ex)
        {


        }

        return bindDropDown;
    }

    [WebMethod]
    public ArrayList SaveCampaignDetail(string CON_ID, string Created_By, string Campaign)
    {
        ArrayList lstSaveCampaignDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.InserUpdateCampaign(1, CON_ID, Created_By, Campaign);


            if (ds != null && ds.Tables.Count != 0)
            {

                lstSaveCampaignDetail.Add(new
                {
                    result = ds.Tables[0].Rows[0]["ErrorSaveMessageCode"].ToString()
                    
                });

            }

        }
        catch (Exception ex)
        {


        }

        return lstSaveCampaignDetail;
    }

    [WebMethod]
    public ArrayList UpdateCampaignDetail(string CON_ID, string Created_By, string Campaign)
    {
        ArrayList lstUpdateCampaignDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.InserUpdateCampaign(2, CON_ID, Created_By, Campaign);


            if (ds != null && ds.Tables.Count != 0)
            {

                lstUpdateCampaignDetail.Add(new
                {
                    result = ds.Tables[0].Rows[0]["ErrorSaveMessageCode"].ToString()

                });

            }

        }
        catch (Exception ex)
        {


        }

        return lstUpdateCampaignDetail;
    }


   
    
}
