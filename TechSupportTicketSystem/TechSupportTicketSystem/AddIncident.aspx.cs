using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TechSupportTicketSystem
{
    public partial class AddIncident : System.Web.UI.Page
    {
        public SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Andrey\Desktop\GitHub\techSupport-Production\TechSupportTicketSystem\TechSupportTicketSystem\App_Data\TechSupport.mdf;Integrated Security=True");

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

                ViewState["PreviousPage"] =
              Request.UrlReferrer;  // Check if the ViewState contains Previous page URL

                BindDataProductsDDL_DB();

                ddlTechnicians.AutoPostBack = true;
                ddlTechnicians.DataBind();
                ddlTechnicians.Items.Insert(0, new ListItem("-- Select Technician --", "0"));
            }

            // Get the date today
            DateTime dt = DateTime.Now;
            string sDate = dt.ToShortDateString();
            txtBoxDateOpened.Text = sDate;

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

            int custID = Int32.Parse(txtBoxCustomerID2.Text);
            string custName = Convert.ToString(txtBoxName.Text).Trim();
            int techID = Convert.ToInt32(ddlTechnicians.SelectedValue);
            dateTime = Convert.ToDateTime(txtBoxDateOpened.Text);
            string productCode = ddlProduct.SelectedValue.Trim();
            string incTitle = Convert.ToString(txtBoxTitle.Text).Trim();
            string incDescription = Convert.ToString(txtBoxDescription.Text).Trim();

            try
            {
                // Open connection with Database and insert data into Incidents table
                connection.Open();
                insertStatement = "INSERT INTO Incidents (CustomerID,ProductCode,TechID,DateOpened,Title,Description) VALUES ('" + custID + "','" + productCode + "','" + techID + "','" + dateTime.ToString("yyyy-MM-dd HH:mm:ss") + "','" + incTitle + "','" + incDescription + "')";

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
            ddlTechnicians.ClearSelection();
            txtBoxDateOpened.Text = string.Empty;
            txtBoxTitle.Text = string.Empty;
            txtBoxDescription.Text = string.Empty;
            BindDataProductsDDL_DB();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AddIncident_DB();
            Response.Redirect("~/Default.aspx");
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