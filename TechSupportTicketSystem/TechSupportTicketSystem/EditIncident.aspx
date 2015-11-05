<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditIncident.aspx.cs" Inherits="TechSupportTicketSystem.EditIncident" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 75%;
        }
        .auto-style10 {
            width: 439px;
        }
        .auto-style11 {
            width: 439px;
            height: 32px;
        }
        .auto-style12 {
            width: 461px;
        }
        .auto-style13 {
            width: 461px;
            height: 32px;
        }
        .auto-style14 {
            width: 439px;
            height: 47px;
        }
        .auto-style15 {
            width: 461px;
            height: 47px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table align="center" class="auto-style4">
        <tr>
            <td class="auto-style10">Incident ID<asp:TextBox ID="txtIncidentID" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">Customer ID
                <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style15">Customer Name</td>
        </tr>
        <tr>
            <td class="auto-style11">Product Code<asp:DropDownList ID="ddlProductCode" runat="server" DataSourceID="ProductsSqlDataSource" DataTextField="ProductCode" DataValueField="ProductCode"  AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="ProductsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" SelectCommand="SELECT [ProductCode], [Name], [Version], [ReleaseDate] FROM [Products]"></asp:SqlDataSource>
            </td>
            <td class="auto-style13">Product Name<asp:DropDownList ID="ddlProductName" runat="server" AutoPostBack="True" DataSourceID="ProductNameSqlDataSource" DataTextField="Name" DataValueField="ProductCode">
                </asp:DropDownList>
                <asp:SqlDataSource ID="ProductNameSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" SelectCommand="SELECT [ProductCode], [Name], [Version], [ReleaseDate] FROM [Products] WHERE ([ProductCode] = @ProductCode)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlProductCode" Name="ProductCode" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Tech Name<asp:DropDownList ID="ddlTech" runat="server" AutoPostBack="True" DataSourceID="TechSqlDataSource" DataTextField="Name" DataValueField="TechID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="TechSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" SelectCommand="SELECT DISTINCT Technicians.Name, Incidents.TechID
FROM  Incidents INNER JOIN
         Technicians ON Incidents.TechID = Technicians.TechID ORDER BY Technicians.Name">
                </asp:SqlDataSource>
            </td>
            <td class="auto-style13">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">DateOpened <asp:TextBox ID="txtDateOpened" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">DateClosed<asp:TextBox ID="txtDateClosed" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" />
            </td>
            <td class="auto-style12">
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
            </td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>
