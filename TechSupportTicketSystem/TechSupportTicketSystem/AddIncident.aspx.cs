﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace TechSupportTicketSystem
{
    public partial class AddIncident : System.Web.UI.Page
    {
        public SqlConnection connection = new SqlConnection(GetConnectionString());

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
                
                

                // Get data form the Incident Management page using strongly typed reference 
                IncidentsManagement previousPage = (IncidentsManagement) this.Page.PreviousPage;

                // Check whether it is not null to prvent Null Reference Exception
                if (previousPage != null)
                {
                    // Access the CustomerID public property
                    txtBoxCustomerID1.Text = previousPage.CustomerID;

                    GetCustomer_DB();
                }
                

                

                ViewState["PreviousPage"] =
              Request.UrlReferrer;  // Check if the ViewState contains Previous page URL

                BindDataProductsDDL_DB();

                //ddlTechnicians.AutoPostBack = true;
                //ddlTechnicians.DataBind();
                //ddlTechnicians.Items.Insert(0, new ListItem("-- Select Technician --", "0"));
            }

            // Get the date today
            DateTime dt = DateTime.Now;
            string sDate = dt.ToShortDateString();
            txtBoxDateOpened.Text = sDate;

        }

         private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["techSupportDB"].ConnectionString;
        }

        // Method for binding data of the drob down list
        private void BindDataProductsDDL_DB()
        {
            string selectStatement;

            try
            {
                // Open connection with Database and select all from Products table
                connection.Open();
                selectStatement = "SELECT * FROM Products";
                SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
                ddlProduct.DataSource = selectCommand.ExecuteReader();
                ddlProduct.DataTextField = "Name";
                ddlProduct.DataValueField = "ProductCode";
                ddlProduct.DataBind();
                ddlProduct.Items.Insert(0, new ListItem("-- Select Product --", "0")); //????

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

        }

        // Method to get customer ID and Name from database
        private void GetCustomer_DB()
        {
            string selectStatement;

            try
            {
                // Open connection with database and select all data from customers by ID
                connection.Open();
                string id = txtBoxCustomerID1.Text.ToString();

                selectStatement = "SELECT * FROM Customers WHERE CustomerID='" + id.Trim() + "'";
                SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
                SqlDataReader reader = selectCommand.ExecuteReader();

                if (reader.Read())
                {
                    txtBoxCustomerID2.Text = reader["CustomerID"].ToString();
                    txtBoxName.Text = reader["Name"].ToString();
                }

                reader.Close();

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        // Method to add incident into the database
        private void AddIncident_DB()
        {
            string insertStatement;
            DateTime dateTime;

            int custID = Int32.Parse(txtBoxCustomerID1.Text);
            string custName = Convert.ToString(txtBoxName.Text).Trim();
            //int techID = Convert.ToInt32(ddlTechnicians.SelectedValue);
            dateTime = Convert.ToDateTime(txtBoxDateOpened.Text);
            string productCode = ddlProduct.SelectedValue.Trim();
            string incTitle = Convert.ToString(txtBoxTitle.Text).Trim();
            string incDescription = Convert.ToString(txtBoxDescription.Text).Trim();
            string status = ddlStatus.SelectedValue.ToString();

            try
            {
                // Open connection with Database and insert data into Incidents table
                connection.Open();
                insertStatement = "INSERT INTO Incidents (CustomerID,ProductCode,DateOpened,Title,Description, Status) VALUES ('" + custID + "','" + productCode + "','" + dateTime.ToString("yyyy-MM-dd HH:mm:ss") + "','" + incTitle + "','" + incDescription + "','" + status + "')";

                SqlCommand insertCommand = new SqlCommand(insertStatement, connection);
                insertCommand.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ddlValue = ddlProduct.SelectedValue;
        }

        protected void btnGetCustomer_Click(object sender, EventArgs e)
        {
            GetCustomer_DB();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtBoxCustomerID1.Text = string.Empty;
            txtBoxCustomerID2.Text = string.Empty;
            txtBoxName.Text = string.Empty;
            //ddlTechnicians.ClearSelection();
            txtBoxDateOpened.Text = string.Empty;
            txtBoxTitle.Text = string.Empty;
            txtBoxDescription.Text = string.Empty;
            BindDataProductsDDL_DB();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AddIncident_DB();
            lblWarning.Visible = true;
            lblWarning.Text = "The incident has been added.";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            //// Check if the Viewstate contains Previous page URL
            //if (ViewState["PreviosPage"] != null)

            // Redirect to Previous page by retrieving the PreviousPage
            //URL from ViewState
            Response.Redirect(ViewState["PreviousPage"].ToString());
        }
    }
}