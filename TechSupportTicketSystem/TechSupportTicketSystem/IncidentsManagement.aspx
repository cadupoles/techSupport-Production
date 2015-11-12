<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="IncidentsManagement.aspx.cs" Inherits="TechSupportTicketSystem.IncidentsManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
        width: 82px;
    }
        .auto-style5 {
            width: 497px;
        }
        .auto-style6 {
            width: 82px;
            height: 33px;
        }
        .auto-style7 {
            width: 497px;
            height: 33px;
        }
        .auto-style8 {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 id="header_center">Incidents Management</h2>
    <div class="incidentManagement">
    <asp:Label ID="lblCustomerGrid" runat="server" Font-Size="Large"></asp:Label>
    <asp:GridView ID="CustomerGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="CustomerGridSqlDataSource" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" Width="561px">
        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="CustomerGridSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] ORDER BY [CustomerID]">
    </asp:SqlDataSource>
    <table class="auto-style2">
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lblGetCustID" runat="server" Text="Customer ID" Font-Size="Small" Font-Bold="False" style="text-align: right"></asp:Label>
                :</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
                <asp:Button ID="btnListIncidents" runat="server" Text="List Incidents" Width="207px" Font-Size="Small" OnClick="btnGetCustomer_Click" />
                <br />
            </td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style5">
                <asp:RangeValidator ID="CustomerIDRangeValidator" runat="server" ErrorMessage="RangeValidator" ControlToValidate="txtCustomerID" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" MaximumValue="9999" MinimumValue="1000">Customer ID must be between 1000 and 9999</asp:RangeValidator>
                <asp:CompareValidator ID="CustomerIDCompareValidator" runat="server" ErrorMessage="CustomerID must be a number" ControlToValidate="txtCustomerID" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <br />
                <asp:RequiredFieldValidator ID="CustomerIDRequiredFieldValidator" runat="server" ControlToValidate="txtCustomerID" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="Smaller" ForeColor="Red">This is a required field.</asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
    <asp:Label ID="lblIncidents" runat="server" Font-Size="Large"></asp:Label>
            </td>
            <td class="auto-style5">
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="IncidentsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="IncidentID" DataSourceID="IncidentsSqlDataSource" OnSelectedIndexChanged="LinkButton1_Click" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="TechID" HeaderText="TechID" SortExpression="TechID" />
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="DateOpened" HeaderText="DateOpened" SortExpression="DateOpened" />
            <asp:BoundField DataField="DateClosed" HeaderText="DateClosed" SortExpression="DateClosed" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <SelectedRowStyle BackColor="Black" ForeColor="White" />
        </asp:GridView>
    
    <asp:Button ID="btnAddIncident" runat="server" Text="Add Incident" OnClick="btnAddIncident_Click" />
    &nbsp;<asp:Button ID="btnEditIncident" runat="server" Text="Edit Incident" OnClick="btnEditIncident_Click" />
    &nbsp;<asp:SqlDataSource ID="IncidentsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Incidents] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    <asp:Label ID="lblWarningSelection" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
    
    <br />
    <br />
        </div>
    </asp:Content>


