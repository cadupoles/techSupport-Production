using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupportTicketSystem
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MasterLoginStatus_LoggedOut(object sender, EventArgs e)
        {
            Session.Abandon();
        }

        protected void MasterLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}