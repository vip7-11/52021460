using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_dm_load : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogoUpload_Click(object sender, EventArgs e)
    {
        if (fudPdtFile.HasFile)
        {
            string filename = fudPdtFile.FileName;

            string[] spl = new string[] { "." };
            string[] spS = filename.Split(spl, StringSplitOptions.RemoveEmptyEntries);
            int index = Convert.ToInt32(spS.Length) - 1;
            string extname = spS[index];
            if (extname == "doc" || extname == "docx" || extname == "xls" || extname == "xlsx" || extname == "pdf")
            {
                try
                {
                    string dm_no = Mei.GetMaxNo(3, "dm", "dm_no");
                    string path1 = Server.MapPath("~/web/file/" + filename);
                    fudPdtFile.SaveAs(path1);
                    string sql = "insert into dm (dm_no, dm_name) values ('" + dm_no + "', '" + filename + "' ) ";                        
                    Mei.connSql(sql);
                    dmGv.DataBind();
                    SqlDataSource1.DataBind();
                }
                catch { string alert = "發生不明錯誤，無法儲存檔案！"; YamaZoo.scriptAlert(alert); }
            }
            else { string alert = "檔案格式只接受Word、Excel、PDF！"; YamaZoo.scriptAlert(alert); }
        }
    }
    protected void dmGv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
        }
    }
    protected void dmGv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DEL")
        {
            //---取得編號資料---
            string index = Convert.ToString(e.CommandArgument);
            char[] Ch = new char[] { ',' };
            string[] C1 = index.Split(Ch, StringSplitOptions.RemoveEmptyEntries);

            string dm_no = C1[0];
            string dm_name = C1[1]; 

            try
            {
                string sql = "DELETE FROM dm WHERE dm_no = '" + dm_no + "'";
                Mei.connSql(sql);
                FileInfo delfile = new FileInfo(Server.MapPath("~/web/file/" + dm_name));
                delfile.Delete();
                dmGv.DataBind();
                SqlDataSource1.DataBind();

                string alert = "刪除資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，無法刪除資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
}