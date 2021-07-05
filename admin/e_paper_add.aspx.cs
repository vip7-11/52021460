using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_e_paper_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lb_todate.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }
    }

    protected void btn_add_Click(object sender, EventArgs e)
    {
        string pm_title = txt_title.Text.Trim();
        string pm_content = text_newpromote.Value.Replace("'", "''");
        string nowdate = DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss");
        string pm_date = nowdate;
        string pm_editdate = nowdate;
        string sql = "insert into e_paper (pm_title,pm_content,pm_date,pm_editdate) values('" + pm_title + "','" + pm_content + "','" + pm_date + "','" + pm_editdate + "')";
        try
        {
            Mei.connSql(sql);
            Response.Write("<script language='javascript'>alert('新增成功');location.href='e_paper_setting.aspx?menu=7';</script>");
        }
        catch
        {
            YamaZoo.scriptAlert("不明錯誤");
            return;
        }

    }
}