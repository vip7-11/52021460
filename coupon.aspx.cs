using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class coupon : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private int resize(string path, int width, int height)
    {
        System.Drawing.Image currentPic = null;
        int fixwidth = 0;
        int fixheight = 0;
        int size = 0;

        try
        {
            currentPic = System.Drawing.Image.FromFile(path);
        }
        catch
        {
            currentPic = System.Drawing.Image.FromFile(Server.MapPath("image/none_obj.jpg"));
        }

        if (currentPic.Width > currentPic.Height)
        {
            fixwidth = width;
            fixheight = (currentPic.Height * fixwidth) / currentPic.Width;
            size = fixwidth;

            if (fixheight > height)
            {
                fixheight = height;
                size = (currentPic.Width * fixheight) / currentPic.Height;
            }
        }
        else
        {
            fixheight = height;
            size = (currentPic.Width * fixheight) / currentPic.Height;
            if (size > width) size = width;
        }

        return (size);
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_img = (Label)e.Row.FindControl("lbl_img");
            Image Image1 = (Image)e.Row.FindControl("Image1");
            Image1.ImageUrl = "Mod/ImageHandler.ashx?image=image/coupon/" + lbl_img.Text + "&width=" + resize(Server.MapPath("image/coupon/" + lbl_img.Text), 430, 230).ToString();

            e.Row.Attributes["onmouseover"] += "trcolor=this.style.backgroundColor;this.style.backgroundColor='#F585AA';";
            e.Row.Attributes["onmouseout"] += "this.style.backgroundColor=trcolor;";
        }
    }
}//nlg91a05-41  1616 L*2