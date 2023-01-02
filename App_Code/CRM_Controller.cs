using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Text;
using ShoppingCart.DAL;
using System.Data.SqlClient;
using ShoppingCart.BL;
using System.Configuration;

namespace ShoppingCart.BL
{
    public class CRM_Controller
    {
        public static DataSet GetallactiveleadSource()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllActiveLeadSource"));
        }

        public static DataSet CRM_Insert_Contacts_Detail(int Flag, string CON_ID, string Con_Source_Id, string Con_Title, string Con_FName, string Con_MName, string Con_LName, string Con_Gender, string Con_DOB, string Con_Handphone1, string Con_EmailId, string Con_Address1, string Con_Address2, string Con_Street, string Created_By, string Campaign)
        {
            SqlParameter p1 = new SqlParameter("@Flag", Flag);
            SqlParameter p2 = new SqlParameter("@CON_ID", CON_ID);
            SqlParameter p3 = new SqlParameter("@Con_Source_Id", Con_Source_Id);
            //SqlParameter p4 = new SqlParameter("@Con_Type_Id", Con_Type_Id);
            //SqlParameter p5 = new SqlParameter("@Con_Type_Desc", Con_Type_Desc);
            //SqlParameter p6 = new SqlParameter("@Category_Type_Id", Category_Type_Id);
            //SqlParameter p7 = new SqlParameter("@Category_Type_Desc", Category_Type_Desc);
            SqlParameter p8 = new SqlParameter("@Con_Title", Con_Title);
            SqlParameter p9 = new SqlParameter("@Con_FName", Con_FName);
            SqlParameter p10 = new SqlParameter("@Con_MName", Con_MName);
            SqlParameter p11 = new SqlParameter("@Con_LName", Con_LName);
            SqlParameter p12 = new SqlParameter("@Con_Gender", Con_Gender);
            SqlParameter p13 = new SqlParameter("@Con_DOB", Con_DOB);
            SqlParameter p14 = new SqlParameter("@Con_Handphone1", Con_Handphone1);
            SqlParameter p15 = new SqlParameter("@Con_EmailId", Con_EmailId);
            SqlParameter p16 = new SqlParameter("@Con_Address1", Con_Address1);
            SqlParameter p17 = new SqlParameter("@Con_Address2", Con_Address2);
            SqlParameter p18 = new SqlParameter("@Con_Street", Con_Street);
            //SqlParameter p19 = new SqlParameter("@Con_Country", Con_Country);
            SqlParameter p20 = new SqlParameter("@Created_By", Created_By);
            SqlParameter p21 = new SqlParameter("@Campaign", Campaign);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_Insert_Contacts_Detail", p1, p2, p3,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p20,p21));
        }

        public static DataSet CRM_GET_CONTACT_DETAILS(int flag, string Name, string Mobile_No)
        {
            SqlParameter p1 = new SqlParameter("@flag", flag);
            SqlParameter p2 = new SqlParameter("@Name", Name);
            SqlParameter p3 = new SqlParameter("@Mobile_No", Mobile_No);

            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_CONTACT_DETAILS", p1, p2, p3));
        }

        public static DataSet CRM_GET_CONTACTDETAILS(int flag, string Campaign, string Mobile_No, string UserId)
        {
            SqlParameter p1 = new SqlParameter("@flag", flag);
            SqlParameter p2 = new SqlParameter("@Campaign", Campaign);
            SqlParameter p3 = new SqlParameter("@Mobile_No", Mobile_No);
            SqlParameter p4 = new SqlParameter("@userId", UserId);

            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_CONTACTDETAILS", p1, p2, p3, p4));
        }

