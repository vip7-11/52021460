using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class car : System.Web.UI.Page
{
    string alert;
    int cart_index = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SelectGV();
        }
    }
    protected void SelectGV()
    {
        //string strcar = "";
        //---暫存購物車為空時---
        if (Session["car"] == null)
        {
            pnNolist.Visible = true;
            pnGv.Visible = false;
        }
        else
        {
            pnNolist.Visible = false;
            pnGv.Visible = true;
            carGv.DataSource = (DataTable)Session["car"];
            carGv.DataBind();
        }
    }
    protected void carGv_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false; //設欄位隱藏
        }
        cart_index = cart_index = carGv.Rows.Count;
    }
    protected void carGv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        carGv.PageIndex = e.NewPageIndex;
        SelectGV();
    }
    protected void carGv_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //carGv.DataSource = (DataTable)Session["car"];
        //carGv.DataBind();
        //---取得編號資料---
        //int index = Convert.ToInt32(e.CommandArgument);
        //---取得編號資料---
        string pdt_no = "";
        int i = 0;
        if (Session["car"] == null)
        {
            Session.Remove("car");
            pnNolist.Visible = true;
            pnGv.Visible = false;
            return;
        }
        else
        {
            //取得產品編號
            pdt_no = e.CommandArgument.ToString();
        }

        int count;
        int sum;
        DataTable dt = (DataTable)Session["car"];

        if (e.CommandName == "A")
        {
            for (i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                if (dr["pdt_no"].ToString() == pdt_no)
                {
                    dr.BeginEdit();
                    if ((Convert.ToInt32(dr["pdt_count"].ToString()) + 1) > Convert.ToInt32(dr["pdt_stocks"].ToString()))
                    {
                        alert = "此商品已達庫存量上限";
                        YamaZoo.scriptAlert(alert);
                        return;
                    }
                    count = Convert.ToInt32(dr["pdt_count"].ToString()) + 1;
                    sum = count * Convert.ToInt32(dr["pdt_sell"]);
                    dr["pdt_count"] = Convert.ToString(count);
                    dr["pdt_sum"] = Convert.ToString(sum);
                    dr.EndEdit();
                    dt.AcceptChanges();
                }
            }
            Session["car"] = dt;
            carGv.DataSource = dt;
            carGv.DataBind();
        }
        if (e.CommandName == "D")
        {
            for (i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                if (dr["pdt_no"].ToString() == pdt_no)
                {
                    dr.BeginEdit();
                    count = Convert.ToInt32(dr["pdt_count"].ToString()) - 1;
                    if (count < 1)
                    {
                        count = 1;
                    }
                    sum = count * Convert.ToInt32(dr["pdt_sell"]);
                    dr["pdt_count"] = Convert.ToString(count);
                    dr["pdt_sum"] = Convert.ToString(sum);
                    dr.EndEdit();
                    dt.AcceptChanges();
                }
            }
            Session["car"] = dt;
            carGv.DataSource = dt;
            carGv.DataBind();
        }
        if (e.CommandName == "Del")
        {
            for (i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                if (dr["pdt_no"].ToString() == pdt_no)
                {
                    dr.Delete();
                    dt.AcceptChanges();
                }
            }
            if (dt.Rows.Count == 0)
            {
                Session.Remove("car");
                pnNolist.Visible = true;
                pnGv.Visible = false;
            }
            else
            {
                Session["car"] = dt;
                carGv.DataSource = dt;
                carGv.DataBind();
                pnNolist.Visible = false;
                pnGv.Visible = true;
            }
        }
    }
    protected void imgbtn_Click(object sender, EventArgs e)
    {
        if (Session["u_id"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            //修改規格
            string id = "";
            string specidic = "";
            int select = 0;

            for (int i = 0; i < carGv.Rows.Count; i++)
            {
                id = ((Label)carGv.Rows[i].FindControl("lbl_pdt_no")).Text;
                specidic = ((Literal)carGv.Rows[i].FindControl("specific")).Text;
                select = int.Parse(((Label)carGv.Rows[i].FindControl("lb_select")).Text.ToString());
                string[] s = ("0," + carGv.Rows[i].ToString()).ToString().Split(',');
                string spec = "";
                string name = "";
                string sql;
                //------------ 規格 -----------------------------------------
                if (select != 0)
                {
                    string tmpSpecific = specidic;

                    tmpSpecific = Regex.Replace(tmpSpecific, @"</option>", "}", RegexOptions.IgnoreCase);
                    tmpSpecific = Regex.Replace(tmpSpecific, @"<option(?<x>[^\>]*)>", "{option", RegexOptions.IgnoreCase);
                    tmpSpecific = Regex.Replace(tmpSpecific, @"{option(?<x>[^\>]*)}", "", RegexOptions.IgnoreCase);
                    tmpSpecific = Regex.Replace(tmpSpecific, @"</select>", "}", RegexOptions.IgnoreCase);
                    tmpSpecific = Regex.Replace(tmpSpecific, @"<select(?<x>[^\>]*)>", "{select", RegexOptions.IgnoreCase);
                    tmpSpecific = tmpSpecific.Replace("{select}&nbsp;", ",").TrimEnd(',');

                    string[] arrSpecific = tmpSpecific.Split(',');
                    string specidication = "";
                    string strSpecific = "";
                    foreach (string arrSp in arrSpecific)
                    {
                        try
                        {
                            strSpecific = Request.Form[arrSp.Trim() + i].ToString();
                        }
                        catch
                        {
                            strSpecific = "";
                        }

                        specidication = specidication + (arrSp + " " + strSpecific + " / ");
                    }

                    DataTable dt;
                    for (int j = 0; j < select; j++)
                    {
                        //name = "obj_type" + s[1] + "_" + i + "_" + (j + 1);
                        name = "obj_type" + i + "_" + (j + 1);
                        sql = "select specification.*,specific_group.specific_group_name from specification inner join specific_group on specification.specific_group_id= specific_group.specific_group_id where specification.specific_id=" + Request.Form[name];
                        dt = YamaZoo.GetDataTable(sql);
                        spec += dt.Rows[0]["specific_group_name"].ToString() + " " + dt.Rows[0]["specification"].ToString();
                        if (j != select - 1)
                        {
                            spec += "/";
                        }
                    }

                    dt = (DataTable)Session["car"];

                    for (int k = 0; k < dt.Rows.Count; k++)
                    {
                        DataRow dr = dt.Rows[k];
                        if (dr["pdt_no"].ToString() == id)
                        {
                            dr.BeginEdit();
                            dr["pdt_specification"] = spec;
                            dr.EndEdit();
                            dt.AcceptChanges();
                        }
                    }
                    Session["car"] = dt;
                    carGv.DataSource = dt;
                    carGv.DataBind();
                }
            }
            Response.Redirect("acc.aspx");
        }
    }
    protected void imgbtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void carGv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string sql = "";
        if(e.Row.RowType == DataControlRowType.DataRow)
        {
            DataTable dt, dt2, dt3;
            Label lbl_pdt_no = (Label)e.Row.FindControl("lbl_pdt_no");
            Label obj_specific = (Label)e.Row.FindControl("pdt_specific");
            Literal specific = (Literal)e.Row.FindControl("specific");
            Label lb_select = (Label)e.Row.FindControl("lb_select");

            sql = "select pdt_specific from pdt where pdt_no='" + lbl_pdt_no.Text + "'";
            dt3 = YamaZoo.GetDataTable(sql);
            if (dt3.Rows.Count != 0)
            {
                obj_specific.Text = dt3.Rows[0]["pdt_specific"].ToString();
            }
            //------------------- 規格 -----------------------------------------------------
            string[] group = ((DataRowView)((GridViewRow)e.Row).DataItem)["pdt_specification"].ToString().Split('/');
            try
            {
                if (obj_specific.Text.Trim() != "")
                {
                    int index = (e.Row as GridViewRow).DataItemIndex;
                    string[] group_item = obj_specific.Text.Split(';');
                    string[] item;
                    string[] spec;
                    string sql2;
                    string select = "";
                    int i;
                    int j;
                    lb_select.Text = group_item.Length.ToString();
                    for (i = 0; i < group_item.Length; i++)
                    {
                        spec = group_item[i].Split(':');
                        sql = "select * from specific_group where specific_group_id=" + spec[0];
                        dt = YamaZoo.GetDataTable(sql);
                        specific.Text += dt.Rows[0]["specific_group_name"] + "<select id=\"obj_type" + index + "_" + (i + 1) + "\" name=\"obj_type" + index + "_" + (i + 1) + "\">";
                        item = spec[1].Split(',');
                        for (j = 0; j < item.Length; j++)
                        {
                            //select = "";
                            sql2 = "select * from specification where specific_id=" + item[j];
                            dt2 = YamaZoo.GetDataTable(sql2);

                            if (((DataRowView)((GridViewRow)e.Row).DataItem)["pdt_specification"].ToString() != "")
                            {

                                string[] cart_spec = ((DataRowView)((GridViewRow)e.Row).DataItem)["pdt_specification"].ToString().Split('/');
                                string[] cart_item = cart_spec[i].Split(' ');
                                if (cart_item[1] == dt2.Rows[0]["specification"].ToString())
                                {
                                    select = " selected ";
                                }
                                else
                                {
                                    select = " ";
                                }
                            }


                            specific.Text += "<option" + select + " value =\"" + item[j] + "\">" + dt2.Rows[0]["specification"] + "</option>";

                        }
                        specific.Text += "</select><br />";
                    }
                }
                else
                {
                    lb_select.Text = "0";
                }
            }
            catch { }
        }
    }
}