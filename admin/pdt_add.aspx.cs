using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;

public partial class user_pdt_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblWebId.Text = "00001";
        if (!IsPostBack)
        {
            clearAll();
        }
    }
    protected void clearAll()
    {
        txtpdt_id.Text = "";
        txtpdt_name.Text = "";
        txtpdt_cost.Text = "";
        txtpdt_price.Text = "";
        txtpdt_sell.Text = "";
        rblpdt_sellstate.SelectedIndex = 0;
        txtpdt_convey.Text = "";
        txtpdt_stocks.Text = "";
        //txtpdt_dateend.Text = "";
        ddlpdt_itemA.SelectedIndex = 0;
        txtpdt_content.Value = "";
        txtpdt_units.Text = "";
        chkpdt_stateD.Checked = false;
        ViewState.Clear();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtpdt_id.Text.Trim() == "" || txtpdt_name.Text.Trim() == "")
        {
            string alert2 = "編號及名稱一定要填喔！";
            YamaZoo.scriptAlert(alert2);
        }
        else
        {
            string sql1 = "select * from pdt where pdt_id = '" + txtpdt_id.Text.Trim() + "'";
            Boolean tf = Mei.GetDtRowCount(sql1);

            if (tf == true)
            {
                string alert = "商品編號已存在！";
                YamaZoo.scriptAlert(alert);
            }
            else
            {                                
                if (fudPdtImg1.HasFile)
                {
                    try
                    {                        
                        string pdt_no = Mei.GetMaxNo(7, "pdt", "pdt_no");                            
                        string filename = "p" + pdt_no;
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
                        int pdt_stocks =0;
                        //string pdt_dateend = txtpdt_dateend.Text.Trim();
                        string pdt_itemA = ddlpdt_itemA.SelectedValue.ToString();
                        string pdt_count = "0";

                        //---狀態---
                        string psD = ""; if (chkpdt_stateD.Checked == true) { psD = "1"; } else { psD = "0"; }

                        string pdt_units = txtpdt_units.Text.Trim();

                        //尺寸庫存
                        if (txtpdt_stocks.Text.Length > 0)
                        {
                            pdt_stocks = Convert.ToInt32(txtpdt_stocks.Text.Trim());
                        }

                        string content = txtpdt_content.Value.Replace("'", "''");
                        UpLoadImgC(filename);

                        //更新商品時間
                        DateTime updatetime = DateTime.Now;
                        //****************************
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
                        //****************************


                        string sql = "insert into pdt (pdt_no, pdt_id, pdt_name, pdt_cost, pdt_price, pdt_sell, pdt_sellstate, pdt_convey, pdt_stocks, pdt_units, pdt_itemA, pdt_stateD, pdt_content, pdt_count, pdt_img1, pdt_specific, pdt_updatetime) ";
                        sql += "values ('" + pdt_no + "', '" + pdt_id + "',N'" + pdt_name + "', '" + pdt_cost + "', '" + pdt_price + "' , '" + pdt_sell + "', '" + pdt_sellstate + "', '" + pdt_convey + "', '" + pdt_stocks + "', '" + pdt_units + "', '" + pdt_itemA + "', '" + psD + "', N'" + content + "', '" + pdt_count + "', '" + ViewState["pdt_img1"] + "','" + specific + "','" + updatetime.ToString("yyyy-MM-dd HH:mm:ss") + "') ";
                        Mei.connSql(sql);

                        clearAll();

                        string alert = "新增商品成功！";
                        YamaZoo.scriptAlert(alert);
                    }
                    catch
                    {
                        string alert = "發生不明錯誤，無法建立資料！";
                        YamaZoo.scriptAlert(alert);
                    }                   
                }
                else
                {
                    string alert = "您尚未選擇要上傳的圖檔或尺寸圖！";
                    YamaZoo.scriptAlert(alert);
                }
            }            
        }
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
    protected void UpLoadImgC(string filename)
    {
        int w_size = 210;
        int h_size = 280;
        int index = 0;
        if (fudPdtImg1.HasFile)
        {
            index = index + 1;
            UpLoadImg(fudPdtImg1, filename, w_size, h_size, index);
        }
        //if (fudPdtImg2.HasFile)
        //{
        //    index = index + 1;
        //    UpLoadImg(fudPdtImg2, filename, w_size, h_size, index);
        //}
        //if (fudPdtImg3.HasFile)
        //{
        //    index = index + 1;
        //    UpLoadImg(fudPdtImg3, filename, w_size, h_size, index);
        //}
        //if (fudPdtImg4.HasFile)
        //{
        //    index = index + 1;
        //    UpLoadImg(fudPdtImg4, filename, w_size, h_size, index);
        //}
        //if (fudPdtImg5.HasFile)
        //{
        //    index = index + 1;
        //    UpLoadImg(fudPdtImg5, filename, w_size, h_size, index);
        //}
    }
    protected void dltSpecific_PreRender(object sender, EventArgs e)
    {
        //------------------- 規格 -----------------------------------------------------
        if (ViewState["Specific"] == null) ViewState["Specific"] = "";
        //Response.Write(ViewState["Specific"].ToString());
        string[] arrSpecific = ViewState["Specific"].ToString().Split(';');
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