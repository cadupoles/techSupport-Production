using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace TechSupportTicketSystem
{
    public partial class EditIncident : System.Web.UI.Page
    {
        App_Code.Incidents incident =  new App_Code.Incidents();
        App_Code.Incidents incidentUpdated = new App_Code.Incidents();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
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
                    Request.UrlReferrer;//Saves the Previous page url in ViewState

                    if (Session["Incident"] != null)
                    {
                        // Get value from Session  variable and cast it to its corresponding type
                        incident = (App_Code.Incidents)Session["Incident"];
                    }

                    txtIncidentID.Text = incident.IncidentID.ToString();
                    txtCustomerID.Text = incident.CustomerID.ToString();
                    txtDateOpened.Text = incident.DateOpened.ToShortDateString();
                    txtTitle.Text = incident.Title;
                    txtDescription.Text = incident.Description;

                    if (incident.DateClosed == incident.DateOpened)
                    {
                        txtDateClosed.Text = string.Empty;
                    }
                   
                    
                    ddlProductCode.DataBind();
                    ddlProductCode.SelectedValue = incident.ProductCode;

                    ddlTech.DataBind();
                    ddlTech.SelectedValue = incident.TechID.ToString();

                    ddlProductName.DataBind();
                    ddlCustName.DataBind();

                    ddlStatus.SelectedValue = incident.Status;

                    DateClosedCalendar.SelectedDate = DateTime.Today;

                    btnBack.Visible = false;
              

                }

            }
            catch
            {
                throw;
            }

          
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {


            
            incidentUpdated.ProductCode = ddlProductCode.SelectedValue.ToString();
            incidentUpdated.Title = txtTitle.Text;
            incidentUpdated.Description = txtDescription.Text;
            incidentUpdated.DateClosed = Convert.ToDateTime(txtDateClosed.Text);
            incidentUpdated.DateOpened = Convert.ToDateTime(txtDateOpened.Text);
            incidentUpdated.Status = ddlStatus.SelectedValue;
            incidentUpdated.TechID = Convert.ToInt32(ddlTech.SelectedValue);

            try
            {
                UpdateIncident(incident, incidentUpdated);
            }
            catch
            {
                throw;
            }
            
           
            lblConfirmation.Text = "Incident was sucessfully updated.";
            btnCancel.Visible = false;
            btnUpdate.Visible = false;
            btnBack.Visible = true;
            
        }

        private static int UpdateIncident (App_Code.Incidents incident, App_Code.Incidents incidentUpdated)
        {

            SqlConnection connection = new SqlConnection(GetConnectionString());

            string updateStament = "UPDATE Incidents "
                + " SET ProductCode = @ProductCode, Title = @Title, Description = @Description, "
                + "DateOpened = @DateOpened, DateClosed = @DateClosed, Status = @Status "
                + "WHERE IncidentID = @IncidentID AND TechID = @TechID";
                
               

            SqlCommand command = new SqlCommand(updateStament, connection);

            command.Parameters.AddWithValue("@IncidentID", incidentUpdated.IncidentID);
            command.Parameters.AddWithValue("@ProductCode", incidentUpdated.ProductCode);
            command.Parameters.AddWithValue("@Title", incidentUpdated.Title);
            command.Parameters.AddWithValue("@TechID", incidentUpdated.TechID);
            command.Parameters.AddWithValue("@Description", incidentUpdated.Description);
            command.Parameters.AddWithValue("@DateOpened", incidentUpdated.DateOpened);
            command.Parameters.AddWithValue("@DateClosed", incidentUpdated.DateClosed);
            command.Parameters.AddWithValue("@Status", incidentUpdated.Status);


            connection.Open();
            int updateCount = command.ExecuteNonQuery();
            connection.Close();
            return updateCount;
            
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["techSupportDB"].ConnectionString;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (ViewState["PreviousPage"] != null)	//Check if the ViewState 
            //contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
                //Previous page by retrieving the PreviousPage Url from ViewState.
            }
        }

        protected void DateClosedCalendar_SelectionChanged(object sender, EventArgs e)
        {
           
            
        }

        protected void txtDateClosed_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (ViewState["PreviousPage"] != null)	//Check if the ViewState 
            //contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
                //Previous page by retrieving the PreviousPage Url from ViewState.
            }
        }

        protected void DateClosedCalendar_SelectionChanged1(object sender, EventArgs e)
        {

            txtDateClosed.Text = DateClosedCalendar.SelectedDate.ToShortDateString();
            txtDateClosed.BackColor = Color.Aquamarine;
            txtDateClosed.Font.Bold = true;
        }

      
    }
}