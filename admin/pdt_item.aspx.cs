using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class user_pdt_item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
    }
    protected void clearAll()
    {
        lblItemANo.Text = "";
        txtItemAName.Text = "";
        chkState.Checked = false;
        txtitemA_content.Value = "";

        btnItemAAdd.Enabled = true;
        btnItemAUpdate.Enabled = false;
        btnItemADelete.Enabled = false;
        btnItemACancel.Enabled = false;
        Panel1.Visible = true;
        Panel2.Visible = false;
        btnLogoUpload.Visible = false;
        Image1.ImageUrl = "";
    }
    protected void btnItemAAdd_Click(object sender, EventArgs e)
    {
        if (txtItemAName.Text.Trim() == "" || txtitemA_content.Value.Trim() == "")
        {
            string alert = "品牌及介紹不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string itemA_no = Mei.GetMaxNo(3, "itemA", "itemA_no");
            string itemA_name = txtItemAName.Text.Trim();
            string itemA_state = "0";
            if (chkState.Checked == true)
            {
                itemA_state = "1";
            }
            string itemA_content = txtitemA_content.Value.Replace("'", "''");

            if (fudPdtImg.HasFile)
            {
                string extname = (fudPdtImg.FileName).Substring(fudPdtImg.FileName.Length - 3).ToLower();
                if (extname == "gif" || extname == "jpg" || extname == "peg")
                {
                    if (extname == "peg") extname = "jpg";
                    try
                    {
                        string filename = "i" + itemA_no;
                        string sql = "";
                        sql += "INSERT INTO itemA ( itemA_no, itemA_name, itemA_state, itemA_content, itemA_img ) VALUES (";
                        sql += "'" + itemA_no + "',";
                        sql += "N'" + itemA_name + "',";
                        sql += "'" + itemA_state + "',";
                        sql += "N'" + itemA_content + "',";
                        sql += "'" + filename + "." + extname + "')";
                        Mei.connSql(sql);

                        string path1 = Server.MapPath("~/web/item/" + filename + "_." + extname);//暫存圖檔
                        string path2 = Server.MapPath("~/web/item/" + filename + "." + extname);//實質圖檔
                        fudPdtImg.SaveAs(path1);
                        Mei.resizepPic(path1, path2, filename, extname, 300, 60);

                        clearAll();

                        //ddlItemA.DataBind();
                        //SqlDataSource2.DataBind();

                        string alert = "新增資料成功！";
                        YamaZoo.scriptAlert(alert);
                    }
                    catch
                    {
                        string alert = "發生不明錯誤，資料新增失敗！";
                        YamaZoo.scriptAlert(alert);
                    }
                }
                else { string alert = "圖片格式只接受Jpg與Gif檔案格式！"; YamaZoo.scriptAlert(alert); }
            }
            else
            {
                string alert = "您尚未選擇要上傳的圖檔！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }

    protected void btnItemAUpdate_Click(object sender, EventArgs e)
    {
        if (txtItemAName.Text.Trim() == "" || txtitemA_content.Value.Trim() == "")
        {
            string alert = "品牌及介紹不可以空白！";
            YamaZoo.scriptAlert(alert);
        }
        else
        {
            string itemA_no = lblItemANo.Text.Trim();
            string itemA_name = txtItemAName.Text.Trim();
            string itemA_state = "0";
            if (chkState.Checked == true)
            {
                itemA_state = "1";
            }
            string itemA_content = txtitemA_content.Value.Replace("'", "''");

            try
            {
                string sql = "UPDATE itemA SET ";
                sql += "itemA_name = N'" + itemA_name + "', ";
                sql += "itemA_state = '" + itemA_state + "', ";
                sql += "itemA_content = N'" + itemA_content + "' ";
                sql += "WHERE itemA_no = '" + itemA_no + "'";
                Mei.connSql(sql);

                clearAll();

                //ddlItemA.DataBind();
                //SqlDataSource2.DataBind();

                string alert = "更新資料成功！";
                YamaZoo.scriptAlert(alert);
            }
            catch
            {
                string alert = "發生不明錯誤，資料更新失敗！";
                YamaZoo.scriptAlert(alert);
            }
        }
    }
    protected void btnItemADelete_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "DELETE FROM itemA WHERE ItemA_no = '" + lblItemANo.Text + "'";
            Mei.connSql(sql);
            //string sql1 = "DELETE FROM itemB WHERE ItemA_no = '" + lblItemANo.Text + "'";
            //Mei.connSql(sql1);

            clearAll();

            //ddlItemA.DataBind();
            //SqlDataSource2.DataBind();
        }
        catch
        {
            string alert = "發生不明錯誤，資料刪除失敗！";
            YamaZoo.scriptAlert(alert);
        }
    }
    protected void btnItemACancel_Click(object sender, EventArgs e)
    {
        clearAll();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SELECT")
        {
            lblItemANo.Text = "";
            txtItemAName.Text = "";
            txtitemA_content.Value = "";

            //---取得某Row的索引---
            int index = Convert.ToInt32(e.CommandArgument);
            //---取得品項資料---
            string itemA_no = GridView1.Rows[index].Cells[0].Text;
            string itemA_name = "";
            string itemA_state = "";
            string itemA_content = "";
            string itemA_img = "";

            string sql = "select * from itemA where itemA_no = '" + itemA_no + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                itemA_name = (rd["itemA_name"].ToString());
                itemA_state = (rd["itemA_state"].ToString());
                itemA_content = (rd["itemA_content"].ToString());
                itemA_img = (rd["itemA_img"].ToString());
            }
            rd.Close();
            conn.Close();

            lblItemANo.Text = itemA_no;
            txtItemAName.Text = itemA_name;
            if (itemA_state == "1") { chkState.Checked = true; } else { chkState.Checked = false; }
            txtitemA_content.Value = Server.HtmlDecode(itemA_content);
            Image1.ImageUrl = "../web/item/" + itemA_img + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");

            btnItemAAdd.Enabled = false;
            btnItemAUpdate.Enabled = true;
            btnItemADelete.Enabled = true;
            btnItemACancel.Enabled = true;
            Panel1.Visible = false;
            Panel2.Visible = true;
            btnLogoUpload.Visible = true;
        }
    }
    //protected void btnItemBAdd_Click(object sender, EventArgs e)
    //{
    //    if (txtItemBName.Text.Trim() == "")
    //    {
    //        string alert = "款式不可以空白！";
    //        YamaZoo.scriptAlert(alert);
    //    }
    //    else
    //    {
    //        //string itemA_no = ddlItemA.SelectedValue.ToString();
    //        //string itemB_no = Mei.GetMaxNoCond(3, "itemB", "itemB_no", "itemA_no", itemA_no); 
    //        string itemB_no = Mei.GetMaxNo(3, "itemB", "itemB_no"); ;
    //        string itemB_name = txtItemBName.Text;

    //        try
    //        {
    //            string sql = "";
    //            sql += "INSERT INTO itemB ( itemB_no, itemB_name ) VALUES (";
    //            sql += "'" + itemB_no + "',";
    //            //sql += "'" + itemA_no + "',";
    //            sql += "N'" + itemB_name + "')";
    //            Mei.connSql(sql);

    //            txtItemBName.Text = "";
    //            //ddlItemA.SelectedIndex = 0;
    //            lblItemBNo.Text = "";

    //            btnItemBAdd.Enabled = true;
    //            btnItemBUpdate.Enabled = false;
    //            btnItemBDelete.Enabled = false;
    //            btnItemBCancel.Enabled = false;

    //            string alert = "新增資料成功！";
    //            YamaZoo.scriptAlert(alert);
    //        }
    //        catch
    //        {
    //            string alert = "發生不明錯誤，資料新增失敗！";
    //            YamaZoo.scriptAlert(alert);
    //        }
    //    }
    //}
    //protected void btnItemBUpdate_Click(object sender, EventArgs e)
    //{
    //    if (txtItemBName.Text.Trim() == "")
    //    {
    //        string alert = "款式不可以空白！";
    //        YamaZoo.scriptAlert(alert);
    //    }
    //    else
    //    {
    //        string itemB_no = lblItemBNo.Text.Trim();
    //        //string itemA_no = ddlItemA.SelectedValue.ToString();
    //        string itemB_name = txtItemBName.Text.Trim();

    //        try
    //        {
    //            string sql = "UPDATE itemB SET ";
    //            sql += "itemB_no = '" + itemB_no + "', ";
    //            //sql += "itemA_no = '" + itemA_no + "', ";
    //            sql += "itemB_name = N'" + itemB_name + "' ";
    //            sql += "WHERE itemB_no = '" + itemB_no + "' ";
    //            //sql += "AND itemA_no = '" + itemA_no + "'";
    //            Mei.connSql(sql);

    //            lblItemBNo.Text = "";
    //            //ddlItemA.SelectedIndex = 0;
    //            txtItemBName.Text = "";

    //            string alert = "更新資料成功！";
    //            YamaZoo.scriptAlert(alert);
    //        }
    //        catch
    //        {
    //            string alert = "發生不明錯誤，資料更新失敗！";
    //            YamaZoo.scriptAlert(alert);
    //        }
    //    }
    //}
    //protected void btnItemBDelete_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        string sql = "DELETE FROM itemB WHERE itemB_no = '" + lblItemBNo.Text + "'";
    //        Mei.connSql(sql);

    //        lblItemBNo.Text = "";
    //        txtItemBName.Text = "";

    //        btnItemBAdd.Enabled = true;
    //        btnItemBUpdate.Enabled = false;
    //        btnItemBDelete.Enabled = false;
    //        btnItemBCancel.Enabled = false;
    //    }
    //    catch
    //    {
    //        string alert = "發生不明錯誤，資料刪除失敗！";
    //        YamaZoo.scriptAlert(alert);
    //    }
    //}
    //protected void btnItemBCancel_Click(object sender, EventArgs e)
    //{
    //    lblItemBNo.Text = "";
    //    //ddlItemA.SelectedIndex = 0;
    //    txtItemBName.Text = "";

    //    btnItemBAdd.Enabled = true;
    //    btnItemBUpdate.Enabled = false;
    //    btnItemBDelete.Enabled = false;
    //    btnItemBCancel.Enabled = false;
    //}
    //protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    //if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
    //    //{
    //    //    e.Row.Cells[1].Visible = false; //設欄位隱藏
    //    //}
    //}
    //protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "SELECT")
    //    {
    //        lblItemBNo.Text = "";
    //        txtItemBName.Text = "";

    //        //---取得某Row的索引---
    //        int index = Convert.ToInt32(e.CommandArgument);
    //        //---取得品項資料---
    //        //string itemA_no = "";
    //        string itemB_no = "";
    //        string itemB_name = "";
    //        itemB_no = GridView2.Rows[index].Cells[0].Text;
    //        //itemA_no = GridView2.Rows[index].Cells[1].Text;

    //        string sql = "select * from itemB where itemB_no = '" + itemB_no + "'";// and itemA_no = '" + itemA_no + "'";
    //        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
    //        SqlCommand cmd = new SqlCommand(sql, conn);
    //        conn.Open();
    //        SqlDataReader rd = cmd.ExecuteReader();
    //        if (rd.Read())
    //        {
    //            itemB_name = (rd["itemB_name"].ToString());
    //        }
    //        rd.Close();
    //        conn.Close();

    //        lblItemBNo.Text = itemB_no;
    //        txtItemBName.Text = itemB_name;

    //        btnItemBAdd.Enabled = false;
    //        btnItemBUpdate.Enabled = true;
    //        btnItemBDelete.Enabled = true;
    //        btnItemBCancel.Enabled = true;
    //    }
    //}
    //protected void btnItemCAdd_Click(object sender, EventArgs e)
    //{
    //    if (txtItemCName.Text.Trim() == "")
    //    {
    //        string alert = "系列不可以空白！";
    //        YamaZoo.scriptAlert(alert);
    //    }
    //    else
    //    {
    //        string itemC_no = Mei.GetMaxNo(3, "itemC", "itemC_no");
    //        string itemC_name = txtItemCName.Text;

    //        try
    //        {
    //            string sql = "";
    //            sql += "INSERT INTO itemC ( itemC_no, itemC_name, itemB_no ) VALUES (";
    //            sql += "'" + itemC_no + "',";
    //            sql += "'" + itemC_name + "',";
    //            sql += "'" + ddlitemb.SelectedValue + "')";
    //            Mei.connSql(sql);

    //            txtItemCName.Text = "";
    //            lblItemCNo.Text = "";
    //            ddlitemb.Enabled = true;
    //            string alert = "新增資料成功！";
    //            YamaZoo.scriptAlert(alert);
    //        }
    //        catch
    //        {
    //            string alert = "發生不明錯誤，資料新增失敗！";
    //            YamaZoo.scriptAlert(alert);
    //        }
    //    }
    //}
    //protected void btnItemCDelete_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        string itemC_no = lblItemCNo.Text;

    //        string sql = "DELETE FROM itemC WHERE itemC_no = '" + itemC_no + "'";
    //        Mei.connSql(sql);
    //        ddlitemb.Enabled = true;
    //        btnItemCAdd.Enabled = true;
    //        btnItemCupdate.Enabled = false;
    //        btnItemCDelete.Enabled = false;
    //        btnItemCCancle.Enabled = false;
    //        lblItemCNo.Text = "";
    //        txtItemCName.Text = "";
    //    }
    //    catch
    //    {
    //        string alert = "發生不明錯誤，資料刪除失敗！";
    //        YamaZoo.scriptAlert(alert);
    //    }
    //}
    //protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "SELECT")
    //    {
    //        lblItemCNo.Text = "";
    //        txtItemCName.Text = "";

    //        //---取得某Row的索引---
    //        int index = Convert.ToInt32(e.CommandArgument);
    //        //---取得品項資料---
    //        string itemC_no = "";
    //        string itemC_name = "";
    //        itemC_no = GridView3.Rows[index].Cells[0].Text;

    //        string sql = "select * from itemC where itemC_no = '" + itemC_no + "'";
    //        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
    //        SqlCommand cmd = new SqlCommand(sql, conn);
    //        conn.Open();
    //        SqlDataReader rd = cmd.ExecuteReader();
    //        if (rd.Read())
    //        {
    //            itemC_name = (rd["itemC_name"].ToString());
    //        }
    //        rd.Close();
    //        conn.Close();
    //        //隱藏ddlitemB
    //        ddlitemb.Enabled = false;
    //        btnItemCAdd.Enabled = false;
    //        btnItemCupdate.Enabled = true;
    //        btnItemCDelete.Enabled = true;
    //        btnItemCCancle.Enabled = true;

    //        lblItemCNo.Text = itemC_no;
    //        txtItemCName.Text = itemC_name;
    //    }
    //}
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
    //protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    GridView2.PageIndex = e.NewPageIndex;
    //}
    //protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    GridView3.PageIndex = e.NewPageIndex;
    //}
    protected void btnLogoUpload1_Click(object sender, EventArgs e)
    {
        if (fudPdtImg.HasFile)
        {
            string extname = (fudPdtImg.FileName).Substring(fudPdtImg.FileName.Length - 3).ToLower();
            if (extname == "gif" || extname == "jpg" || extname == "peg")
            {
                if (extname == "peg") extname = "jpg";
                try
                {
                    string filename = "i" + lblItemANo.Text.Trim();
                    string path1 = Server.MapPath("~/web/item/" + filename + "_." + extname);//暫存圖檔
                    string path2 = Server.MapPath("~/web/item/" + filename + "." + extname);//實質圖檔
                    fudPdtImg.SaveAs(path1);
                    Mei.resizepPic(path1, path2, filename, extname, 300, 60);
                    Image1.ImageUrl = "../web/item/" + filename + "." + extname + "?z=" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                    string sql = "UPDATE itemA SET itemA_img = '" + filename + "." + extname + "' WHERE itemA_no = '" + lblItemANo.Text.Trim() + "'";
                    Mei.connSql(sql);
                }
                catch { string alert = "發生不明錯誤，無法儲存圖片！"; YamaZoo.scriptAlert(alert); }
            }
            else { string alert = "圖片格式只接受Jpg與Gif檔案格式！"; YamaZoo.scriptAlert(alert); }
        }
    }
    //protected void btnCancle_Click(object sender, EventArgs e)
    //{
    //    ddlitemb.Enabled = true;
    //    btnItemCAdd.Enabled = true;
    //    btnItemCupdate.Enabled = false;
    //    btnItemCDelete.Enabled = false;
    //    btnItemCCancle.Enabled = false;
    //}
    //protected void btnItemCupdate_Click(object sender, EventArgs e)
    //{
    //    ddlitemb.Enabled = true;
    //    btnItemCAdd.Enabled = true;
    //    btnItemCupdate.Enabled = false;
    //    btnItemCDelete.Enabled = false;
    //    btnItemCCancle.Enabled = false;
    //    try
    //    {
    //        string sql = " update itemC set itemC_name='" + txtItemCName.Text + "' where itemC_no='" + lblItemCNo.Text + "'";
    //        Mei.connSql(sql);
    //    }
    //    catch
    //    {
    //        YamaZoo.scriptAlert("更新資料失敗!");
    //    }

    //}
}