        public static DataSet GetAllActiveUser_AcadYear()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetallCurrentYear"));
        }
        
        public static DataSet GetallInstituteType()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllInstituteType"));
        }

        public static DataSet GetallBoard()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetallBoard"));
        }

        public static DataSet GetallCurrentStudyingin(string InstituteTypeid)
        {
            SqlParameter P = new SqlParameter("@Institute_Type_Id", SqlDbType.VarChar);
            P.Value = InstituteTypeid;
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetallCurrentStudyingin", P));
        }

        public static DataSet GetallSchoolCollege(string CampaignId)
        {
            SqlParameter P = new SqlParameter("@CampaignId", SqlDbType.VarChar);
            P.Value = CampaignId;
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllActiveSchoolCollege", P));
        }

        public static DataSet GetAllCampaignEvents_Feedback_Values(string CampaignId, string EventId, string FeedbackId, string flag) 
        {
            SqlParameter P = new SqlParameter("@CampaignId", SqlDbType.VarChar);
            P.Value = CampaignId;
            SqlParameter P1 = new SqlParameter("@EventId", SqlDbType.VarChar);
            P1.Value = EventId;
            SqlParameter P2 = new SqlParameter("@FeedbackId", SqlDbType.VarChar);
            P2.Value = FeedbackId;
            SqlParameter P3 = new SqlParameter("@flag", SqlDbType.VarChar);
            P3.Value = flag;
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_Get_CampaignEvents_FeedbackHeader_FeedbackValues", P, P1, P2, P3));
        }

        public static DataSet GetallExamName()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllActiveExam"));
        }

        public static DataSet GetExam_Status(string ExamId)
        {
            SqlParameter P = new SqlParameter("@ExamId", SqlDbType.VarChar);
            P.Value = ExamId;
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GETALLEXAMSTATUSBYEXAMID", P));
        }

        public static DataSet GetAllDivision_TabStagging(string UserId)
        {
            SqlParameter p1 = new SqlParameter("@UserId", UserId);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "Usp_GetAllDivision_TabStagging", p1));
        }

        public static DataSet GetAllCenter_By_Division(string DivisionCode, int Flag)
        {
            SqlParameter p1 = new SqlParameter("@DivisionCode", DivisionCode);
            SqlParameter p2 = new SqlParameter("@Flag", Flag);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "Usp_GetCenterByDivision_TabStagging", p1, p2));

        }

        public static DataSet GetSalesStage(int Flag)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@flag", SqlDbType.VarChar);
            p[0].Value = Flag;
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetSalesStage", p));
        }

        public static DataSet GetProductby_Center_AcademicYear(string CenterCode, string AcademicYear)
        {
            SqlParameter p = new SqlParameter("@Center_Code", SqlDbType.VarChar);
            p.Value = CenterCode;
            SqlParameter p1 = new SqlParameter("@AcadYear", SqlDbType.VarChar);
            p1.Value = AcademicYear;
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "Usp_getstream_byCenter_Acadyear", p, p1));
        }

        public static DataSet GetAllPayplan()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllPay_Plan"));
        }
        
        public static DataSet GetSubjectsbyStreamCode(int flag, string Stream_Code, string Center_Code)
        {
            SqlParameter p = new SqlParameter("@Flag", SqlDbType.Int);
            p.Value = flag;
            SqlParameter p1 = new SqlParameter("@Stream_Code", SqlDbType.VarChar);
            p1.Value = Stream_Code;
            SqlParameter p2 = new SqlParameter("@Center_Code", SqlDbType.VarChar);
            p2.Value = Center_Code;
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "Usp_GetSubjectby_CenterStream", p, p1, p2));
        }

        public static DataSet CRM_GET_ENTERCONTACT_DETAILS(int flag, string Con_Id)
        {
            SqlParameter p1 = new SqlParameter("@flag", flag);
            SqlParameter p2 = new SqlParameter("@Con_Id", Con_Id);

            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_EnterContact_DETAILS", p1, p2));
        }

        public static DataSet GetUser_Role_Campaign(int Flag, string Userid, string Campaign_Type, string Campaign_Name)
        {
            SqlParameter p = new SqlParameter("@flag", SqlDbType.Int);
            p.Value = Flag;
            SqlParameter p1 = new SqlParameter("@user_id", SqlDbType.VarChar);
            p1.Value = Userid;
            SqlParameter p2 = new SqlParameter("@Campaign_Type", SqlDbType.VarChar);
            p2.Value = Campaign_Type;
            SqlParameter p3 = new SqlParameter("@Campaign_Name", SqlDbType.VarChar);
            p3.Value = Campaign_Name;
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_Get_CampaignDetail", p, p1, p2, p3));
        }

        public static DataSet Insert_Convert_Contact_To_Lead_CRM(string Lead_campgn_id, string Lead_Con_id, string Contact_Assignto, string Last_modified_by, string Createdby, string Contact_Target_Division, string Contact_Target_Center, string Expected_Joining_Acad_Year, string CON_ID_RESPONSE)
        {
            
            SqlParameter p1 = new SqlParameter("@Lead_campgn_id", Lead_campgn_id);
            SqlParameter p2 = new SqlParameter("@Lead_Con_id", Lead_Con_id);
            SqlParameter p3 = new SqlParameter("@Contact_Assignto", Contact_Assignto);
            SqlParameter p4 = new SqlParameter("@Last_modified_by", Last_modified_by);
            SqlParameter p5 = new SqlParameter("@Createdby", Createdby);
            SqlParameter p6 = new SqlParameter("@Contact_Target_Division", Contact_Target_Division);
            SqlParameter p7 = new SqlParameter("@Contact_Target_Center", Contact_Target_Center);
            SqlParameter p8 = new SqlParameter("@Expected_Joining_Acad_Year", Expected_Joining_Acad_Year);
            SqlParameter p9 = new SqlParameter("@CON_ID_RESPONSE", CON_ID_RESPONSE);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_Insert_Convert_Contact_To_Lead_CRM", p1, p2, p3,p4,p5,p6,p7,p8,p9));
        }

        public static string Insert_Convert_Lead_To_Opportunity_CRM(string Oppur_Id, string Opp_Type_Id, string Opp_Name, string Lead_Id, string Product_Category, string Product_Code, string Sales_Stage, string Opp_Join_Date, string Opp_Expected_Close_Date,string Opp_Probability_Percent,string Opp_Next_Step,decimal Opp_Value,decimal Opp_Disc,string Opp_Contact_Company,string Opp_Contact_Division,string Opp_Contact_Center,string Opp_Contact_Zone,string Opp_Contact_Role,string Opp_Contact_AssignTo,string Created_By,string last_Modified_By,string Opp_Status,string Opp_Status_Id,string Oppor_Product,string Oppor_Product_Id,string Oppor_Id_Out,string app_no,string acad_year,string SalesStage_Id,string SalesStage_Desc,string disc_remark,string Is_Branch_Topper,string Branch_Topper_Division,string Branch_Topper_Center,string Is_School_Ranker,string School_Name,string School_Division,string School_Rank,string Apply_Additional_Discount,string Discount_Type)
        {
            SqlParameter[] p = new SqlParameter[40];

            p[0] = new SqlParameter("@Oppur_Id", Oppur_Id);
            p[1] = new SqlParameter("@Opp_Type_Id", Opp_Type_Id);
            p[2] = new SqlParameter("@Opp_Name", Opp_Name);
            p[3] = new SqlParameter("@Lead_Id", Lead_Id);
            p[4] = new SqlParameter("@Product_Category", Product_Category);
            p[5] = new SqlParameter("@Product_Code", Product_Code);
            p[6] = new SqlParameter("@Sales_Stage", Sales_Stage);
            p[7] = new SqlParameter("@Opp_Join_Date", Opp_Join_Date);
            p[8] = new SqlParameter("@Opp_Expected_Close_Date", Opp_Expected_Close_Date);
            p[9] = new SqlParameter("@Opp_Probability_Percent", Opp_Probability_Percent);
            p[10] = new SqlParameter("@Opp_Next_Step", Opp_Next_Step);
            p[11] = new SqlParameter("@Opp_Value", Opp_Value);
            p[12] = new SqlParameter("@Opp_Disc", Opp_Disc);
            p[13] = new SqlParameter("@Opp_Contact_Company", Opp_Contact_Company);
            p[14] = new SqlParameter("@Opp_Contact_Division", Opp_Contact_Division);
            p[15] = new SqlParameter("@Opp_Contact_Center", Opp_Contact_Center);
            p[16] = new SqlParameter("@Opp_Contact_Zone", Opp_Contact_Zone);
            p[17] = new SqlParameter("@Opp_Contact_Role", Opp_Contact_Role);
            p[18] = new SqlParameter("@Opp_Contact_AssignTo", Opp_Contact_AssignTo);
            p[19] = new SqlParameter("@Created_By", Created_By);
            p[20] = new SqlParameter("@last_Modified_By", last_Modified_By);
            p[21] = new SqlParameter("@Opp_Status", Opp_Status);
            p[22] = new SqlParameter("@Opp_Status_Id", Opp_Status_Id);
            p[23] = new SqlParameter("@Oppor_Product", Oppor_Product);
            p[24] = new SqlParameter("@Oppor_Product_Id", Oppor_Product_Id);
            p[25] = new SqlParameter("@Oppor_Id_Out", SqlDbType.VarChar, 50);

            p[26] = new SqlParameter("@app_no", app_no);
            p[27] = new SqlParameter("@acad_year", acad_year);
            p[28] = new SqlParameter("@SalesStage_Id", SalesStage_Id);
            p[29] = new SqlParameter("@SalesStage_Desc", SalesStage_Desc);
            p[30] = new SqlParameter("@disc_remark", disc_remark);
            p[31] = new SqlParameter("@Is_Branch_Topper", Is_Branch_Topper);
            p[32] = new SqlParameter("@Branch_Topper_Division", Branch_Topper_Division);
            p[33] = new SqlParameter("@Branch_Topper_Center", Branch_Topper_Center);
            p[34] = new SqlParameter("@Is_School_Ranker", Is_School_Ranker);
            p[35] = new SqlParameter("@School_Name", School_Name);
            p[36] = new SqlParameter("@School_Division", School_Division);
            p[37] = new SqlParameter("@School_Rank", School_Rank);
            p[38] = new SqlParameter("@Apply_Additional_Discount", Apply_Additional_Discount);
            p[39] = new SqlParameter("@Discount_Type", Discount_Type);

            p[25].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_ConvertLeadToOpportunity", p);
            return (p[25].Value.ToString());

            //SqlParameter p6 = new SqlParameter("@Product_Code", Product_Code);
            //SqlParameter p7 = new SqlParameter("@Sales_Stage", Sales_Stage);
            //SqlParameter p8 = new SqlParameter("@Opp_Join_Date", Opp_Join_Date);
            //SqlParameter p9 = new SqlParameter("@Opp_Expected_Close_Date", Opp_Expected_Close_Date);
            //SqlParameter p10 = new SqlParameter("@Opp_Probability_Percent", Opp_Probability_Percent);
            //SqlParameter p11 = new SqlParameter("@Opp_Next_Step", Opp_Next_Step);
            //SqlParameter p12 = new SqlParameter("@Opp_Value", Opp_Value);
            //SqlParameter p13 = new SqlParameter("@Opp_Disc", Opp_Disc);
            //SqlParameter p14 = new SqlParameter("@Opp_Contact_Company", Opp_Contact_Company);
            //SqlParameter p15 = new SqlParameter("@Opp_Contact_Division", Opp_Contact_Division);
            //SqlParameter p16 = new SqlParameter("@Opp_Contact_Center", Opp_Contact_Center);
            //SqlParameter p17 = new SqlParameter("@Opp_Contact_Zone", Opp_Contact_Zone);
            //SqlParameter p18 = new SqlParameter("@Opp_Contact_Role", Opp_Contact_Role);
            //SqlParameter p19 = new SqlParameter("@Opp_Contact_AssignTo", Opp_Contact_AssignTo);
            //SqlParameter p20 = new SqlParameter("@Created_By", Created_By);
            //SqlParameter p21 = new SqlParameter("@last_Modified_By", last_Modified_By);
            //SqlParameter p22 = new SqlParameter("@Opp_Status", Opp_Status);
            //SqlParameter p23 = new SqlParameter("@Opp_Status_Id", Opp_Status_Id);
            //SqlParameter p24 = new SqlParameter("@Oppor_Product", Oppor_Product);
            //SqlParameter p25 = new SqlParameter("@Oppor_Product_Id", Oppor_Product_Id);
            ////SqlParameter p26 = new SqlParameter("@Oppor_Id_Out", Oppor_Id_Out);
            //SqlParameter p27 = new SqlParameter("@app_no", app_no);
            //SqlParameter p28 = new SqlParameter("@acad_year", acad_year);
            //SqlParameter p29 = new SqlParameter("@SalesStage_Id", SalesStage_Id);
            //SqlParameter p30 = new SqlParameter("@SalesStage_Desc", SalesStage_Desc);
            //SqlParameter p31 = new SqlParameter("@disc_remark", disc_remark);
            //SqlParameter p32 = new SqlParameter("@Is_Branch_Topper", Is_Branch_Topper);
            //SqlParameter p33 = new SqlParameter("@Branch_Topper_Division", Branch_Topper_Division);
            //SqlParameter p34 = new SqlParameter("@Branch_Topper_Center", Branch_Topper_Center);
            //SqlParameter p35 = new SqlParameter("@Is_School_Ranker", Is_School_Ranker);
            //SqlParameter p36 = new SqlParameter("@School_Name", School_Name);
            //SqlParameter p37 = new SqlParameter("@School_Division", School_Division);
            //SqlParameter p38 = new SqlParameter("@School_Rank", School_Rank);
            //SqlParameter p39 = new SqlParameter("@Apply_Additional_Discount", Apply_Additional_Discount);
            //SqlParameter p40 = new SqlParameter("@Discount_Type", Discount_Type);
            
            //return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_ConvertLeadToOpportunity", p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40));
        }

        public static DataSet CRM_GET_AcadyearDivisionCenter(int flag, string Lead_Contact_Code)
        {
            SqlParameter p1 = new SqlParameter("@flag", flag);
            SqlParameter p2 = new SqlParameter("@Lead_Code", Lead_Contact_Code);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_AcadyearDivisionCenter", p1, p2));
        }

        public static DataSet CRM_GET_OpportunityDetailByOpportunityCode(int flag, string Opportunity_Code)
        {
            SqlParameter p1 = new SqlParameter("@flag", flag);
            SqlParameter p2 = new SqlParameter("@Opportunity_Code", Opportunity_Code);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_OpportunityDetailByOpportunityCode", p1, p2));
        }

        public static DataSet GetInteractedWith()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllInteractedWith"));
        }

        public static DataSet GetCampusFollowUp()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllActive_CampaignFollowup_Status"));
        }

        public static DataSet GetCampaign_LostFollowUp_Reasons()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllActive_Lost_CampaignFollowup_Reasons"));
        }

        public static DataSet GetCampaign_Followup_Remark_Conclusion()
        {
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetAllActive_CampaignFollowup_Remark_Conclusion"));
        }

        public static string InsertFeedback_Campaign_ContactsNew(string CallingMode, string Feedbackid, string Taskid, string RecNoOrConID, string Interacted_With, string Interacted_Relation, string Interacted_On, string Feedback, string Feedback_Status, string CampaignFollowupStatus, string Updatedby, string SeminarStatus,
        string NextFollowupdate,string LostFollowupReason,string RemarkConclusion, string Flag)
        {
            SqlParameter[] p = new SqlParameter[17];

            p[0] = new SqlParameter("@feedbackid", Feedbackid);
            p[1] = new SqlParameter("@task_id", Taskid);
            p[2] = new SqlParameter("@Id", RecNoOrConID);          
            p[3] = new SqlParameter("@Interactedwith", Interacted_With);
            p[4] = new SqlParameter("@InteractedRelation", Interacted_Relation);
            p[5] = new SqlParameter("@Interacted_On", Interacted_On);
            p[6] = new SqlParameter("@feedback", Feedback);
            p[7] = new SqlParameter("@Feedback_Status", Feedback_Status);
            p[8] = new SqlParameter("@feedback_Out", SqlDbType.NVarChar, 100);
           
            p[9] = new SqlParameter("@Updated_By", Updatedby);
            p[10] = new SqlParameter("@SeminarStatus", SeminarStatus);
            p[11] = new SqlParameter("@NextFollowupDate", NextFollowupdate);
            p[12] = new SqlParameter("@Flag", Flag);
            p[13] = new SqlParameter("@CampaignFollowup__Status", CampaignFollowupStatus);
            p[14] = new SqlParameter("@CallingMode", CallingMode);
            p[15] = new SqlParameter("@LostFollowupReason", LostFollowupReason);
            p[16] = new SqlParameter("@RemarkConclusion", RemarkConclusion);

            p[8].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_InsertCampaign_Conatcts_feedback", p);
            return (p[8].Value.ToString());          
        }

        public static string enrollstudent1(string Enrollon, string Userid, string Opp_Id, string Student_Id)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@EnrollOn", SqlDbType.VarChar);
            p[0].Value = Enrollon;
            p[1] = new SqlParameter("@UserId", SqlDbType.VarChar);
            p[1].Value = Userid;
            p[2] = new SqlParameter("@Opp_Id", SqlDbType.VarChar);
            p[2].Value = Opp_Id;
            p[3] = new SqlParameter("@Student_Id", SqlDbType.VarChar, 30);
            p[3].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "Usp_Insert_Update_EnrolContacts_Compact", p);
            return (p[3].Value.ToString());
        }

        public static void DeletePricingprocedurevaluebyoppid(string Oppid, int Flag)
        {
            SqlParameter p1 = new SqlParameter("@oppid", Oppid);
            SqlParameter p2 = new SqlParameter("@flag", Flag);
            SqlHelper.ExecuteNonQuery(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_DELETE_CAL_FEESHEAD", p1, p2);
        }

        public static void InserttoGetPricingprocedurevaluebyoppid(string Oppid, string Materialcode, string Voucher_type, string Voucher_Amt, string Uomid, string Uomname, string Unit, string Quantity, string Amount, string Remarks,
       string Doc_type, int Flag)
        {
            SqlParameter p1 = new SqlParameter("@oppid", Oppid);
            SqlParameter p2 = new SqlParameter("@materialcode", Materialcode);
            SqlParameter p3 = new SqlParameter("@Voucher_Typ", Voucher_type);
            SqlParameter p4 = new SqlParameter("@VOUCHER_AMT", Voucher_Amt);
            SqlParameter p5 = new SqlParameter("@UOM", Uomid);
            SqlParameter p6 = new SqlParameter("@UOMNAME", Uomname);
            SqlParameter p7 = new SqlParameter("@unit", Unit);
            SqlParameter p8 = new SqlParameter("@qty", Quantity);
            SqlParameter p9 = new SqlParameter("@amount", Amount);
            SqlParameter p10 = new SqlParameter("@Remarks", Remarks);
            SqlParameter p11 = new SqlParameter("@doc_type", Doc_type);
            SqlParameter p12 = new SqlParameter("@flag", Flag);
            SqlHelper.ExecuteNonQuery(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CAL_FEESHEAD", p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);
           
        }

        public static DataSet GetPricingprocedureHeaderValue_New(string Oppid, string Materialcode, string Voucher_type, string Voucher_Amt, string Uomid, string Uomname, string Unit, string Quantity, string Amount, string Remarks,
        string Doc_type, int Flag)
        {
            SqlParameter p1 = new SqlParameter("@oppid", Oppid);
            SqlParameter p2 = new SqlParameter("@materialcode", Materialcode);
            SqlParameter p3 = new SqlParameter("@Voucher_Typ", Voucher_type);
            SqlParameter p4 = new SqlParameter("@VOUCHER_AMT", Voucher_Amt);
            SqlParameter p5 = new SqlParameter("@UOM", Uomid);
            SqlParameter p6 = new SqlParameter("@UOMNAME", Uomname);
            SqlParameter p7 = new SqlParameter("@unit", Unit);
            SqlParameter p8 = new SqlParameter("@qty", Quantity);
            SqlParameter p9 = new SqlParameter("@amount", Amount);
            SqlParameter p10 = new SqlParameter("@Remarks", Remarks);
            SqlParameter p11 = new SqlParameter("@doc_type", Doc_type);
            SqlParameter p12 = new SqlParameter("@flag", Flag);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CAL_FEESHEAD", p1, p2, p3, p4, p5, p6, p7,
            p8, p9, p10, p11, p12));
        }

        public static DataSet GetFeesComponent(int Flag, string Oppid)
        {
            SqlParameter p1 = new SqlParameter("@flag", Flag);
            SqlParameter p2 = new SqlParameter("@OppCode", Oppid);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_Get_Fee_Component", p1, p2));
        }

        public static DataSet GetStudentDeatils(int Flag, string RecordCode)
        {
            SqlParameter p1 = new SqlParameter("@flag", Flag);
            SqlParameter p2 = new SqlParameter("@Record_Code", RecordCode);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_CRMStudentInfo", p1, p2));
        }

        public static string CreateAccount(string Oppid, string MaterialCode, string Documenttype, string Paytype, string Userid, int flag2)
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@opp_id", SqlDbType.NVarChar);
            p[0].Value = Oppid;
            p[1] = new SqlParameter("@subjectgrp", SqlDbType.NVarChar);
            p[1].Value = MaterialCode;
            p[2] = new SqlParameter("@doc_type", SqlDbType.NVarChar);
            p[2].Value = Documenttype;
            p[3] = new SqlParameter("@paytype", SqlDbType.NVarChar);
            p[3].Value = Paytype;
            p[4] = new SqlParameter("@userid", SqlDbType.NVarChar);
            p[4].Value = Userid;
            p[5] = new SqlParameter("@flag2", SqlDbType.Int);
            p[5].Value = flag2;
            p[6] = new SqlParameter("@Account_OUT_ID", SqlDbType.NVarChar, 100);
            p[6].Direction = ParameterDirection.Output;
            SqlHelper.ExecuteNonQuery(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "Usp_Insert_Ttables", p);
            return (p[5].Value.ToString());
        }

        public static DataSet InserUpdateCampaign(int Flag, string CON_ID, string Created_By, string Campaign)
        {
            SqlParameter p1 = new SqlParameter("@Flag", Flag);
            SqlParameter p2 = new SqlParameter("@CON_ID", CON_ID);
            SqlParameter p3 = new SqlParameter("@Created_By", Created_By);
            SqlParameter p4 = new SqlParameter("@Campaign", Campaign);
            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_Insert_Student_Campaign_Detail", p1, p2,p3,p4));
        }

       public static DataSet Insert_Convert_Contact_To_Lead(string lead_src_id, string lead_src_desc, string Lead_type_id, string Lead_status_id, string Lead_status_desc, string Lead_campgn_id, string Prod_Interest,
       DateTime Time_join, string Lead_Con_id, string contact_Source_company, string contact_Source_Division, string contact_Source_Center, string contact_Source_zone, string Contact_Assignto, string Last_modified_by,
       string Createdby, string Contact_Target_Company, string Contact_Target_Division, string Contact_Target_Zone, string Contact_Target_Center, int Discipline_Id, string Discipline_Desc, int Field_ID, string Field_Interested_Desc, string Competitive_Exam,
       string Lead_Type_Desc, string lead_source_desc, string last_exam, int C_Year_Education, string Expected_Joining_Acad_Year)
        {
            SqlParameter[] p = new SqlParameter[31];
            p[0] = new SqlParameter("@lead_src_id", SqlDbType.NVarChar);
            p[0].Value = lead_src_id;
            p[1] = new SqlParameter("@lead_src_desc", SqlDbType.NVarChar);
            p[1].Value = lead_src_desc;
            p[2] = new SqlParameter("@Lead_type_id", SqlDbType.NVarChar);
            p[2].Value = Lead_type_id;
            p[3] = new SqlParameter("@Lead_status_id", SqlDbType.NVarChar);
            p[3].Value = Lead_status_id;
            p[4] = new SqlParameter("@Lead_status_desc", SqlDbType.NVarChar);
            p[4].Value = Lead_status_desc;
            p[5] = new SqlParameter("@Lead_campgn_id", SqlDbType.NVarChar);
            p[5].Value = Lead_campgn_id;
            p[6] = new SqlParameter("@Prod_Interest", SqlDbType.NVarChar);
            p[6].Value = Prod_Interest;
            p[7] = new SqlParameter("@Time_join", SqlDbType.NVarChar);
            p[7].Value = Time_join;
            p[8] = new SqlParameter("@Lead_Con_id", SqlDbType.NVarChar);
            p[8].Value = Lead_Con_id;
            p[9] = new SqlParameter("@contact_Source_company", SqlDbType.NVarChar);
            p[9].Value = contact_Source_company;
            p[10] = new SqlParameter("@contact_Source_Division", SqlDbType.NVarChar);
            p[10].Value = contact_Source_Division;
            p[11] = new SqlParameter("@contact_Source_Center", SqlDbType.NVarChar);
            p[11].Value = contact_Source_Center;

            p[12] = new SqlParameter("@CON_ID_RESPONSE", SqlDbType.NVarChar, 100);
            p[12].Direction = ParameterDirection.Output;

            p[13] = new SqlParameter("@contact_Source_zone", SqlDbType.NVarChar);
            p[13].Value = contact_Source_zone;
            p[14] = new SqlParameter("@Contact_Assignto", SqlDbType.NVarChar);
            p[14].Value = Contact_Assignto;
            p[15] = new SqlParameter("@Last_modified_by", SqlDbType.NVarChar);
            p[15].Value = Last_modified_by;
            p[16] = new SqlParameter("@Createdby", SqlDbType.NVarChar);
            p[16].Value = Createdby;
            p[17] = new SqlParameter("@Contact_Target_Company", SqlDbType.NVarChar);
            p[17].Value = Contact_Target_Company;
            p[18] = new SqlParameter("@Contact_Target_Division", SqlDbType.NVarChar);
            p[18].Value = Contact_Target_Division;
            p[19] = new SqlParameter("@Contact_Target_Zone", SqlDbType.NVarChar);
            p[19].Value = Contact_Target_Zone;
            p[20] = new SqlParameter("@Contact_Target_Center", SqlDbType.NVarChar);
            p[20].Value = Contact_Target_Center;
            p[21] = new SqlParameter("@Discipline_Id", SqlDbType.Int);
            p[21].Value = Discipline_Id;
            p[22] = new SqlParameter("@Discipline_Desc", SqlDbType.NVarChar);
            p[22].Value = Discipline_Desc;
            p[23] = new SqlParameter("@Field_ID", SqlDbType.Int);
            p[23].Value = Field_ID;
            p[24] = new SqlParameter("@Field_Interested_Desc", SqlDbType.NVarChar);
            p[24].Value = Field_Interested_Desc;
            p[25] = new SqlParameter("@Competitive_Exam", SqlDbType.NVarChar);
            p[25].Value = Competitive_Exam;
            p[26] = new SqlParameter("@Lead_Type_Desc", SqlDbType.NVarChar);
            p[26].Value = Lead_Type_Desc;
            p[27] = new SqlParameter("@lead_source_desc", SqlDbType.NVarChar);
            p[27].Value = lead_source_desc;
            p[28] = new SqlParameter("@last_exam", SqlDbType.NVarChar);
            p[28].Value = last_exam;
            p[29] = new SqlParameter("@C_Year_Education", SqlDbType.Int);
            p[29].Value = C_Year_Education;
            p[30] = new SqlParameter("@Expected_Joining_Acad_Year", SqlDbType.NVarChar);
            p[30].Value = Expected_Joining_Acad_Year;

            return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_Insert_Convert_ContactTo_Lead", p));
            //SqlHelper.ExecuteNonQuery(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_Insert_Convert_ContactTo_Lead", p);
            //return (p[12].Value.ToString());
        }

       public static DataSet CRM_GET_CampaignCountsByCampaignIdAndUserId(int flag, string CampaignId, string userId)
       {
           SqlParameter p1 = new SqlParameter("@flag", flag);
           SqlParameter p2 = new SqlParameter("@CampaignId", CampaignId);
           SqlParameter p3 = new SqlParameter("@userId", userId);
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_CampaignCounts", p1, p2, p3));
       }

       public static DataSet CRM_GET_CampaignCountsByCampaignIdAndUserIdSummary(int flag, string CampaignId, string userId)
       {
           SqlParameter p1 = new SqlParameter("@flag", flag);
           SqlParameter p2 = new SqlParameter("@CampaignId", CampaignId);
           SqlParameter p3 = new SqlParameter("@userId", userId);
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_CampaignCounts_Summary", p1, p2, p3));
       }

       public static DataSet CRM_GET_CampaignCountsDetailByCampaignIdAndUserIdandMobileNo(int flag, string Campaign, string Mobile_No, string userId)
       {
           SqlParameter p1 = new SqlParameter("@flag", flag);
           SqlParameter p2 = new SqlParameter("@Campaign", Campaign);
           SqlParameter p3 = new SqlParameter("@Mobile_No", Mobile_No);
           SqlParameter p4 = new SqlParameter("@userId", userId);
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_CampaignCountSearchDetail", p1, p2, p3, p4));
       }

       public static DataSet CRM_GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID(int Flag, string CampaignId, string UID, string StudentName, string Institution_Type, string CategoryType, string Centername, int Page_Number, string ContactNo,
                string Standard_Id, string School_Id, string Exam_Id, string Exam_Status_Id, string Exam_From_Rank, string Exam_To_Rank, string Event_Id, string Attendance, string Event_FeedbackHeader_Id, string Event_Feedback_Value_Id, string CampStudentUID, string Board_Id, string Followupstatus)
       {
           SqlParameter p1 = new SqlParameter("@Flag", Flag);
           SqlParameter p2 = new SqlParameter("@CampaignId", CampaignId);
           SqlParameter p3 = new SqlParameter("@UID", UID);
           SqlParameter p4 = new SqlParameter("@StudentName", StudentName);
           //SqlParameter p5 = new SqlParameter("@inst_desc", inst_desc);
           SqlParameter p5 = new SqlParameter("@Institution_Type", Institution_Type);
           SqlParameter p6 = new SqlParameter("@CategoryType", CategoryType);
           SqlParameter p7 = new SqlParameter("@Centername", Centername);
           SqlParameter p8 = new SqlParameter("@Page_Number", Page_Number);
          // SqlParameter p9 = new SqlParameter("@BoardName", BoardName);
           SqlParameter p9 = new SqlParameter("@ContactNo", ContactNo);
           SqlParameter p10 = new SqlParameter("@Standard_Id", Standard_Id);
           SqlParameter p11 = new SqlParameter("@School_Id", School_Id);
           SqlParameter p12 = new SqlParameter("@Exam_Id", Exam_Id);
           SqlParameter p13 = new SqlParameter("@Exam_Status_Id", Exam_Status_Id);
           SqlParameter p14 = new SqlParameter("@Exam_From_Rank", Exam_From_Rank);
           SqlParameter p15 = new SqlParameter("@Exam_To_Rank", Exam_To_Rank);
           SqlParameter p16 = new SqlParameter("@Event_Id", Event_Id);
           SqlParameter p17 = new SqlParameter("@Attendance", Attendance);
           SqlParameter p18 = new SqlParameter("@Event_FeedbackHeader_Id", Event_FeedbackHeader_Id);
           SqlParameter p19 = new SqlParameter("@Event_Feedback_Value_Id", Event_Feedback_Value_Id);
           SqlParameter p20 = new SqlParameter("@CampStudentUID", CampStudentUID);
           SqlParameter p21 = new SqlParameter("@Board_Id", Board_Id);
           SqlParameter p22 = new SqlParameter("@Followupstatus", Followupstatus);
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID", p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21,p22));
       }

       public static DataSet CRM_GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID_Summary(int Flag, string CampaignId, string UID, string StudentName, string Institution_Type, string CategoryType, string Centername, int Page_Number, string ContactNo,
               string Standard_Id, string School_Id, string Exam_Id, string Exam_Status_Id, string Exam_From_Rank, string Exam_To_Rank, string Event_Id, string Attendance, string Event_FeedbackHeader_Id, string Event_Feedback_Value_Id, string CampStudentUID, string Board_Id)
       {
           SqlParameter p1 = new SqlParameter("@Flag", Flag);
           SqlParameter p2 = new SqlParameter("@CampaignId", CampaignId);
           SqlParameter p3 = new SqlParameter("@UID", UID);
           SqlParameter p4 = new SqlParameter("@StudentName", StudentName);
           //SqlParameter p5 = new SqlParameter("@inst_desc", inst_desc);
           SqlParameter p5 = new SqlParameter("@Institution_Type", Institution_Type);
           SqlParameter p6 = new SqlParameter("@CategoryType", CategoryType);
           SqlParameter p7 = new SqlParameter("@Centername", Centername);
           SqlParameter p8 = new SqlParameter("@Page_Number", Page_Number);
           // SqlParameter p9 = new SqlParameter("@BoardName", BoardName);
           SqlParameter p9 = new SqlParameter("@ContactNo", ContactNo);
           SqlParameter p10 = new SqlParameter("@Standard_Id", Standard_Id);
           SqlParameter p11 = new SqlParameter("@School_Id", School_Id);
           SqlParameter p12 = new SqlParameter("@Exam_Id", Exam_Id);
           SqlParameter p13 = new SqlParameter("@Exam_Status_Id", Exam_Status_Id);
           SqlParameter p14 = new SqlParameter("@Exam_From_Rank", Exam_From_Rank);
           SqlParameter p15 = new SqlParameter("@Exam_To_Rank", Exam_To_Rank);
           SqlParameter p16 = new SqlParameter("@Event_Id", Event_Id);
           SqlParameter p17 = new SqlParameter("@Attendance", Attendance);
           SqlParameter p18 = new SqlParameter("@Event_FeedbackHeader_Id", Event_FeedbackHeader_Id);
           SqlParameter p19 = new SqlParameter("@Event_Feedback_Value_Id", Event_Feedback_Value_Id);
           SqlParameter p20 = new SqlParameter("@CampStudentUID", CampStudentUID);
           SqlParameter p21 = new SqlParameter("@Board_Id", Board_Id);

           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID_Summary", p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21));
       }
       public static DataSet Get_Campaign_Report(int Flag, string Userid)
       {
           SqlParameter p = new SqlParameter("@flag", SqlDbType.Int);
           p.Value = Flag;
           SqlParameter p1 = new SqlParameter("@userId", SqlDbType.VarChar);
           p1.Value = Userid;

           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_OE_CRM_Campaign_Report", p, p1));
       }

       public static DataSet CRM_GET_StudentOld_Admission_Center(string CampaignId)
       {
           SqlParameter p1 = new SqlParameter("@CampaignId", CampaignId);

           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_GetallPreviousCenter_CRM", p1));
       }

       public static DataSet CRM_GET_CampaignWMByCampaignIdAndUserId(int flag, string CampaignId, string userId)
       {
           SqlParameter p1 = new SqlParameter("@Flag", flag);
           SqlParameter p2 = new SqlParameter("@Campaign_Id", CampaignId);
           SqlParameter p3 = new SqlParameter("@User_ID", userId);
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "[RPT_CAMPAIGN_FOLLOWUP_CLOSURE_DETAILED_REPORTS_WP]", p1, p2, p3));
       }

        /// <summary>
        /// To Get Viotekk Agent Calling Extension
        /// </summary>
        /// <param name="flag"></param>
        /// <param name="Con_Id"></param>
        /// <returns></returns>
       public static DataSet CRM_GET_USER_CALLING_EXTENSION(int flag, string User_Id)
       {
           SqlParameter p1 = new SqlParameter("@flag", flag);
           SqlParameter p2 = new SqlParameter("@USer_Id", User_Id);

           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "USP_CRM_GET_USER_CALLING_EXTENSION", p1, p2));
       }

        /// <summary>
        /// Save Call Log from Working Sheet
        /// </summary>
        /// <param name="Flag"></param>
        /// <param name="Mode_ID"></param>
        /// <param name="Mode_Name"></param>
        /// <param name="Phase"></param>
        /// <param name="Feedback_ID"></param>
        /// <param name="Contact_Type_ID_Called"></param>
        /// <param name="Contact_Number_Called"></param>
        /// <param name="Contact_Id"></param>
        /// <param name="Lead_Opportunity_ID"></param>
        /// <param name="Lead_Name"></param>
        /// <param name="Campaign_Id"></param>
        /// <param name="Campaign_Name"></param>
        /// <param name="Process_Id"></param>
        /// <param name="Process_Name"></param>
        /// <param name="User_Id"></param>
        /// <param name="CRUD"></param>
        /// <param name="Recording_Link"></param>
        /// <param name="LegType"></param>
        /// <param name="SNUD"></param>
        /// <param name="OTUD"></param>
        /// <param name="Agent_User_Extension_Used"></param>
        /// <param name="TXST"></param>
        /// <param name="MOC"></param>
        /// <param name="Call_Start_Time"></param>
        /// <param name="Call_End_Time"></param>
        /// <param name="Total_Call_Duration"></param>
        /// <param name="Call_Status"></param>
        /// <returns></returns>
       public static DataSet Insert_Update_Calling_Info(int Flag, string Mode_ID, string Mode_Name, string Phase, string Feedback_ID, string Contact_Type_ID_Called, string Contact_Number_Called, string Contact_Id, string Lead_Opportunity_ID, string Lead_Name,
                  string Campaign_Id, string Campaign_Name, string Process_Id, string Process_Name, string User_Id, string CRUD, string Recording_Link, string LegType, string SNUD, string OTUD, string Agent_User_Extension_Used, string TXST, string MOC,
                  string Call_Start_Time, string Call_End_Time, string Total_Call_Duration, string Call_Status)
       {
           SqlParameter[] p = new SqlParameter[27];
           p[0] = new SqlParameter("@flag", SqlDbType.VarChar);
           p[0].Value = Flag;
           p[1] = new SqlParameter("@Mode_ID", SqlDbType.VarChar);
           p[1].Value = Mode_ID;
           p[2] = new SqlParameter("@Mode_Name", SqlDbType.VarChar);
           p[2].Value = Mode_Name;
           p[3] = new SqlParameter("@Phase", SqlDbType.VarChar);
           p[3].Value = Phase;
           p[4] = new SqlParameter("@Feedback_ID", SqlDbType.VarChar);
           p[4].Value = Feedback_ID;
           p[5] = new SqlParameter("@Contact_Type_ID_Called", SqlDbType.VarChar);
           p[5].Value = Contact_Type_ID_Called;
           p[6] = new SqlParameter("@Contact_Number_Called", SqlDbType.VarChar);
           p[6].Value = Contact_Number_Called;
           p[7] = new SqlParameter("@Contact_Id", SqlDbType.VarChar);
           p[7].Value = Contact_Id;
           p[8] = new SqlParameter("@Lead_Opportunity_ID", SqlDbType.VarChar);
           p[8].Value = Lead_Opportunity_ID;
           p[9] = new SqlParameter("@Lead_Name ", SqlDbType.VarChar);
           p[9].Value = Lead_Name;
           p[10] = new SqlParameter("@Campaign_Id ", SqlDbType.VarChar);
           p[10].Value = Campaign_Id;
           p[11] = new SqlParameter("@Campaign_Name ", SqlDbType.VarChar);
           p[11].Value = Campaign_Name;
           p[12] = new SqlParameter("@Process_Id ", SqlDbType.VarChar);
           p[12].Value = Process_Id;
           p[13] = new SqlParameter("@Process_Name ", SqlDbType.VarChar);
           p[13].Value = Process_Name;
           p[14] = new SqlParameter("@User_Id ", SqlDbType.VarChar);
           p[14].Value = User_Id;
           p[15] = new SqlParameter("@CRUD ", SqlDbType.VarChar);
           p[15].Value = CRUD;
           p[16] = new SqlParameter("@Recording_Link ", SqlDbType.VarChar);
           p[16].Value = Recording_Link;
           p[17] = new SqlParameter("@LegType ", SqlDbType.VarChar);
           p[17].Value = LegType;
           p[18] = new SqlParameter("@SNUD ", SqlDbType.VarChar);
           p[18].Value = SNUD;
           p[19] = new SqlParameter("@OTUD ", SqlDbType.VarChar);
           p[19].Value = OTUD;
           p[20] = new SqlParameter("@Agent_User_Extension_Used ", SqlDbType.VarChar);
           p[20].Value = Agent_User_Extension_Used;
           p[21] = new SqlParameter("@TXST ", SqlDbType.VarChar);
           p[21].Value = TXST;
           p[22] = new SqlParameter("@MOC ", SqlDbType.VarChar);
           p[22].Value = MOC;
           p[23] = new SqlParameter("@Call_Start_Time ", SqlDbType.VarChar);
           p[23].Value = Call_Start_Time;
           p[24] = new SqlParameter("@Call_End_Time ", SqlDbType.VarChar);
           p[24].Value = Call_End_Time;
           p[25] = new SqlParameter("@Total_Call_Duration ", SqlDbType.VarChar);
           p[25].Value = Total_Call_Duration;
           p[26] = new SqlParameter("@Call_Status ", SqlDbType.VarChar);
           p[26].Value = Call_Status;
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "Usp_Insert_CallingLogDetail", p));
       }


        //aded by sujeer... for dashboard-14032018
       public static DataSet GetUser_Role_Campaign_count(int Flag, string Userid)
       {
           SqlParameter p = new SqlParameter("@flag", SqlDbType.Int);
           p.Value = Flag;
           SqlParameter p1 = new SqlParameter("@UID", SqlDbType.VarChar);
           p1.Value = Userid;
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "[Get_CRMS_detailed_Count_by_user]", p, p1));
       }

       public static DataSet GetUser_Role_Campaign_count_lead(int Flag, string Userid)
       {
           SqlParameter p = new SqlParameter("@flag", SqlDbType.Int);
           p.Value = Flag;
           SqlParameter p1 = new SqlParameter("@user_id", SqlDbType.VarChar);
           p1.Value = Userid;
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "RPt_CampaignCount_ForDashBorad", p, p1));
       }


       public static DataSet CRM_GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID_D(int Flag, string CampaignId, string UID, string StudentName, string Institution_Type, string CategoryType, string Centername, int Page_Number, string ContactNo,
              string Standard_Id, string School_Id, string Exam_Id, string Exam_Status_Id, string Exam_From_Rank, string Exam_To_Rank, string Event_Id, string Attendance, string Event_FeedbackHeader_Id, string Event_Feedback_Value_Id, string CampStudentUID, string Board_Id, string Followupstatus)
       {
           SqlParameter p1 = new SqlParameter("@Flag", Flag);
           SqlParameter p2 = new SqlParameter("@CampaignId", CampaignId);
           SqlParameter p3 = new SqlParameter("@UID", UID);
           SqlParameter p4 = new SqlParameter("@StudentName", StudentName);
           //SqlParameter p5 = new SqlParameter("@inst_desc", inst_desc);
           SqlParameter p5 = new SqlParameter("@Institution_Type", Institution_Type);
           SqlParameter p6 = new SqlParameter("@CategoryType", CategoryType);
           SqlParameter p7 = new SqlParameter("@Centername", Centername);
           SqlParameter p8 = new SqlParameter("@Page_Number", Page_Number);
           // SqlParameter p9 = new SqlParameter("@BoardName", BoardName);
           SqlParameter p9 = new SqlParameter("@ContactNo", ContactNo);
           SqlParameter p10 = new SqlParameter("@Standard_Id", Standard_Id);
           SqlParameter p11 = new SqlParameter("@School_Id", School_Id);
           SqlParameter p12 = new SqlParameter("@Exam_Id", Exam_Id);
           SqlParameter p13 = new SqlParameter("@Exam_Status_Id", Exam_Status_Id);
           SqlParameter p14 = new SqlParameter("@Exam_From_Rank", Exam_From_Rank);
           SqlParameter p15 = new SqlParameter("@Exam_To_Rank", Exam_To_Rank);
           SqlParameter p16 = new SqlParameter("@Event_Id", Event_Id);
           SqlParameter p17 = new SqlParameter("@Attendance", Attendance);
           SqlParameter p18 = new SqlParameter("@Event_FeedbackHeader_Id", Event_FeedbackHeader_Id);
           SqlParameter p19 = new SqlParameter("@Event_Feedback_Value_Id", Event_Feedback_Value_Id);
           SqlParameter p20 = new SqlParameter("@CampStudentUID", CampStudentUID);
           SqlParameter p21 = new SqlParameter("@Board_Id", Board_Id);
           SqlParameter p22 = new SqlParameter("@Followupstatus", Followupstatus);
           return (SqlHelper.ExecuteDataset(ConnectionString.GetConnectionString(), CommandType.StoredProcedure, "[RPT_GET_CONTACT_COUNT_DETAILS_BY_CAMPAIGN_ID_DashBoard]", p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22));
       }

    }
}