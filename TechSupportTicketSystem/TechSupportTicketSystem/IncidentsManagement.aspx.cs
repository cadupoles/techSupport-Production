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
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupportTicketSystem
{
    public partial class IncidentsManagement : System.Web.UI.Page
    {

        // Property for customerID
        public string CustomerID
        {
            get
            {
                return txtCustomerID.Text;
            }
        }


        // create the incident object
        App_Code.Incidents incident = new App_Code.Incidents();

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
            Server.Transfer("~/AddIncident.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            lblWarningSelection.Text = string.Empty;
        }

        protected void btnEditIncident_Click(object sender, EventArgs e)
        {
            // create the viewRow object and get the selected row values
            GridViewRow row = IncidentsGridView.SelectedRow;

            if (row == null)
            {
                lblWarningSelection.Text = "You must select an incident for editing.";
               
            }
            else
            {

                lblWarningSelection.Text = string.Empty;
               

                incident.IncidentID = Convert.ToInt32(row.Cells[0].Text);
                incident.CustomerID = Convert.ToInt32(row.Cells[1].Text);
                //incident.TechID = Convert.ToInt32(row.Cells[2].Text);
                incident.ProductCode = row.Cells[3].Text;
                incident.Title = row.Cells[4].Text;
                incident.Description = row.Cells[5].Text;
                incident.DateOpened = Convert.ToDateTime(row.Cells[6].Text);
                incident.Status = row.Cells[8].Text;

                
            
                if (row.Cells[7].Text == string.Empty)
                {
                    incident.DateClosed = incident.DateOpened;
                }

                string status = incident.Status;

                if (incident.Status == "Closed")
                {
                    lblWarningSelection.Text = "This item is closed, please select another incident.";
                }
                else
                {
                    // forward data to EditIncident
                    Session["Incident"] = incident;  //store object in session variable

                    Response.Redirect("~/EditIncident.aspx"); // page redirection
                }
              
            }

        }

        protected void btnGetCustomer_Click(object sender, EventArgs e)
        {
            
            // lables for gridviews
            
            lblCustomerGrid.Enabled = true;
            lblCustomerGrid.Text = "Customers List";

            lblIncidents.Enabled = true;
            lblIncidents.Text = "Incidents";


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblWarningSelection.Text = string.Empty;

            
        }

    
    }
}