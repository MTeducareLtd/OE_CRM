using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Collections;
using System.Data;
using ShoppingCart.BL;
using System.Net;
using System.Text;
using System.Security.Cryptography;
using System.IO;

/// <summary>
/// Summary description for WM_LoginDetails
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WM_LoginDetails : System.Web.Services.WebService {

    [WebMethod(EnableSession = true)]
    public ArrayList getLoginDetails(string Username, string password, string Typevalue)
    {
        ArrayList arrlstLogin = new ArrayList();
        try
        {
            Login_Service.LoginServiceSoapClient client = new Login_Service.LoginServiceSoapClient();
            object obj = client.ValidateUser(Username, password, "01");
            Login_Service.LoginData Login = (Login_Service.LoginData)obj;

            string encryptedPassword = this.Encrypt(password.Trim());
            string decryptedPassword = this.Decrypt(encryptedPassword.Trim());

            String ReturnMessage = Login.Message;
            String Displayname = Login.DisplayName;
            String passwordreset = Login.Passwordreset;
            String userid = Login.UserId;
            string FinalTypeValue;
            if (Typevalue == "" || Typevalue == "null")
            {
                FinalTypeValue = "B";
            }
            else
            {
                FinalTypeValue = Typevalue;
            }
            DataTable dt = client.GetApplication_Url();
            HttpCookie MTUserInfo = new HttpCookie("CRMCookiesLoginInfo");
            if (ReturnMessage == "Success")
            {
                string role = client.CheckUserRole(Login.UserId);
                if (!string.IsNullOrEmpty(role))
                {
                    if (dt != null && dt.Rows.Count != 0)
                    {
                        foreach (DataRow drLogin in dt.Rows)
                        {
                            MTUserInfo["UserID"] = userid;
                            MTUserInfo["UserName"] = Displayname;
                            MTUserInfo["Expired"] = "1Day";
                            MTUserInfo["Password"] = encryptedPassword;
                            MTUserInfo["typevalue"] = FinalTypeValue;
                            HttpContext.Current.Response.AppendCookie(MTUserInfo);

                            arrlstLogin.Add(new
                            {
                                username = Username,
                                password = decryptedPassword,
                                ReturnMessage = ReturnMessage,

                            });
                        }
                    }
                }
            }



        }
        catch (Exception ex)
        {

            //ErrorHandler.LogError("StudentAssessment", "StudentTestSummary", ex);
        }

        return arrlstLogin;
    }


    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }

}
