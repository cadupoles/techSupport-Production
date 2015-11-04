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
                if (!IsPostBack)
                {
                    //check for authentication
                    if (User.Identity.IsAuthenticated &&
                        User.IsInRole("Admin") && User.IsInRole("Support"))
                    {
                        btnAddIncident.Visible = true;
                    }
                    else
                    {
                        btnAddIncident.Visible = false;
                        Server.Transfer("~/AccessDenied.aspx");
                        //return;
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
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
           


        }
    }
}