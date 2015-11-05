using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupportTicketSystem
{
    public partial class IncidentsManagement : System.Web.UI.Page
    {
        

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


                }


                MembershipUser loggedUser;

                if (HttpContext.Current != null && HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    MembershipUser user = Membership.GetUser();
                    if (user != null)
                    {
                        loggedUser = user;
                    }
                }
            }
            catch 
            {
                throw;
            }

            lblCustomerGrid.Enabled = false;
            lblIncidents.Enabled = false;

        }

        protected void btnAddIncident_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddIncident.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            


        }

        protected void btnEditIncident_Click(object sender, EventArgs e)
        {
            // create the viewRow object and get the selected row values
            GridViewRow row = IncidentsGridView.SelectedRow;

            // create the incident object
            App_Code.Incidents incident = new App_Code.Incidents();

            incident.IncidentID = Convert.ToInt32(row.Cells[0].Text);
            incident.CustomerID = Convert.ToInt32(row.Cells[1].Text);
            incident.TechID = Convert.ToInt32(row.Cells[2].Text);
            incident.ProductCode = row.Cells[3].Text;
            incident.Title = row.Cells[4].Text;
            incident.Description = row.Cells[5].Text;
            incident.DateOpened = Convert.ToDateTime(row.Cells[6].Text);
            

            if (row.Cells[7].Text == string.Empty)
            {
                incident.DateClosed = DateTime.Today;
            }
            
            incident.Status = row.Cells[8].Text;

           
            //code to set values in obj1
            Session["Incident"] = incident;  //store object in session variable

            Response.Redirect("~/EditIncident.aspx");

        }

        protected void btnGetCustomer_Click(object sender, EventArgs e)
        {
            
            lblCustomerGrid.Enabled = true;
            lblCustomerGrid.Text = "Customer Detail";

            lblIncidents.Enabled = true;
            lblIncidents.Text = "Incidents";


        }

        //public class Incidents
        //{

        //    public Incidents()
        //    {

        //    }


        //    private int incidentID;

        //    public int IncidentID
        //    {
        //        get { return incidentID; }
        //        set { incidentID = value; }
        //    }

        //    private int customerID;

        //    public int CustomerID
        //    {
        //        get { return customerID; }
        //        set { customerID = value; }
        //    }

        //    private string productCode;

        //    public string ProductCode
        //    {
        //        get { return productCode; }
        //        set { productCode = value; }
        //    }

        //    private string title;

        //    public string Title
        //    {
        //        get { return title; }
        //        set { title = value; }
        //    }

        //    private string description;

        //    public string Description
        //    {
        //        get { return description; }
        //        set { description = value; }
        //    }


        //    private int techID;

        //    public int TechID
        //    {
        //        get { return techID; }
        //        set { techID = value; }
        //    }

        //    private DateTime dateOpened;

        //    public DateTime DateOpened
        //    {
        //        get { return dateOpened; }
        //        set { dateOpened = value; }
        //    }

        //    private DateTime dateClosed;

        //    public DateTime DateClosed
        //    {
        //        get { return dateClosed; }
        //        set { dateClosed = value; }
        //    }

        //    private string status;

        //    public string Status
        //    {
        //        get { return status; }
        //        set { status = value; }
        //    }
        //}
    }
}