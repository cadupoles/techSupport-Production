<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TechSupportTicketSystem.Account.Login" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

             <%--Element control for autorisation--%>
        <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn"></asp:Login> 
    
</asp:Content>
