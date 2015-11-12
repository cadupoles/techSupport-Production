<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddIncident.aspx.cs" Inherits="TechSupportTicketSystem.AddIncident" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    
    <style>
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 83px;
        }
        .auto-style3 {
            width: 354px;
        }
        .auto-style4 {
            width: 83px;
            height: 26px;
        }
        .auto-style5 {
            width: 354px;
            height: 26px;
        }
        .auto-style6 {
            width: 83px;
            height: 23px;
        }
        .auto-style7 {
            width: 354px;
            height: 23px;
        }
        .auto-style8 {
            width: 83px;
            height: 33px;
        }
        .auto-style9 {
            width: 354px;
            height: 33px;
        }
        .auto-style10 {
            height: 33px;
        }
    </style>
    
    <h2 id="header_center">Add Incident</h2>

    <div class="addIncident_page">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lblCustomerID1" runat="server" Text="Customer ID:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtBoxCustomerID1" runat="server" style="margin-left: 0px" Width="70px"></asp:TextBox>
&nbsp;<asp:Button ID="btnGetCustomer" runat="server" OnClick="btnGetCustomer_Click" Text="Get Customer" Width="96px" />
                </td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="CustomerIDValidator" runat="server" BorderColor="Red" BorderStyle="Solid" ControlToValidate="txtBoxCustomerID1" ErrorMessage="* required field" ForeColor="#FF3300" ValidationGroup="AddIncidentGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BorderColor="Red" BorderStyle="Solid" ControlToValidate="txtBoxCustomerID1" ErrorMessage="* the input should be a numeric value" ForeColor="Red" ValidationExpression="^[0-9]+$" ValidationGroup="AddIncidentGroup"></asp:RegularExpressionValidator>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblCustomerID2" runat="server" Text="Customer ID:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBoxCustomerID2" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtBoxName" runat="server" ReadOnly="True" Width="340px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <%--<asp:DropDownList ID="ddlTechnicians" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="TechID" Width="200px">
                        <asp:ListItem Selected="True" Value="1">-- Select Technician  --</asp:ListItem>
                    </asp:DropDownList>--%>
                </td>
                <td class="auto-style3">
                    <%--<asp:DropDownList ID="ddlTechnicians" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="TechID" Width="200px">
                        <asp:ListItem Selected="True" Value="1">-- Select Technician  --</asp:ListItem>
                    </asp:DropDownList>--%>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDateOpend" runat="server" Text="Date Opened:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBoxDateOpened" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblProduct" runat="server" Text="Product:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlProduct" runat="server" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" Width="200px" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>Status<asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem>Open</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBoxTitle" runat="server" Width="340px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="TitleValidator" runat="server" BorderColor="Red" BorderStyle="Solid" ControlToValidate="txtBoxTitle" ErrorMessage="* required field" ForeColor="Red" ValidationGroup="AddIncidentGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtBoxDescription" runat="server" Height="73px" TextMode="MultiLine" Width="340px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="TitleValidator0" runat="server" BorderColor="Red" BorderStyle="Solid" ControlToValidate="txtBoxDescription" ErrorMessage="* required field" ForeColor="Red" ValidationGroup="AddIncidentGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="lblWarning" runat="server" Visible="False"></asp:Label>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" Width="83px" OnClick="btnAdd_Click" ValidationGroup="AddIncidentGroup" />
                &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Reset" Width="83px" OnClick="btnCancel_Click" />
                &nbsp;
                    </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" SelectCommand="SELECT [Name], [TechID] FROM [Technicians]"></asp:SqlDataSource>
                </td>
                <td></td>
            </tr>
            </table>
    </div>
</asp:Content>
