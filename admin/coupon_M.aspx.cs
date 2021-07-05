using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class admin_coupon_M : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("../image/coupon/");
        string filename = FileUpload1.FileName;
        string checkFilename = path + filename;
        string tempFilename = "";
        Boolean fileOK = false;
        if (IsPostBack)
        {
            if (FileUpload1.HasFile)
            {

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
                        //if (System.IO.File.Exists(path))
                        //{
                        //    try
                        //    {
                        //        System.IO.File.Delete(path);
                        //    }
                        //    catch (Exception ex)
                        //    {
                        //        Response.Write("發生例外錯誤");
                        //    }
                        //}
                        Response.Write("<script language=JavaScript> alert('上傳成功'); </script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("發生例外錯誤，上傳失敗");
                    }
                }
                else
                {
                    Response.Write("<script language=JavaScript> alert('副檔名只能為jpg、gif或png'); </script>");
                }
            }
        }

        string connstring2 = WebConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString;
        SqlConnection conn1 = new SqlConnection(connstring2);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand("INSERT INTO [coupon] ([name], [pic]) VALUES (@name, @pic)", conn1);
        cmd1.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = TextBox1.Text;
        cmd1.Parameters.Add("@pic", SqlDbType.NVarChar, 50).Value = filename;
        cmd1.ExecuteNonQuery();
        cmd1.Dispose();
        conn1.Close();
        conn1.Dispose();

        Response.Redirect("coupon_M.aspx");
    }
}