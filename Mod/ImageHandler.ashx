<%@ WebHandler Language="C#" Class="ImageHandler" %>
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.Caching;
using System.Xml;

public class ImageHandler : IHttpHandler
{
    public int _width;
    public int _height;
    public static string noImageUrl = @"../images/none_obj.jpg";
    public string imageURL;
    
    public void ProcessRequest(HttpContext context)
    {
        Bitmap bitOutput;

        if (context.Cache[("ImageQueryURL-" + context.Request.QueryString.ToString())] != null)
        {
            bitOutput = (Bitmap)context.Cache[("ImageQueryURL-" + context.Request.QueryString.ToString())];
        }
        else
        {
            Bitmap bitInput = GetImage(context);            

            if (SetHeightWidth(context, bitInput))
            { bitOutput = ResizeImage(bitInput, _width, _height); }
            else { bitOutput = bitInput; }

            context.Response.ContentType = "image/jpeg";
            bitOutput.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            context.Cache.Insert(("ImageQueryURL-" + context.Request.QueryString.ToString()), bitOutput, new CacheDependency(imageURL), Cache.NoAbsoluteExpiration, TimeSpan.FromHours(8), System.Web.Caching.CacheItemPriority.BelowNormal, null);
        }

        try
        {
            EncoderParameters eps = new EncoderParameters(1);
            eps.Param[0] = new EncoderParameter(Encoder.Quality, 100L);
            ImageCodecInfo ici = GetEncoderInfo("image/jpeg");
            bitOutput.Save(context.Response.OutputStream, ici, eps);
        }
        catch (System.Exception ex)
        {
            throw ex;
        }

        return;
    }
    
    public Bitmap GetImage(HttpContext context)
    {
        if (context.Cache[("ImagePath-" + context.Request.QueryString["image"])] == null) 
        {
            string appPath = context.Request.MapPath("../") + Path.DirectorySeparatorChar;

            if (String.IsNullOrEmpty(context.Request.QueryString["image"]))
            {
                appPath += noImageUrl;
            }
            else
            {
                if (System.IO.File.Exists((appPath + context.Request.QueryString["image"])))
                {
                    appPath += context.Request.QueryString["image"];
                }
                else
                {
                    appPath += noImageUrl;
                }
            }

            //ProfileCommon owner = (ProfileCommon)context.Profile;
            //owner = owner.GetProfile(getWeb("owner"));

            Bitmap bitOutput;

            Stream fileStream = File.OpenRead(appPath);
            bitOutput = new Bitmap(fileStream);
            
            context.Cache.Insert(("ImageQueryURL-" + context.Request.QueryString.ToString()), bitOutput, new CacheDependency(imageURL), Cache.NoAbsoluteExpiration, TimeSpan.FromHours(8), System.Web.Caching.CacheItemPriority.BelowNormal, null);
             
            fileStream.Close();
            return bitOutput;
        }
        else
        {
            return (Bitmap)context.Cache[("ImagePath-" + context.Request.QueryString["image"])];
        }
    }    
   
    public bool SetHeightWidth(HttpContext context, Bitmap bitInput)
    {
        double inputRatio = Convert.ToDouble(bitInput.Width) / Convert.ToDouble(bitInput.Height);
        
        if (!(String.IsNullOrEmpty(context.Request["width"])) && !(String.IsNullOrEmpty(context.Request["height"])))
        {
            _width = Int32.Parse(context.Request["width"]);
            _height = Int32.Parse(context.Request["height"]);
            return true;
        }
        else if (!(String.IsNullOrEmpty(context.Request["width"])))
        {
            _width = Int32.Parse(context.Request["width"]);
            _height = Convert.ToInt32( (_width / inputRatio));
            return true;
        }
        else if (!(String.IsNullOrEmpty(context.Request["height"])))
        {
            _height = Int32.Parse(context.Request["height"]);
            _width = Convert.ToInt32((_height * inputRatio));
            return true;
        }
        else
        {
            _height = bitInput.Height;
            _width = bitInput.Width;
            return false;
        }
    }

    public static Bitmap ResizeImage(Bitmap originalBitmap, int newWidth, int newHeight)
    {
        Bitmap inputBitmap = originalBitmap;
        Bitmap resizedBitmap = new Bitmap(newWidth, newHeight);        

        Graphics g = Graphics.FromImage(resizedBitmap);
        g.FillRectangle(new System.Drawing.SolidBrush(System.Drawing.Color.Black), new System.Drawing.Rectangle(0, 0, newWidth, newHeight));
        g.DrawImage(inputBitmap, 0, 0, newWidth, newHeight);
        
        return resizedBitmap;
    }

    //private string getWeb(string str)
    //{
    //    XmlNode node = null;
    //    System.Xml.XmlDocument xdom = new System.Xml.XmlDocument();
    //    xdom.Load(HttpContext.Current.Server.MapPath("../id.xml"));

    //    switch (str)
    //    {
    //        case "id":
    //            System.Xml.XmlNodeList webid = xdom.SelectNodes("//webid");
    //            node = webid[0];
    //            break;

    //        case "owner":
    //            System.Xml.XmlNodeList owner = xdom.SelectNodes("//owner");
    //            node = owner[0];
    //            break;
    //    }

    //    return node.InnerText;
    //}

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }

    private static ImageCodecInfo GetEncoderInfo(String mimeType)
    {
        int j;
        ImageCodecInfo[] encoders;
        encoders = ImageCodecInfo.GetImageEncoders();
        for (j = 0; j < encoders.Length; ++j)
        {
            if (encoders[j].MimeType == mimeType)
                return encoders[j];
        }
        return null;
    }
}