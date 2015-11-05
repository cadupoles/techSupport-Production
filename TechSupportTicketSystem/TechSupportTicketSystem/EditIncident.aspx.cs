using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupportTicketSystem
{
    public partial class EditIncident : System.Web.UI.Page
    {
        App_Code.Incidents incident =  new App_Code.Incidents();

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

                    if (Session["Incident"] != null)
                    {
                        // Get value from Session  variable and cast it to its corresponding type
                        incident = (App_Code.Incidents)Session["Incident"];
                    }

                    txtIncidentID.Text = incident.IncidentID.ToString();
                    txtCustomerID.Text = incident.CustomerID.ToString();

                    ddlProductCode.DataBind();
                    ddlProductCode.SelectedValue = incident.ProductCode;

                    ddlTech.DataBind();
                    ddlTech.SelectedValue = incident.TechID.ToString();

                    ddlProductName.DataBind();
                
                  
              

                }

            }
            catch
            {
                throw;
            }

          
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

      
    }
}