using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Xml;
using System.Net;
using System.Net.Mail;
using System.Text;

/// <summary>
/// Class1 的摘要描述
/// </summary>
public class somecode
{
    public static DataTable GetDataTable(string strsql)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        try
        {
            //建立DataAdapter
            SqlDataAdapter com = new SqlDataAdapter(strsql, con);
            //取得DataSet
            con.Open();
            DataTable tb = new DataTable();
            try
            {
                com.Fill(tb);
            }
            catch { }
            con.Close();
            return tb;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    public static Boolean ExecuteNoQuery(string strsql)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["zhongdikaiConnectionString"].ConnectionString);
        try
        {
            SqlCommand com = new SqlCommand(strsql, con);
            com.Connection.Open();
            com.ExecuteNonQuery();
            com.Connection.Close();
            return true;
        }
        catch
        {
            con.Close();
            con.Dispose();
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
}