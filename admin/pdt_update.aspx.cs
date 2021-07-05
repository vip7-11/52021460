using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class user_pdt_update : System.Web.UI.Page
{
    int w_size = 210;
    int h_size = 280;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblWebId.Text = "00001";
        if (!IsPostBack)
        {
            try
            {
                clearAll();
                string pdt_no = "";
                string pdt_id = "";
                string pdt_name = "";
                string pdt_cost = "";
                string pdt_price = "";
                string pdt_sell = "";
                string pdt_sellstate = "";
                string pdt_convey = "";
                string pdt_stocks = "";
                //string pdt_dateend = "";
                string pdt_itemA = "";
                string pdt_stateA = "";
                string pdt_stateB = "";
                string pdt_stateC = "";
                string pdt_stateD = "";
                string pdt_size = "";
                string pdt_units = "";
                string pdt_content = "";
                string pdt_img1 = "";
                string pdt_color = "";
                string pdt_fabric = "";
                string pdt_specific = "";


                pdt_no = Request.QueryString["pdt_no"].ToString();
                //GridView1.DataBind();
                string sql = "select * from pdt where pdt_no = '" + pdt_no + "'";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    pdt_id = (rd["pdt_id"].ToString());
                    pdt_name = (rd["pdt_name"].ToString().Trim());
                    pdt_cost = (rd["pdt_cost"].ToString().Trim());
                    pdt_price = (rd["pdt_price"].ToString());
                    pdt_sell = (rd["pdt_sell"].ToString());
                    pdt_sellstate = (rd["pdt_sellstate"].ToString());
                    pdt_convey = (rd["pdt_convey"].ToString());
                    pdt_stocks = (rd["pdt_stocks"].ToString());
                    pdt_fabric = (rd["pdt_fabric"].ToString());
                    //pdt_dateend = (rd["pdt_dateend"].ToString());
                    pdt_itemA = (rd["pdt_itemA"].ToString());
                    pdt_stateA = (rd["pdt_stateA"].ToString());
                    pdt_stateB = (rd["pdt_stateB"].ToString());
                    pdt_stateC = (rd["pdt_stateC"].ToString());
                    pdt_stateD = (rd["pdt_stateD"].ToString());
                    pdt_size = (rd["pdt_size"].ToString());
                    pdt_units = (rd["pdt_units"].ToString());
                    pdt_content = (rd["pdt_content"].ToString());
                    pdt_color = (rd["pdt_color"].ToString());
                    pdt_img1 = (rd["pdt_img1"].ToString());
                    pdt_specific = (rd["pdt_specific"].ToString());
                }
                rd.Close();
                conn.Close();

                lblpdt_no.Text = pdt_no;
                txtpdt_id.Text = pdt_id;
                txtpdt_name.Text = YamaZoo.SaveString(pdt_name, false);
                txtpdt_cost.Text = pdt_cost;
                txtpdt_price.Text = pdt_price;
                txtpdt_sell.Text = pdt_sell;
                rblpdt_sellstate.SelectedValue = pdt_sellstate;
                txtpdt_convey.Text = pdt_convey;
                txtpdt_stocks.Text = pdt_stocks;
                txtpdt_units.Text = pdt_units;
                //txtpdt_dateend.Text = pdt_dateend;
                ddlpdt_itemA.DataBind();
                SqlDataSource1.DataBind();
                ddlpdt_itemA.SelectedValue = pdt_itemA;
                if (pdt_stateD == "1") { chkpdt_stateD.Checked = true; } else { chkpdt_stateD.Checked = false; }

                txtpdt_content.Value = Server.HtmlDecode(pdt_content);
                //txtpdt_color.Value = Server.HtmlDecode(pdt_color);

                if (pdt_img1 == "") { pnimg1.Visible = false; btnDImg1.Enabled = false; } else { pnimg1.Visible = true; btnDImg1.Enabled = true; }

                lblimg1.Text = pdt_img1;

                pdtimg1.ImageUrl = "../image/products/" + pdt_img1 + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                lblSpecific.Text = pdt_specific;

            }
            catch
            {
                string alert = "發生不明錯誤，無法讀取資料！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //------------------- 規格 -----------------------------------------------------
            string[] arrSpecific = lblSpecific.Text.ToString().Split(';');
            foreach (string arrSp in arrSpecific)
            {
                string[] arrSpecificGroup = arrSp.Split(':');
                for (int i = 0; i < dltSpecific.Items.Count; i++)
                {
                    if (((Label)dltSpecific.Items[i].FindControl("specific_group_id")).Text == arrSpecificGroup[0])
                    {
                        ((CheckBox)dltSpecific.Items[i].FindControl("specific_group")).Checked = true;

                        try
                        {
                            for (int j = 0; j < ((CheckBoxList)dltSpecific.Items[i].FindControl("specification")).Items.Count; j++)
                            {
                                string[] arrSpecification = arrSpecificGroup[1].Split(',');
                                foreach (string arrSC in arrSpecification)
                                {
                                    if (((CheckBoxList)dltSpecific.Items[i].FindControl("specification")).Items[j].Value == arrSC)
                                        ((CheckBoxList)dltSpecific.Items[i].FindControl("specification")).Items[j].Selected = true;
                                }
                            }
                        }
                        catch { }
                    }
                }
            }
        }
    }
    protected void clearAll()
    {
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string pdt_no = lblpdt_no.Text;
            string pdt_id = txtpdt_id.Text.Trim();
            string pdt_name = YamaZoo.SaveString(txtpdt_name.Text, false);
            string pdt_cost = txtpdt_cost.Text.Trim();
            string pdt_price = txtpdt_price.Text.Trim();
            string pdt_sell = txtpdt_sell.Text.Trim();
            string pdt_sellstate = rblpdt_sellstate.SelectedItem.Value.ToString();
            //預設運費
            string sql_convey = "select totalfreight from web where web_id='00001'";
            DataTable dt_convey = Mei.GetDataTable(sql_convey);
            if (txtpdt_convey.Text.Trim().Length == 0)
            {
                txtpdt_convey.Text = dt_convey.Rows[0][0].ToString().Trim();
            }
            string pdt_convey = txtpdt_convey.Text.Trim();
            int pdt_stocks = 0;
            if (txtpdt_stocks.Text.Length != 0) { pdt_stocks = Convert.ToInt32(txtpdt_stocks.Text); }
            //string pdt_dateend = txtpdt_dateend.Text.Trim();
            string pdt_itemA = ddlpdt_itemA.SelectedValue.ToString();

            string pdt_units = txtpdt_units.Text.Trim();

            //---狀態---
            string psD = ""; if (chkpdt_stateD.Checked == true) { psD = "1"; } else { psD = "0"; }

            string content = txtpdt_content.Value.Replace("'", "''");

            //更新商品時間
            DateTime updatetime = DateTime.Now;
            //********************************************
            //商品規格
            string specific = "";
            bool i_switch = false;
            bool j_switch = false;
            for (int i = 0; i < dltSpecific.Items.Count; i++)
            {
                if (((CheckBox)dltSpecific.Items[i].FindControl("specific_group")).Checked)
                {
                    if (i_switch) specific += ";";
                    specific += ((Label)dltSpecific.Items[i].FindControl("specific_group_id")).Text + ":";

                    for (int j = 0; j < ((CheckBoxList)dltSpecific.Items[i].FindControl("specification")).Items.Count; j++)
                    {
                        if (((CheckBoxList)dltSpecific.Items[i].FindControl("specification")).Items[j].Selected)
                        {
                            if (j_switch) specific += ",";
                            specific += ((CheckBoxList)dltSpecific.Items[i].FindControl("specification")).Items[j].Value;
                            j_switch = true;
                        }
                    }
                    j_switch = false;
                    i_switch = true;
                }
            }
            //********************************************
            string sql = "UPDATE pdt SET ";
            sql += "pdt_id = '" + pdt_id + "', ";
            sql += "pdt_name = N'" + pdt_name + "', ";
            sql += "pdt_cost = '" + pdt_cost + "', ";
            sql += "pdt_price = '" + pdt_price + "', ";
            sql += "pdt_sell = '" + pdt_sell + "', ";
            sql += "pdt_sellstate = '" + pdt_sellstate + "', ";
            sql += "pdt_convey = '" + pdt_convey + "', ";
            sql += "pdt_stocks = '" + pdt_stocks + "', ";
            sql += "pdt_specific = '" + specific + "', ";
            //sql += "pdt_dateend = '" + pdt_dateend + "', ";
            sql += "pdt_itemA = '" + pdt_itemA + "', ";
            sql += "pdt_stateD = '" + psD + "', ";
            sql += "pdt_content = N'" + content + "', ";
            sql += "pdt_units = '" + pdt_units + "', ";
            sql += "pdt_updatetime = '" + updatetime.ToString("yyyy-MM-dd HH:mm:ss") + "' ";
            sql += "WHERE pdt_no = '" + pdt_no + "'";
            Mei.connSql(sql);

            string alert = "更新商品成功！";
            YamaZoo.scriptAlert(alert);
        }
        catch
        {
            string alert = "發生不明錯誤，無法更新資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "DELETE FROM pdt WHERE pdt_no = '" + lblpdt_no.Text + "'";
            Mei.connSql(sql);
            if (lblimg1.Text.Trim().Length != 0)
            {
                FileInfo delfile = new FileInfo(Server.MapPath("~/image/products/" + lblimg1.Text));
                delfile.Delete();
            }
            Response.Redirect("pdt_list.aspx?menu=4");
        }
        catch
        {
            string alert = "發生不明錯誤，無法刪除資料！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnUserBack_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>history.go(-2);</script>");
        Response.End();
    }
    protected void UpLoadImg(FileUpload file, string filename, int w_size, int h_size, int index)
    {
        string alert = "";
        string vsname = "";
        if (file.HasFile)
        {
            string extname = (file.FileName).Substring(file.FileName.Length - 3).ToLower();
            if (extname == "gif" || extname == "jpg" || extname == "peg")
            {
                if (extname == "peg") extname = "jpg";
                try
                {
                    string path1 = Server.MapPath("~/image/products/" + filename + "_" + index.ToString() + "_." + extname);//暫存圖檔
                    string path2 = Server.MapPath("~/image/products/" + filename + "_" + index.ToString() + "." + extname);//實質圖檔
                    file.SaveAs(path1);
                    Mei.resizepPic(path1, path2, filename, extname, w_size, h_size);
                    vsname = string.Concat("pdt_img", index);
                    ViewState[vsname] = filename + "_" + index.ToString() + "." + extname;
                }
                catch { alert = "發生不明錯誤，無法儲存圖片！"; YamaZoo.scriptAlert(alert); }
            }
            else { alert = "圖片格式只接受Jpg與Gif檔案格式！"; YamaZoo.scriptAlert(alert); }
        }
    }
    protected void btnLogoUpload1_Click(object sender, EventArgs e)
    {
        int w_size = 210;
        int h_size = 280;
        int index = 1;
        string pdt_no = lblpdt_no.Text;
        string filename = "p" + pdt_no;
        if (fudPdtImg1.HasFile)
        {
            string extname = (fudPdtImg1.FileName).Substring(fudPdtImg1.FileName.Length - 3).ToLower();
            UpLoadImg(fudPdtImg1, filename, w_size, h_size, index);
            pdtimg1.ImageUrl = "../image/products/" + filename + "_" + index.ToString() + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
            btnDImg1.Enabled = true;
            string sql = "UPDATE pdt SET pdt_img1 = '" + filename + "_" + index.ToString() + "." + extname + "' WHERE pdt_no = '" + pdt_no + "'";
            Mei.connSql(sql);
            lblimg1.Text = filename + "_" + index.ToString() + "." + extname;
            pnimg1.Visible = true;
        }
    }
    protected void btnDImg1_Click(object sender, EventArgs e)
    {
        FileInfo delfile = new FileInfo(Server.MapPath("../web/pdt/" + lblimg1.Text));
        delfile.Delete();
        pnimg1.Visible = false;
        lblimg1.Text = "";
        btnDImg1.Enabled = false;
        string sql = "UPDATE pdt SET pdt_img1 = '' WHERE pdt_no = '" + lblpdt_no.Text + "'";
        Mei.connSql(sql);
    }
}