using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_e_paper_sending : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_send_Click(object sender, EventArgs e)
    {
        string sql;
        string reciever_mail;
        string paper_sn;
        int reciever_count = 0;
        string m_username;
        DataTable dt;
        if (ddl_epaper.SelectedIndex == 0)
        {
            YamaZoo.scriptAlert("請選擇一則電子報");
            return;
        }
        else
        {
            string ck_id = "";
            paper_sn = ddl_epaper.SelectedValue; //電子報編號
            if (chk_member.Checked == true)
            { ck_id = "1"; }
            if (chk_unhappy.Checked == true)
            { ck_id = "2"; }
            if (chk_allmb.Checked == true)
            { ck_id = "3"; }
            switch (ck_id)
            {
                case "1":
                    if (txt_username.Text.Trim() == "")
                    {
                        YamaZoo.scriptAlert("會員帳號不可為空");
                        return;
                    }
                    processSendMail(paper_sn, txt_username.Text.Trim());
                    break;
                case "2":
                    if (txt_username2.Text.Trim() == "")
                    {
                        YamaZoo.scriptAlert("會員帳號不可為空");
                        return;
                    }
                    processSendMail(paper_sn, txt_username2.Text.Trim());
                    break;
                case "3":
                    if (txt_username3.Text.Trim() == "")
                    {
                        YamaZoo.scriptAlert("會員帳號不可為空");
                        return;
                    }
                    processSendMail(paper_sn, txt_username3.Text.Trim());
                    break;
                default:
                    YamaZoo.scriptAlert("您尚未選擇寄送方式！");
                    break;
            }

            //if (chk_member.Checked == true)
            //{
            //    if (txt_username.Text.Trim() == "")
            //    {
            //        YamaZoo.scriptAlert("會員帳號不可為空");
            //        return;
            //    }
            //    else
            //    {
            //        //m_username = txt_username.Text.Trim();
            //        //sql = "select * from member where m_username='" + m_username + "'";
            //        //dt = YamaZoo.GetDataTable(sql);
            //        //if (dt.Rows.Count == 0)
            //        //{
            //        //    YamaZoo.scriptAlert("查無此會員帳號，請再次檢查");
            //        //    return;
            //        //}
            //        //else
            //        //{
            //        //    if (dt.Rows[0]["m_epaper"].ToString() == "False")
            //        //    {
            //        //        YamaZoo.scriptAlert("該會員不接受電子報");
            //        //        return;
            //        //    }
            //        //    else
            //        //    {
            //        //        reciever_mail = dt.Rows[0]["m_mail"].ToString();
            //        //        Sendmail(reciever_mail, paper_sn, m_username);
            //        //    }
            //        //    YamaZoo.scriptAlert("寄送給"+m_username+"成功");
            //        //    return;
            //        //}
            //        m_username = txt_username.Text.Trim().Replace("\n", "").Replace("\r","");
            //        //將所填EMAIL轉為陣列
            //        string[] spl = new string[] { ";" };
            //        string[] spS = m_username.Split(spl, StringSplitOptions.RemoveEmptyEntries);
            //        for (int i = 0; i < spS.Length; i++)
            //        {
            //            reciever_mail = spS[i];
            //            Sendmail(reciever_mail, paper_sn, "");
            //            reciever_count += 1;
            //        }
            //        YamaZoo.scriptAlert("成功寄送電子報給" + reciever_count + "位會員。");
            //        reciever_count = 0;
            //        return;
            //    }
            //}
            ////非會員但已申請寄信
            //if (chk_unhappy.Checked == true)
            //{
            //    sql = "select e_email from e_paper_users order by e_date desc";
            //    dt = Mei.GetDataTable(sql);
            //    for (int j = 0; j < dt.Rows.Count; j++)
            //    {
            //        reciever_mail = dt.Rows[j]["e_email"].ToString().Trim();
            //        m_username = "";
            //        if (reciever_mail.Trim() != "")
            //        {
            //            Sendmail(reciever_mail, paper_sn, m_username);
            //            reciever_count += 1;
            //        }
            //    }
            //    YamaZoo.scriptAlert("成功寄送電子報給" + reciever_count + "位會員。");
            //    reciever_count = 0;
            //    return;
            //}
            ////全站會員寄信
            //if (chk_allmb.Checked == true)
            //{
            //    sql = "select * from users where users_epaper='True'";
            //    dt = YamaZoo.GetDataTable(sql);
            //    for (int i = 0; i < dt.Rows.Count; i++)
            //    {
            //        reciever_mail = dt.Rows[i]["users_mail"].ToString();
            //        m_username = dt.Rows[i]["users_id"].ToString();
            //        if (reciever_mail.Trim() != "")
            //        {
            //            Sendmail(reciever_mail, paper_sn, m_username);
            //            reciever_count += 1;
            //        }
            //    }
            //    YamaZoo.scriptAlert("成功寄送電子報給" + reciever_count + "位會員。");
            //    return;
            //}
        }
    }
    protected void processSendMail(string paper_sn, string m_username)
    {//paper_sn電子報編號//m_username帳號
        string reciever_mail;
        int reciever_count = 0;
        m_username = m_username.Trim().Replace("\n", "").Replace("\r", "");
        //將所填EMAIL轉為陣列
        string[] spl = new string[] { ";" };
        string[] spS = m_username.Split(spl, StringSplitOptions.RemoveEmptyEntries);
        for (int i = 0; i < spS.Length; i++)
        {
            reciever_mail = spS[i];
            Sendmail(reciever_mail, paper_sn, "");
            reciever_count += 1;
        }
        YamaZoo.scriptAlert("成功寄送電子報給" + reciever_count + "位會員。");
        reciever_count = 0;
        return;
    }

    protected void Sendmail(string reciever,string paper_sn,string username)
    {
        string p_title = "";
        string strBody = "<html><body><div align='left'>" + username + "您好：</div>";
        string sql = "select * from e_paper where sn = '" + paper_sn + "'";
        DataTable dt = YamaZoo.GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            p_title = dt.Rows[0]["pm_title"].ToString();
            strBody = strBody + Server.HtmlDecode(dt.Rows[0]["pm_content"].ToString()) + "</body></html>";
        } 
        YamaZoo.sentMail("motomoto", reciever, p_title, strBody);
    }
    protected void ddl_epaper_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sn = ddl_epaper.SelectedValue;
        string sql;
        if (sn != "0")
        {
            sql = "select * from e_paper where sn = '" + sn + "'";
            DataTable dt = YamaZoo.GetDataTable(sql);
            if (dt.Rows.Count > 0)
            {
                lb_epaper_view.Text = dt.Rows[0]["pm_content"].ToString().Replace("''", "'");
            }
        }
        else
        {
            lb_epaper_view.Text = "";
        }
    }
    protected void chk_unhappy_CheckedChanged(object sender, EventArgs e)
    {
        txt_username2.Text = "";
        //非會員但已申請寄信
        string sql;
        string reciever_mail;
        int reciever_count = 0;
        DataTable dt;
        sql = "select e_email from e_paper_users order by e_date desc";
        dt = Mei.GetDataTable(sql);
        for (int j = 0; j < dt.Rows.Count; j++)
        {
            reciever_mail = dt.Rows[j]["e_email"].ToString().Trim();
            if (reciever_mail.Trim() != "")
            {
                if (j == 0)
                { txt_username2.Text += reciever_mail; }
                else
                {
                    txt_username2.Text += ";" + reciever_mail;
                }
                reciever_count += 1;
            }
        }
        lbl2.Text = "<span>共有　" + reciever_count + "組　EMAL帳號</span>";
        reciever_count = 0;
    }
    protected void chk_allmb_CheckedChanged(object sender, EventArgs e)
    {
        //全站會員寄信
        txt_username3.Text = "";
        string sql;
        string reciever_mail;
        int reciever_count = 0;
        DataTable dt;
        sql = "select * from users where users_epaper='True'";
        dt = YamaZoo.GetDataTable(sql);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            reciever_mail = dt.Rows[i]["users_mail"].ToString();
            if (reciever_mail.Trim() != "")
            {
                if (i == 0)
                { txt_username3.Text += reciever_mail; }
                else
                {
                    txt_username3.Text += ";" + reciever_mail;
                }
                reciever_count += 1;
            }
        }
        lbl3.Text = "<span>共有　" + reciever_count + "組　EMAL帳號</span>";
    }
    protected void chk_member_CheckedChanged(object sender, EventArgs e)
    {
        //寄給非會員
        //txt_username.Text = "";
        int reciever_count = 0;
        string m_username;
        m_username = txt_username.Text.Trim().Replace("\n", "").Replace("\r", "");
        //將所填EMAIL轉為陣列
        string[] spl = new string[] { ";" };
        string[] spS = m_username.Split(spl, StringSplitOptions.RemoveEmptyEntries);
        reciever_count = spS.Length;
        lbl1.Text = "<span>共有　" + reciever_count + "組　EMAL帳號</span>";
        reciever_count = 0;
    }
}