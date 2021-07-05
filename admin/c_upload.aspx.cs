using System;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.Security;
using System.Web.UI;

public partial class admin_c_upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        DataTable dt;
        int p_id = Convert.ToInt32((Request.QueryString.Get("page").ToString()));
        string path = Server.MapPath("../image/coupon/");
        string filename = FileUpload1.FileName;
        string checkFilename = path + filename;
        string tempFilename = "";
        Boolean fileOK = false;
        if (IsPostBack)
        {

            if (FileUpload1.HasFile)
            {
                sql = "SELECT pic FROM coupon WHERE id =" + p_id;
                dt = somecode.GetDataTable(sql);
                if (System.IO.File.Exists(path + dt.Rows[0][0].ToString()))
                {
                    try
                    {
                        System.IO.File.Delete(path + dt.Rows[0][0].ToString());
                    }
                    catch (Exception ex)
                    {
                        Response.Write("發生例外錯誤");
                    }
                }
                string fileExtension = System.IO.Path.GetExtension(filename).ToLower();
                string[] allowedExtensions = { ".jpg", ".gif", ".png" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        if (System.IO.File.Exists(checkFilename))
                        {
                            int my_counter = 2;
                            while (System.IO.File.Exists(checkFilename))
                            {
                                tempFilename = my_counter.ToString() + "-" + filename;
                                checkFilename = path + tempFilename;
                                my_counter += 1;
                            }
                            filename = tempFilename;
                        }
                        fileOK = true;
                    }
                }
                if (fileOK)
                {
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(path + filename);
                        sql = "UPDATE coupon SET pic='" + filename + "' WHERE (id =" + p_id + ")";
                        somecode.ExecuteNoQuery(sql);

                        Response.Write("<script language=JavaScript> alert('圖片已上傳成功'); </script>");
                        Response.Write("<script language=JavaScript> window.close(); </script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("發生例外錯誤，上傳失敗");
                    }
                }
                else
                {
                    Response.Write("副檔名只能為jpg、gif、png");
                }
            }
        }
    }
}