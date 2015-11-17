/*
 * Author: Carlos Poles
 * Student: 2104447014
 * Project: TechWebSupport
 * Known Bugs: None
 * Version: 1.0
 * 
*/



using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace TechSupportTicketSystem
{
    public partial class ProductsManagement : System.Web.UI.Page
    {

        
        string productCode;
        string name;
        decimal version;
        DateTime releaseDate;
       
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Chech if the page is loaded for the first time
            if (!this.IsPostBack)
            {
                // Check if the user is authencticated and has one of the role
                if (!User.Identity.IsAuthenticated || (!User.IsInRole("Admin") &&
                    (!User.IsInRole("Support"))))
                {
                    Server.Transfer("~/AccessDenied.aspx");
                    // Response.Redirect("~/AccessDenied.aspx");
                    return;
                }
            }
        }

      
        private class Product
        {
            public Product()
            {

            }

            private string productCode;

            public string ProductCode
            {
                get { return productCode; }
                set { productCode = value; }
            }



            private string name;

            public string Name
            {
                get { return name; }
                set { name = value; }
            }

            private decimal version;

            public decimal Version
            {
                get { return version; }
                set { version = value; }
            }

            private DateTime releaseDate;

            public DateTime ReleaseDate
            {
                get { return releaseDate; }
                set { releaseDate = value; }
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["techSupportDB"].ConnectionString;
        }
        
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            TextBox txtproductCode = (TextBox)ProductsGridView.FooterRow.FindControl("txtProductCode");
            TextBox txtName = (TextBox)ProductsGridView.FooterRow.FindControl("txtName");
            TextBox txtVersion = (TextBox)ProductsGridView.FooterRow.FindControl("txtVersion");
            TextBox txtReleaseDate = (TextBox)ProductsGridView.FooterRow.FindControl("txtReleaseDate");

            productCode = txtproductCode.Text;
            name = txtName.Text;
            version = Convert.ToDecimal(txtVersion.Text);
            releaseDate = Convert.ToDateTime(txtReleaseDate.Text);

            string insertStatement =
                                 "INSERT INTO Products (ProductCode, Name, Version, ReleaseDate) "
                                + "VALUES (@ProductCode, @Name, @Version, @ReleaseDate) ";


            SqlConnection connection = new SqlConnection(GetConnectionString());

            SqlCommand command = new SqlCommand(insertStatement, connection);

            command.Parameters.AddWithValue("@ProductCode", productCode);
            command.Parameters.AddWithValue("@Name", name);
            command.Parameters.AddWithValue("@Version", version);
            command.Parameters.AddWithValue("@ReleaseDate", releaseDate);

            connection.Open();
            command.ExecuteNonQuery();

            ProductsGridView.DataBind();
        }
        
    }
}