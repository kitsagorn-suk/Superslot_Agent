using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp.Authenticators;
using RestSharp;
using Newtonsoft.Json.Linq;
using System.Net;
using System.Net.Sockets;

namespace Super_Slot
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Login_OnClick(object sender, EventArgs e)
        {
         
        }

        private string GetIPAddress()
        {
            String strHostName = string.Empty;
            strHostName = Dns.GetHostName();
            IPHostEntry ipHostEntry = Dns.GetHostEntry(strHostName);
            IPAddress[] address = ipHostEntry.AddressList;
            return address[1].ToString();
        }
    }
}