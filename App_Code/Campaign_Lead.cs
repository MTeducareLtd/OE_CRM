using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Collections;
using System.Data;
using ShoppingCart.BL;

/// <summary>
/// Summary description for Campaign_Lead
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class Campaign_Lead : System.Web.Services.WebService {
    [WebMethod]
    public ArrayList BindCampaign(string UserId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetUser_Role_Campaign_count_lead(5, UserId);
            var Campaign_Count = ds.Tables[0].Rows.Count.ToString();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        CampaignId = drContactDetails["Campaign_Id"].ToString(),
                        Campaign_Name = drContactDetails["Camp_Name"].ToString(),
                        campaignCount = Campaign_Count
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
    public ArrayList BindAcadYear()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetAllActiveUser_AcadYear();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        AcadYearId = drContactDetails["id"].ToString(),
                        AcadYearDesc = drContactDetails["Description"].ToString()
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
    public ArrayList BindInstitutionType()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetallInstituteType();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        InstitutionTypeId = drContactDetails["ID"].ToString(),
                        InstitutionTypeDesc = drContactDetails["Description"].ToString()
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
    public ArrayList BindBoard()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetallBoard();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drBoardDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        BoardId = drBoardDetails["ID"].ToString(),
                        BoardDesc = drBoardDetails["Short_Description"].ToString()
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
    public ArrayList BindStandard(string InstitutionType)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {
            DataSet ds = new DataSet();

            ds = CRM_Controller.GetallCurrentStudyingin(InstitutionType);

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Standard_code = drContactDetails["ID"].ToString(),
                        Standard_name = drContactDetails["Description"].ToString()
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
    public ArrayList BindSchoolCollege(string CampaignId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetallSchoolCollege(CampaignId);

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        School_ID = drContactDetails["School_ID"].ToString(),
                        School_Name = drContactDetails["School_Name"].ToString()
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
    public ArrayList BindoldAdmissionCenter(string CampaignId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {
            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_StudentOld_Admission_Center(CampaignId);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drCenterDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Center_code = drCenterDetails["CenterCode"].ToString(),
                        Center_name = drCenterDetails["Source_center_Name"].ToString()
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
    public ArrayList BindCampaignEvents(string CampaignId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {
            DataSet ds = new DataSet();

            ds = CRM_Controller.GetAllCampaignEvents_Feedback_Values(CampaignId, "", "", "1");

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Event_ID = drContactDetails["Campaign_Event_Id"].ToString(),
                        Event_Name = drContactDetails["Event_Name"].ToString()
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
    public ArrayList BindCampaignEvents_Type(string CampaignId, string EventId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {
            DataSet ds = new DataSet();
            ds = CRM_Controller.GetAllCampaignEvents_Feedback_Values(CampaignId, EventId, "", "2");

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Event_TypeID = drContactDetails["Id"].ToString(),
                        Event_TypeDesc = drContactDetails["EventTypeDesc"].ToString()
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
    public ArrayList BindCampaignEvents_Header(string CampaignId, string EventId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {
            DataSet ds = new DataSet();
            ds = CRM_Controller.GetAllCampaignEvents_Feedback_Values(CampaignId, EventId, "", "3");

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Campaign_Event_Feedback_Id = drContactDetails["Campaign_Event_Feedback_Id"].ToString(),
                        Feedback_Header = drContactDetails["Feedback_Header"].ToString()
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
    public ArrayList BindCampaignEvents_Header_Values(string CampaignId, string EventId, string FeedbackHeaderId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {
            DataSet ds = new DataSet();
            ds = CRM_Controller.GetAllCampaignEvents_Feedback_Values(CampaignId, EventId, FeedbackHeaderId, "4");

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        FeedbackValueId = drContactDetails["FeedbackValueId"].ToString(),
                        FeedbackValue = drContactDetails["FeedbackValue"].ToString()
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
    public ArrayList BindExamName()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetallExamName();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Exam_ID = drContactDetails["Exam_ID"].ToString(),
                        Exam_Description = drContactDetails["Exam_Description"].ToString()
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
    public ArrayList BindExamStatus(string ExamId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {
            DataSet ds = new DataSet();

            ds = CRM_Controller.GetExam_Status(ExamId);

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Exam_Status_Id = drContactDetails["Exam_Status_Id"].ToString(),
                        Exam_Status_Description = drContactDetails["Exam_Status_Description"].ToString()
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
    public ArrayList BindDivision(string UserId)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetAllDivision_TabStagging(UserId);

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Source_Division_Code = drContactDetails["Source_Division_Code"].ToString(),
                        Source_Division_ShortDesc = drContactDetails["Source_Division_ShortDesc"].ToString()
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
    public ArrayList BindCenter(string Division)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetAllCenter_By_Division(Division, 1);

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        center_code = drContactDetails["center_code"].ToString(),
                        center_name = drContactDetails["center_name"].ToString()
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
    public ArrayList BindSalesStage()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetSalesStage(1);

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Sales_Id = drContactDetails["Sales_Id"].ToString(),
                        Sales_Stage_Desc = drContactDetails["Sales_Stage_Desc"].ToString()
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
    public ArrayList BindProduct(string Center, string AcadYear)
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetProductby_Center_AcademicYear(Center, AcadYear);

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        stream_code = drContactDetails["stream_code"].ToString(),
                        stream_sdesc = drContactDetails["stream_sdesc"].ToString()
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
    public ArrayList BindPayPlan()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetAllPayplan();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Pay_Plan_Code = drContactDetails["Pay_Plan_Code"].ToString(),
                        Pay_Plan_Description = drContactDetails["Pay_Plan_Description"].ToString()
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
    public ArrayList BindOptionalSubject(string Product, string Center)
    {
        ArrayList lstSubjectDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetSubjectsbyStreamCode(5, Product, Center);

            string count = ds.Tables[0].Rows.Count.ToString();

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drSubjectDetails in ds.Tables[0].Rows)
                {
                    lstSubjectDetail.Add(new
                    {
                        rowcount = count.ToString(),
                        SGR_DESC = drSubjectDetails["SGR_DESC"].ToString(),
                        sgr_material = drSubjectDetails["sgr_material"].ToString(),
                        voucher_amount = drSubjectDetails["voucher_amount"].ToString(),
                        sgr_sel_group = drSubjectDetails["sgr_sel_group"].ToString(),
                        voucher_typ = drSubjectDetails["voucher_typ"].ToString(),
                        uom = drSubjectDetails["uom"].ToString(),
                        uom_base_name = drSubjectDetails["uom_base_name"].ToString(),
                        uom_value = drSubjectDetails["uom_value"].ToString(),
                        voucher_mode = drSubjectDetails["voucher_mode"].ToString()


                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstSubjectDetail;
    }

    [WebMethod]
    public ArrayList BindInteractedRel()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetInteractedWith();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        InteractedWithId = drContactDetails["id"].ToString(),
                        InteractedWithDescription = drContactDetails["description"].ToString()
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
    public ArrayList BindCampusFollowUp()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetCampusFollowUp();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        FollowUpId = drContactDetails["id"].ToString(),
                        FollowUpDescription = drContactDetails["description"].ToString()
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
    public ArrayList BindCampaign_LostFollowupResons()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetCampaign_LostFollowUp_Reasons();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Id = dr["id"].ToString(),
                        Description = dr["description"].ToString()
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
    public ArrayList BindCampaign_Followup_Remark_Conclusion()
    {
        ArrayList bindDropDown = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetCampaign_Followup_Remark_Conclusion();

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    bindDropDown.Add(new
                    {
                        Id = dr["id"].ToString(),
                        Description = dr["description"].ToString()
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
    public ArrayList BindFeeStructure(string Oppurid)
    {
        ArrayList lstFeeDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetFeesComponent(2, Oppurid);

            string count = ds.Tables[0].Rows.Count.ToString();

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drSubjectDetails in ds.Tables[0].Rows)
                {
                    lstFeeDetail.Add(new
                    {
                        rowcount = count.ToString(),
                        Voucher_Description = drSubjectDetails["Voucher_Description"].ToString(),
                        Final_Voucher_Amount = drSubjectDetails["Final_Voucher_Amount"].ToString()

                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstFeeDetail;
    }

    [WebMethod]
    public ArrayList AcadyearDivisionCenterDetail(string Lead_Id)
    {
        ArrayList lstContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_AcadyearDivisionCenter(1, Lead_Id);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstContactDetail.Add(new
                    {
                        Expected_Join_AcadYear = drContactDetails["Expected_Join_AcadYear"].ToString(),
                        Contact_Target_Division = drContactDetails["Contact_Target_Division"].ToString(),
                        Contact_Target_Center = drContactDetails["Contact_Target_Center"].ToString(),
                        StudentName = drContactDetails["StudentName"].ToString(),
                        Gender = drContactDetails["Gender"].ToString(),
                        Handphone1 = drContactDetails["Handphone1"].ToString(),
                        Emailid = drContactDetails["Emailid"].ToString(),
                        Campaign_Name = drContactDetails["Campaign_Name"].ToString()

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
    public ArrayList GetOpportunityDetail(string Opportunity_Id)
    {
        ArrayList lstContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_OpportunityDetailByOpportunityCode(1, Opportunity_Id);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstContactDetail.Add(new
                    {
                        Acad_Year = drContactDetails["Acad_Year"].ToString(),
                        Opp_Contact_Division = drContactDetails["Opp_Contact_Division"].ToString(),
                        Opp_Contact_Center = drContactDetails["Opp_Contact_Center"].ToString(),
                        Oppor_Product_Id = drContactDetails["Oppor_Product_Id"].ToString(),
                        SalesStage_Id = drContactDetails["SalesStage_Id"].ToString(),
                        Opp_Expected_Close_Date = drContactDetails["Opp_Expected_Close_Date"].ToString(),
                        Opp_Probability_Percent = drContactDetails["Opp_Probability_Percent"].ToString(),
                        StudentName = drContactDetails["StudentName"].ToString(),
                        Gender = drContactDetails["Gender"].ToString(),
                        DOB = drContactDetails["DOB"].ToString(),
                        Handphone1 = drContactDetails["Handphone1"].ToString(),
                        Emailid = drContactDetails["Emailid"].ToString(),
                        Campaign = drContactDetails["Campaign"].ToString(),
                        Campaign_Name = drContactDetails["Campaign_Name"].ToString(),
                        Oppor_Product = drContactDetails["Oppor_Product"].ToString()



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
    public ArrayList ContactDetail(string Campaign, string MobileNo, string UserId)
    {
        ArrayList lstContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_CONTACTDETAILS(1, Campaign, MobileNo, UserId);

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
                        campaign = drContactDetails["Campaign"].ToString(),
                        Lead_Code = drContactDetails["Lead_Code"].ToString(),
                        Opportunity_Code = drContactDetails["Opportunity_Code"].ToString(),
                        Record_Code = drContactDetails["Record_No"].ToString(),
                        LeadFlag = drContactDetails["LeadFlag"].ToString(),
                        opportunityFlag = drContactDetails["opportunityFlag"].ToString(),
                        AdmissionFlag = drContactDetails["AdmissionFlag"].ToString(),
                        campaignName = drContactDetails["Campaign_Name"].ToString(),
                        ConAndCampaignid = drContactDetails["ConAndCampaignid"].ToString()
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
    public ArrayList CampaignSaveDetail(string Lead_id, string Sales_Stage, string Opp_Expected_Close_Date, string Opp_Probability_Percent, string Opp_Contact_Division, string Opp_Contact_Center, string Opp_Contact_AssignTo, string Created_By, string Oppor_Product, string Oppor_Product_Id, string acad_year)
    {
        ArrayList lstSaveCampaignDetail = new ArrayList();
        try
        {

            string OppId = "";
            string Product_Category = "Classroom Coaching";
            string Product_Code = "PPG01";
            string SalesStage_Id = "SC001";
            string SalesStage_Desc = "Direct Walk-In";


            OppId = CRM_Controller.Insert_Convert_Lead_To_Opportunity_CRM("", "", "", Lead_id, Product_Category, Product_Code, Sales_Stage, "", Opp_Expected_Close_Date, Opp_Probability_Percent, "", 0, 0, "", Opp_Contact_Division, Opp_Contact_Center, "", "", Opp_Contact_AssignTo, Created_By, "", "", "", Oppor_Product, Oppor_Product_Id, "", "", acad_year, SalesStage_Id, SalesStage_Desc, "", "", "", "", "", "", "", "", "", "");



            lstSaveCampaignDetail.Add(new
            {
                Oppur_Id = OppId
            });



        }
        catch (Exception ex)
        {


        }

        return lstSaveCampaignDetail;
    }

    [WebMethod]
    public ArrayList FollowupSaveDetail(string Record_Id, string Interacted_With, string Interacted_Relation, string Feedback, string Updated_By, string NextFollowupDate, string CampaignFollowup__Status, string LostFollowup_Reason, string Remark_Conclusion)
    {
        ArrayList lstSaveFollowupDetail = new ArrayList();
        try
        {

            string FeedbackId = "", CampaignContactCode = "Blank", LeadCode = "Blank", OpportunityCode = "Blank", Accountid = "Blank";

            string Intracted_On = DateTime.Now.ToString("dd-MM-yyyy");

            FeedbackId = CRM_Controller.InsertFeedback_Campaign_ContactsNew("", "", "", Record_Id, Interacted_With, Interacted_Relation, Intracted_On, Feedback, "", CampaignFollowup__Status, Updated_By, "", NextFollowupDate, LostFollowup_Reason, Remark_Conclusion, "1");

            if (FeedbackId != "")
            {
                DataSet ds = new DataSet();
                ds = CRM_Controller.GetStudentDeatils(2, Record_Id);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    CampaignContactCode = ds.Tables[0].Rows[0]["Campaign_Contact_Code"].ToString();
                    LeadCode = ds.Tables[0].Rows[0]["Lead_Code"].ToString();
                    OpportunityCode = ds.Tables[0].Rows[0]["Opportunity_Code"].ToString();
                    Accountid = ds.Tables[0].Rows[0]["Account_id"].ToString();
                }

            }

            lstSaveFollowupDetail.Add(new
            {
                Feedback_Id = FeedbackId,
                Campaign_Contact_Code = CampaignContactCode,
                Lead_Code = LeadCode,
                Opportunity_Code = OpportunityCode,
                Account_id = Accountid
            });
        }
        catch (Exception ex)
        {


        }

        return lstSaveFollowupDetail;
    }

    [WebMethod]
    public ArrayList Enrollment(string Userid, string Opp_Id)
    {
        ArrayList lstEnrollment = new ArrayList();
        try
        {

            string StudentId = "";

            string Enrollon = System.DateTime.Now.ToString("dd-MM-yyyy");

            StudentId = CRM_Controller.enrollstudent1(Enrollon, Userid, Opp_Id, "");



            lstEnrollment.Add(new
            {
                StudentId = StudentId
            });



        }
        catch (Exception ex)
        {


        }

        return lstEnrollment;
    }

    [WebMethod]
    public ArrayList DeletePricingprocedurevaluebyopp(string Opp_Id)
    {
        ArrayList lstDeletePricingprocedurevaluebyopp = new ArrayList();
        try
        {
            CRM_Controller.DeletePricingprocedurevaluebyoppid(Opp_Id, 1);

            lstDeletePricingprocedurevaluebyopp.Add(new
            {
                Result = "1"
            });

        }
        catch (Exception ex)
        {
        }
        return lstDeletePricingprocedurevaluebyopp;
    }

    [WebMethod]
    public ArrayList InserttoGetPricingprocedurevalue(string Oppid, string Materialcode, string Voucher_type, string Voucher_Amt, string Uomid, string Uomname, string Unit, string Quantity, string Amount, string Remarks)
    {
        ArrayList lstInserttoGetPricingprocedurevalue = new ArrayList();
        try
        {
            string Doc_type = "DC05";
            CRM_Controller.InserttoGetPricingprocedurevaluebyoppid(Oppid, Materialcode, Voucher_type, Voucher_Amt, Uomid, Uomname, Unit, Quantity, Amount, Remarks, Doc_type, 1);

            lstInserttoGetPricingprocedurevalue.Add(new
            {
                Result = "1"
            });

        }
        catch (Exception ex)
        {
        }
        return lstInserttoGetPricingprocedurevalue;
    }

    [WebMethod]
    public ArrayList GetPricingprocedureValue_New(string Oppid, string Materialcode, int flag)
    {
        ArrayList lstGetPricingprocedureValue_New = new ArrayList();
        try
        {
            string Doc_type = "DC05";
            DataSet ds = new DataSet();

            ds = CRM_Controller.GetPricingprocedureHeaderValue_New(Oppid, Materialcode, "", "", "", "", "", "", "", "", Doc_type, flag);


            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstGetPricingprocedureValue_New.Add(new
                    {
                        Result = "1"


                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstGetPricingprocedureValue_New;
    }

    [WebMethod]
    public ArrayList ViewContactDetail(string ConId)
    {
        ArrayList lstEnterContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_ENTERCONTACT_DETAILS(2, ConId);

            //string Con_Id = ds.Tables[0].Rows[0]["Con_Id"].ToString();

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drStudentDetails in ds.Tables[0].Rows)
                {
                    lstEnterContactDetail.Add(new
                    {

                        ContactSource = drStudentDetails["ContactSource"].ToString(),
                        StudentName = drStudentDetails["StudentName"].ToString(),
                        FirstName = drStudentDetails["FirstName"].ToString(),
                        MiddleName = drStudentDetails["MiddleName"].ToString(),
                        LastName = drStudentDetails["LastName"].ToString(),
                        Gender = drStudentDetails["Gender"].ToString(),
                        DOB = drStudentDetails["DOB"].ToString(),
                        Handphone1 = drStudentDetails["Handphone1"].ToString(),
                        Emailid = drStudentDetails["Emailid"].ToString(),
                        Campaign = drStudentDetails["Campaign_Name"].ToString()

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
    public ArrayList ViewMoreContactDetails(string ConId)
    {
        ArrayList lstMoreContactDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_ENTERCONTACT_DETAILS(3, ConId);

            //string Con_Id = ds.Tables[0].Rows[0]["Con_Id"].ToString();

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drStudentDetails in ds.Tables[0].Rows)
                {
                    lstMoreContactDetail.Add(new
                    {
                        StudentName = drStudentDetails["StudentName"].ToString(),
                        Seminar_UID_No = drStudentDetails["Seminar_UID_No"].ToString(),
                        BoardName = drStudentDetails["BoardName"].ToString(),
                        Category_Type = drStudentDetails["Category_Type"].ToString(),
                        Handphone1 = drStudentDetails["Handphone1"].ToString(),
                        Handphone2 = drStudentDetails["Handphone2"].ToString(),
                        FatherName = drStudentDetails["FatherName"].ToString(),
                        FatherHandphone1 = drStudentDetails["FatherHandphone1"].ToString(),
                        FatherHandphone2 = drStudentDetails["FatherHandphone2"].ToString(),
                        RCO_Marks = drStudentDetails["RCO_Marks"].ToString(),
                        Exam_Rank = drStudentDetails["Exam_Rank"].ToString(),
                        NextFollowupDate = drStudentDetails["NextFollowupDate"].ToString(),
                        CurrentStatus = drStudentDetails["CurrentStatus"].ToString()
                    });
                }
            }

        }
        catch (Exception ex)
        {


        }
        return lstMoreContactDetail;
    }


    [WebMethod]
    public ArrayList ViewStudentDetail(string RecordId)
    {
        ArrayList lstStudentDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetStudentDeatils(1, RecordId);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drStudentDetails in ds.Tables[0].Rows)
                {
                    lstStudentDetail.Add(new
                    {


                        StudentName = drStudentDetails["StudentName"].ToString(),
                        Gender = drStudentDetails["Gender"].ToString(),
                        Handphone1 = drStudentDetails["Handphone1"].ToString(),
                        Emailid = drStudentDetails["Emailid"].ToString(),
                        Campaign = drStudentDetails["Campaign"].ToString(),
                        LeadFlag = drStudentDetails["LeadFlag"].ToString(),
                        opportunityFlag = drStudentDetails["opportunityFlag"].ToString(),
                        AdmissionFlag = drStudentDetails["AdmissionFlag"].ToString()

                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstStudentDetail;
    }

    [WebMethod]
    public ArrayList ViewStudent_CampaignFollowup(string RecordId)
    {
        ArrayList lstStudentFollowupDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetStudentDeatils(3, RecordId);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drStudentDetails in ds.Tables[0].Rows)
                {
                    lstStudentFollowupDetail.Add(new
                    {
                        FollowupDetail = drStudentDetails["FollowupDetail"].ToString(),
                        FollowupDetail1 = drStudentDetails["FollowupDetail1"].ToString()
                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstStudentFollowupDetail;
    }

    [WebMethod]
    public ArrayList ViewStudent_CampaignEventFollowup(string RecordId)
    {
        ArrayList lstStudentEventFollowupDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.GetStudentDeatils(4, RecordId);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drStudentDetails in ds.Tables[0].Rows)
                {
                    lstStudentEventFollowupDetail.Add(new
                    {
                        Event_Name = drStudentDetails["Event_Name"].ToString(),
                        Event_Feedback = drStudentDetails["Feedback"].ToString(),
                        Event_FeedbackValue = drStudentDetails["CampaignEventFeedbackValue"].ToString()
                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstStudentEventFollowupDetail;
    }


    [WebMethod]
    public ArrayList CreateAccount(string Oppid, string MaterialCode, string Paytype, string Userid, int flag2)
    {
        ArrayList lstEnrollment = new ArrayList();
        try
        {
            string Doc_type = "DC05";

            string Accountid = "";
            Accountid = CRM_Controller.CreateAccount(Oppid, MaterialCode, Doc_type, Paytype, Userid, flag2);
            lstEnrollment.Add(new
            {
                Accountid = Accountid
            });



        }
        catch (Exception ex)
        {


        }

        return lstEnrollment;
    }

    [WebMethod]
    public ArrayList LeadSaveDetail(string Lead_campgn_id, string Lead_Con_id, string Contact_Assignto, string Createdby, string Division, string Center, string AcadYear)
    {

        ArrayList lstSaveLeadDetail = new ArrayList();
        try
        {
            string lead_src_id = "03";
            string lead_src_desc = "Walk In";
            string Lead_type_id = "01";
            string Lead_status_id = "05";
            string Lead_status_desc = "Fresh Lead";
            string Contact_Target_Company = "MT";
            string Lead_Type_Desc = "Student";
            string lead_source_desc = "Walk In";
            DateTime Time_join = default(DateTime);
            Time_join = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy"), System.Globalization.CultureInfo.GetCultureInfo("Hi-IN").DateTimeFormat);

            DataSet ds = new DataSet();

            ds = CRM_Controller.Insert_Convert_Contact_To_Lead(lead_src_id, lead_src_desc, Lead_type_id, Lead_status_id, Lead_status_desc, Lead_campgn_id, "", Time_join, Lead_Con_id, "", "", "", "", Contact_Assignto, "", Createdby, Contact_Target_Company, Division, "", Center, 0, "", 0, "", "", Lead_Type_Desc, lead_source_desc, "", 0, AcadYear);


            if (ds != null && ds.Tables.Count != 0)
            {

                lstSaveLeadDetail.Add(new
                {
                    result = ds.Tables[0].Rows[0]["Result"].ToString(),
                    result1 = ds.Tables[0].Rows[0]["Error"].ToString(),
                    LeadId = ds.Tables[0].Rows[0]["lead_no"].ToString()
                });

            }

        }
        catch (Exception ex)
        {


        }

        return lstSaveLeadDetail;
    }


    [WebMethod]
    public ArrayList CampaignCountsDetail(string CampaignId, string userId)
    {
        ArrayList lstCampaignCountsDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_CampaignCountsByCampaignIdAndUserId(1, CampaignId, userId);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstCampaignCountsDetail.Add(new
                    {
                        Campaign_Id = drContactDetails["Campaign_Id"].ToString(),
                        Camp_Name = drContactDetails["Camp_Name"].ToString(),
                        TotalCampaignContacts = drContactDetails["TotalCampaignContacts"].ToString(),
                        AvaibleLeads = drContactDetails["AvaibleLeads"].ToString(),
                        AvailableOpportunity = drContactDetails["AvailableOpportunity"].ToString(),
                        Account = drContactDetails["Account"].ToString(),
                        PendingContacts = drContactDetails["PendingContacts"].ToString(),
                        LostContacts = drContactDetails["LostContacts"].ToString(),
                        TodaysFollowup = drContactDetails["TodaysFollowup"].ToString(),
                        YesterdaysPendingFollowup = drContactDetails["YesterdaysPendingFollowup"].ToString(),
                        Next7DaysFollowup = drContactDetails["Next7DaysFollowup"].ToString(),
                        Prev7DaysFollowup = drContactDetails["Prev7DaysFollowup"].ToString(),
                        Last50touchfollowupFollowup = drContactDetails["Last_50_Touch"].ToString(),
                        UnattemptedContacts = drContactDetails["UnattemptedContacts"].ToString(),
                        CalledbutnotConvertedtoLead = drContactDetails["CalledbutnotConvertedtoLead"].ToString(),
                        TotalFollowupDoneTillDate = drContactDetails["TotalFollowupDoneTillDate"].ToString(),
                        OverDueFollowup = drContactDetails["OverDueFollowup"].ToString()
                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstCampaignCountsDetail;
    }

    [WebMethod]
    public ArrayList CampaignCountsDetailSummary(string CampaignId, string userId)
    {
        ArrayList lstCampaignCountsDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_CampaignCountsByCampaignIdAndUserIdSummary(1, CampaignId, userId);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstCampaignCountsDetail.Add(new
                    {
                        //Campaign_Id = drContactDetails["Campaign_Id"].ToString(),
                        //Camp_Name = drContactDetails["Camp_Name"].ToString(),
                        TotalCampaignContacts = drContactDetails["TotalCampaignContacts"].ToString(),
                        AvaibleLeads = drContactDetails["AvaibleLeads"].ToString(),
                        AvailableOpportunity = drContactDetails["AvailableOpportunity"].ToString(),
                        Account = drContactDetails["Account"].ToString(),
                        PendingContacts = drContactDetails["PendingContacts"].ToString(),
                        LostContacts = drContactDetails["LostContacts"].ToString(),
                        TodaysFollowup = drContactDetails["TodaysFollowup"].ToString(),
                        YesterdaysPendingFollowup = drContactDetails["YesterdaysPendingFollowup"].ToString(),
                        Next7DaysFollowup = drContactDetails["Next7DaysFollowup"].ToString(),
                        Prev7DaysFollowup = drContactDetails["Prev7DaysFollowup"].ToString(),
                        Last50touchfollowupFollowup = drContactDetails["Last_50_Touch"].ToString(),
                        UnattemptedContacts = drContactDetails["UnattemptedContacts"].ToString(),
                        CalledbutnotConvertedtoLead = drContactDetails["CalledbutnotConvertedtoLead"].ToString(),
                        TotalFollowupDoneTillDate = drContactDetails["TotalFollowupDoneTillDate"].ToString(),
                        OverDueFollowup = drContactDetails["OverDueFollowup"].ToString()
                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstCampaignCountsDetail;
    }

    [WebMethod]
    public ArrayList CamapignCountContactDetail(int flag, string CampaignId, string userId)
    {
        ArrayList lstAvailableleadsDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_CampaignCountsByCampaignIdAndUserId(flag, CampaignId, userId);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstAvailableleadsDetail.Add(new
                    {
                        Student_Name = drContactDetails["Student_Name"].ToString(),
                        Gender = drContactDetails["Gender"].ToString(),
                        Handphone1 = drContactDetails["Handphone1"].ToString(),
                        Emailid = drContactDetails["Emailid"].ToString(),
                        Con_Id = drContactDetails["Con_Id"].ToString(),
                        contact_Source = drContactDetails["contact_Source"].ToString(),
                        Campaign = drContactDetails["Campaign"].ToString(),
                        campaignName = drContactDetails["Campaign_Name"].ToString(),
                        LeadFlag = drContactDetails["LeadFlag"].ToString(),
                        opportunityFlag = drContactDetails["opportunityFlag"].ToString(),
                        AdmissionFlag = drContactDetails["AdmissionFlag"].ToString()

                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstAvailableleadsDetail;
    }

    [WebMethod]
    public ArrayList GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID(int Flag, string CampaignId, string UID, string StudentName, string InstitutionType, string CategoryType, string Centername, int PageNo, string ContactNo, string Standard_Id, string School_Id, string Exam_Id, string Exam_Status_Id, string Exam_From_Rank, string Exam_To_Rank,
            string EventId, string Attendance, string Event_FeedbackHeader_Id, string Event_Feedback_Value_Id,
        string CampStudentUID, string Board_Id, string Followupstatus)
    {
        ArrayList lstAvailableleadsDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID_D(Flag, CampaignId, UID, StudentName, InstitutionType, CategoryType, Centername, PageNo, ContactNo, Standard_Id, School_Id, Exam_Id, Exam_Status_Id, Exam_From_Rank, Exam_To_Rank, EventId, Attendance, Event_FeedbackHeader_Id, Event_Feedback_Value_Id, CampStudentUID, Board_Id, Followupstatus);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstAvailableleadsDetail.Add(new
                    {
                        Student_Name = drContactDetails["Student_Name"].ToString(),
                        inst_desc = drContactDetails["inst_desc"].ToString(),
                        Con_Id = drContactDetails["Con_Id"].ToString(),
                        Handphone1 = drContactDetails["Handphone1"].ToString(),
                        CategoryType = drContactDetails["CategoryType"].ToString(),
                        Centername = drContactDetails["Centername"].ToString(),
                        LastFollowDate = drContactDetails["LastFollowDate"].ToString(),
                        LastRemark = drContactDetails["LastRemark"].ToString(),
                        Lead_Code = drContactDetails["Lead_Code"].ToString(),
                        LeadFlag = drContactDetails["LeadFlag"].ToString(),
                        Opportunity_Code = drContactDetails["Opportunity_Code"].ToString(),
                        opportunityFlag = drContactDetails["opportunityFlag"].ToString(),
                        AdmissionFlag = drContactDetails["AdmissionFlag"].ToString(),
                        Record_Code = drContactDetails["Record_No"].ToString(),
                        BoardName = drContactDetails["BoardName"].ToString(),
                        ConAndCampaignid = drContactDetails["ConAndCampaignid"].ToString(),
                        TotalRecord = ds.Tables[1].Rows[0]["TotalRecord"].ToString(),
                        PrevButtonFlag = ds.Tables[1].Rows[0]["PrevButtonFlag"].ToString(),
                        NextButtonFlag = ds.Tables[1].Rows[0]["NextButtonFlag"].ToString(),
                        ShowingInfo = ds.Tables[1].Rows[0]["ShowingInfo"].ToString()

                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstAvailableleadsDetail;
    }


    [WebMethod]
    public ArrayList GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID_Summary(int Flag, string CampaignId, string UID, string StudentName, string InstitutionType, string CategoryType, string Centername, int PageNo, string ContactNo, string Standard_Id, string School_Id, string Exam_Id, string Exam_Status_Id, string Exam_From_Rank, string Exam_To_Rank,
            string EventId, string Attendance, string Event_FeedbackHeader_Id, string Event_Feedback_Value_Id, string CampStudentUID, string Board_Id)
    {
        ArrayList lstAvailableleadsDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID_Summary(Flag, CampaignId, UID, StudentName, InstitutionType, CategoryType, Centername, PageNo, ContactNo, Standard_Id, School_Id, Exam_Id, Exam_Status_Id, Exam_From_Rank, Exam_To_Rank, EventId, Attendance, Event_FeedbackHeader_Id, Event_Feedback_Value_Id, CampStudentUID, Board_Id);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstAvailableleadsDetail.Add(new
                    {
                        Student_Name = drContactDetails["Student_Name"].ToString(),
                        inst_desc = drContactDetails["inst_desc"].ToString(),
                        Con_Id = drContactDetails["Con_Id"].ToString(),
                        Handphone1 = drContactDetails["Handphone1"].ToString(),
                        CategoryType = drContactDetails["CategoryType"].ToString(),
                        Centername = drContactDetails["Centername"].ToString(),
                        LastFollowDate = drContactDetails["LastFollowDate"].ToString(),
                        LastRemark = drContactDetails["LastRemark"].ToString(),
                        Lead_Code = drContactDetails["Lead_Code"].ToString(),
                        LeadFlag = drContactDetails["LeadFlag"].ToString(),
                        Opportunity_Code = drContactDetails["Opportunity_Code"].ToString(),
                        opportunityFlag = drContactDetails["opportunityFlag"].ToString(),
                        AdmissionFlag = drContactDetails["AdmissionFlag"].ToString(),
                        Record_Code = drContactDetails["Record_No"].ToString(),
                        BoardName = drContactDetails["BoardName"].ToString(),
                        ConAndCampaignid = drContactDetails["ConAndCampaignid"].ToString(),
                        TotalRecord = ds.Tables[1].Rows[0]["TotalRecord"].ToString(),
                        PrevButtonFlag = ds.Tables[1].Rows[0]["PrevButtonFlag"].ToString(),
                        NextButtonFlag = ds.Tables[1].Rows[0]["NextButtonFlag"].ToString(),
                        ShowingInfo = ds.Tables[1].Rows[0]["ShowingInfo"].ToString()

                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstAvailableleadsDetail;
    }

    //Campaign Report
    [WebMethod]
    public ArrayList CampaignReport(string UserId)
    {
        ArrayList CampaignReportDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.Get_Campaign_Report(1, UserId);

            if (ds != null && ds.Tables.Count != 0)
            {

                foreach (DataRow drCampaignDetails in ds.Tables[0].Rows)
                {
                    CampaignReportDetail.Add(new
                    {
                        CampaignId = drCampaignDetails["Campaign_Id"].ToString(),
                        Campaign_Name = drCampaignDetails["Camp_Name"].ToString(),
                        TotalContacts = drCampaignDetails["TotalCampaignContacts"].ToString(),
                        NotCalledEvenOnce = drCampaignDetails["NotCalledEvenOnce"].ToString(),
                        CalledbutnotConvertedtoLead = drCampaignDetails["CalledbutnotConvertedtoLead"].ToString(),
                        AvailableLeads = drCampaignDetails["AvailableLeads"].ToString(),
                        AvailableOpportunity = drCampaignDetails["AvailableOpportunity"].ToString(),
                        Account = drCampaignDetails["Account"].ToString(),
                        LostContacts = drCampaignDetails["LostContacts"].ToString(),
                        TodaysFollowup = drCampaignDetails["TodaysFollowup"].ToString(),
                        YesterdaysPendingFollowup = drCampaignDetails["YesterdaysPendingFollowup"].ToString(),
                        Next7DaysFollowup = drCampaignDetails["Next7DaysFollowup"].ToString(),
                        Prev7DaysFollowup = drCampaignDetails["Prev7DaysFollowup"].ToString(),
                        Next30DaysFollowup = drCampaignDetails["Next30DaysFollowup"].ToString(),
                        Prev30DaysFollowup = drCampaignDetails["Prev30DaysFollowup"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
        }

        return CampaignReportDetail;
    }

    //Campaign Report
    [WebMethod]
    public ArrayList CampaignReportVisibility(string UserId)
    {
        ArrayList CampaignReportVisibility = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.Get_Campaign_Report(2, UserId);

            if (ds != null && ds.Tables.Count != 0)
            {
                CampaignReportVisibility.Add(new
                {
                    ReportVisible = ds.Tables[0].Rows[0]["ReportVisible"].ToString()
                });
            }
        }
        catch (Exception ex)
        {
        }

        return CampaignReportVisibility;
    }

    /// <summary>
    /// Code for Working Page
    /// </summary>
    /// <param name="CampaignId"></param>
    /// <param name="userId"></param>
    /// <returns></returns>
    [WebMethod]
    public ArrayList CampaignsDetailwm(string CampaignId, string userId)
    {
        ArrayList lstCampaignCountsDetail = new ArrayList();
        try
        {

            DataSet ds = new DataSet();

            ds = CRM_Controller.CRM_GET_CampaignWMByCampaignIdAndUserId(1, CampaignId, userId);

            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drContactDetails in ds.Tables[0].Rows)
                {
                    lstCampaignCountsDetail.Add(new
                    {
                        Campaign_Id = drContactDetails["Campaign_Id"].ToString(),
                        CampaignName = drContactDetails["CampaignName"].ToString(),
                        StudentName = drContactDetails["StudentName"].ToString(),
                        PreviousCenter = drContactDetails["PreviousCenter"].ToString(),
                        Institution = drContactDetails["Institution"].ToString(),
                        RCO_Score = drContactDetails["RCO_Score"].ToString(),
                        LatestFollowupClosureRemark = drContactDetails["LatestFollowupClosureRemark"].ToString(),
                        ContactStatus = drContactDetails["ContactStatus"].ToString(),
                        Interacted_On = drContactDetails["Interacted_On"].ToString(),
                        Username = drContactDetails["Username"].ToString(),
                        Contacts_Id = drContactDetails["Contacts_Id"].ToString(),
                        Event_Name1 = drContactDetails["Event_Name1"].ToString(),
                        Attendstatus1 = drContactDetails["Attendstatus1"].ToString(),
                        CampaignEventFeedbackValue1 = drContactDetails["CampaignEventFeedbackValue1"].ToString(),
                        Event_Name2 = drContactDetails["Event_Name2"].ToString(),
                        Attendstatus2 = drContactDetails["Attendstatus2"].ToString(),
                        CampaignEventFeedbackValue2 = drContactDetails["CampaignEventFeedbackValue2"].ToString(),
                        Event_Name3 = drContactDetails["Event_Name3"].ToString(),
                        Attendstatus3 = drContactDetails["Attendstatus3"].ToString(),
                        CampaignEventFeedbackValue3 = drContactDetails["CampaignEventFeedbackValue3"].ToString(),
                        Event_Name4 = drContactDetails["Event_Name4"].ToString(),
                        Attendstatus4 = drContactDetails["Attendstatus4"].ToString(),
                        CampaignEventFeedbackValue4 = drContactDetails["CampaignEventFeedbackValue4"].ToString(),
                        Record_No = drContactDetails["Record_No"].ToString()

                    });
                }
            }

        }
        catch (Exception ex)
        {


        }

        return lstCampaignCountsDetail;
    }

    [WebMethod]
    public ArrayList Getcallingdetails(string ConId)
    {
        ArrayList lstMoreContactDetail = new ArrayList();
        try
        {
            DataSet ds = new DataSet();
            ds = CRM_Controller.CRM_GET_ENTERCONTACT_DETAILS(4, ConId);
            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drStudentDetails in ds.Tables[0].Rows)
                {
                    lstMoreContactDetail.Add(new
                    {

                        Shandphone1 = drStudentDetails["Handphone1"].ToString(),
                        Shandphone2 = drStudentDetails["Handphone2"].ToString(),
                        Slandline = drStudentDetails["Landline"].ToString(),
                        Campaignid = drStudentDetails["Campaign"].ToString(),
                        Campaignname = drStudentDetails["Campaign_Name"].ToString(),
                        Record_No = drStudentDetails["Record_No"].ToString()
                    });
                }
            }
        }
        catch (Exception ex)
        {
        }
        return lstMoreContactDetail;
    }

    [WebMethod]
    public ArrayList GetUserCallingExtension(string Userid)
    {
        ArrayList lstMoreContactDetail = new ArrayList();
        try
        {
            DataSet ds = new DataSet();
            ds = CRM_Controller.CRM_GET_USER_CALLING_EXTENSION(1, Userid);
            if (ds != null && ds.Tables.Count != 0)
            {
                foreach (DataRow drStudentDetails in ds.Tables[0].Rows)
                {
                    lstMoreContactDetail.Add(new
                    {

                        Username = drStudentDetails["User_Display_Name"].ToString(),
                        Agentid = drStudentDetails["Agent_Id"].ToString(),

                    });
                }
            }
        }
        catch (Exception ex)
        {
        }
        return lstMoreContactDetail;
    }


    [WebMethod]
    public ArrayList SaveCallLog(int Flag, string Mode_ID, string Mode_Name, string Phase, string Feedback_ID,
                string Contact_Type_ID_Called, string Contact_Number_Called, string Contact_Id, string Lead_Opportunity_ID,
                string Lead_Name, string Campaign_Id, string Campaign_Name, string Process_Id, string Process_Name,
                string User_Id, string CRUD, string Recording_Link, string LegType, string SNUD, string OTUD,
                string Agent_User_Extension_Used, string TXST, string MOC, string Call_Start_Time, string Call_End_Time,
                string Total_Call_Duration, string Call_Status)
    {

        ArrayList lstSavecalllog = new ArrayList();
        try
        {
            DataSet ds = new DataSet();
            ds = CRM_Controller.Insert_Update_Calling_Info(1, Mode_ID, Mode_Name, Phase, Feedback_ID, Contact_Type_ID_Called, Contact_Number_Called, Contact_Id, Lead_Opportunity_ID, Lead_Name, Campaign_Id, Campaign_Name, Process_Id, Process_Name, User_Id, CRUD, Recording_Link, LegType, SNUD, OTUD, Agent_User_Extension_Used, TXST, MOC, Call_Start_Time, Call_End_Time, Total_Call_Duration, Call_Status);
            if (ds != null && ds.Tables.Count != 0)
            {

                lstSavecalllog.Add(new
                {
                    result = ds.Tables[0].Rows[0]["Result"].ToString(),
                });
            }
        }
        catch (Exception ex)
        {
        }
        return lstSavecalllog;
    }

    
}
