using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_e_paper_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sql;
        DataTable dt;
        if (!IsPostBack)
        {
            if (Request.QueryString["act"] != null && Request.QueryString["sn"] != null)
            {
                if (Request.QueryString["act"] == "del")
                {
                    string sn = Request.QueryString["sn"].ToString();
                    sql = "delete from e_paper where sn = '" + sn + "'";
                    Mei.connSql(sql);
                    Response.Write("<script language='javascript'>alert('刪除成功');location.href='e_paper_setting.aspx?menu=7';</script>");
                    Response.End();
                }
                else
                {
                    string sn = Request.QueryString["sn"].ToString();
                    sql = "select * from e_paper where sn = '" + sn + "'";
                    dt = Mei.GetDataTable(sql);
                    txt_title.Text = dt.Rows[0]["pm_title"].ToString();
                    lb_postdate.Text = Convert.ToDateTime(dt.Rows[0]["pm_date"].ToString()).ToString("yyyy/MM/dd");
                    lb_editdate.Text = Convert.ToDateTime(dt.Rows[0]["pm_editdate"].ToString()).ToString("yyyy/MM/dd");
                    text_newpromote.Value = dt.Rows[0]["pm_content"].ToString().Replace("''", "'");
                }
            }
        }
    }

    protected void btn_edit_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["sn"] != null)
        {
            string sn = Request.QueryString["sn"].ToString();
            string sql;
            string pm_title = txt_title.Text.Trim();
            string pm_editdate = DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss");
            string pm_content = text_newpromote.Value.ToString().Replace("'", "''");
            sql = "update e_paper set pm_title = '" + pm_title + "',pm_editdate='" + pm_editdate + "',pm_content='" + pm_content + "' where sn = '" + sn + "'";
            try
            {
                Mei.connSql(sql);
                Response.Write("<script language='javascript'>alert('修改成功');location.href='e_paper_setting.aspx?menu=7';</script>");
            }
            catch
            {
                YamaZoo.scriptAlert("不明錯誤");
                return;
            }
        }
    }
}