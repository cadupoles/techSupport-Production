<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="IncidentsManagement.aspx.cs" Inherits="TechSupportTicketSystem.IncidentsManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            width: 184px;
        }
        .auto-style5 {
            width: 497px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Label ID="lblCustomerGrid" runat="server" Font-Size="Large"></asp:Label>
    <asp:GridView ID="CustomerGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="CustomerGridSqlDataSource" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center">
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
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="CustomerGridSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] ORDER BY [CustomerID]">
    </asp:SqlDataSource>
    <table class="auto-style2">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblGetCustID" runat="server" Text="Customer ID" Font-Size="Small" Font-Bold="True"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
                <asp:Button ID="btnListIncidents" runat="server" Text="List Incidents" Width="207px" Font-Size="Small" OnClick="btnGetCustomer_Click" />
                <br />
                <asp:RangeValidator ID="CustomerIDRangeValidator" runat="server" ErrorMessage="RangeValidator" ControlToValidate="txtCustomerID" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" MaximumValue="9999" MinimumValue="1000">Customer ID must be between 1000 and 9999</asp:RangeValidator>
                <br />
                <asp:RequiredFieldValidator ID="CustomerIDRequiredFieldValidator" runat="server" ControlToValidate="txtCustomerID" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="Smaller" ForeColor="Red">This is a required field.</asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CustomerIDCompareValidator" runat="server" ErrorMessage="CustomerID must be a number" ControlToValidate="txtCustomerID" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:Label ID="lblIncidents" runat="server" Font-Size="Large"></asp:Label>
    <asp:GridView ID="IncidentsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IncidentID" DataSourceID="IncidentsSqlDataSource" OnSelectedIndexChanged="LinkButton1_Click" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
            <asp:BoundField DataField="TechID" HeaderText="TechID" SortExpression="TechID" />
            <asp:BoundField DataField="DateOpened" HeaderText="DateOpened" SortExpression="DateOpened" />
            <asp:BoundField DataField="DateClosed" HeaderText="DateClosed" SortExpression="DateClosed" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    
        <asp:SqlDataSource ID="IncidentsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Incidents] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    <asp:Label ID="lblWarningSelection" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
    
    <br />
    <asp:Button ID="btnAddIncident" runat="server" Text="Add Incident" OnClick="btnAddIncident_Click" />
    <asp:Button ID="btnEditIncident" runat="server" Text="Edit Incident" OnClick="btnEditIncident_Click" />
    <br />
    </asp:Content>


