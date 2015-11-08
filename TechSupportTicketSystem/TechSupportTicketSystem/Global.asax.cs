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
using System.Web.SessionState;

namespace TechSupportTicketSystem
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // when the application starts

            Application["userCount"] = 0;

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // code that runs on session startup, when connects to the server

            Session["mydata"] = 0;

            //Code taht loads the Application object
            Application.Lock();
            Application["userCount"] = (int)Application["userCount"] + 1;
            Application.UnLock();


        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}