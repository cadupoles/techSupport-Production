using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechSupportTicketSystem.App_Code
{
    public class Incidents
    {

        public Incidents()
        {

        }


        private int incidentID;

        public int IncidentID
        {
            get { return incidentID; }
            set { incidentID = value; }
        }

        private int customerID;

        public int CustomerID
        {
            get { return customerID; }
            set { customerID = value; }
        }

        private string productCode;

        public string ProductCode
        {
            get { return productCode; }
            set { productCode = value; }
        }

        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }

        private string description;

        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        

        private int techID;

        public int TechID
        {
            get { return techID; }
            set { techID = value; }
        }

        private DateTime dateOpened;

        public DateTime DateOpened
        {
            get { return dateOpened; }
            set { dateOpened = value; }
        }

        private DateTime dateClosed;

        public DateTime DateClosed
        {
            get { return dateClosed; }
            set { dateClosed = value; }
        }

        private string status;

        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        
        
        

    }
}