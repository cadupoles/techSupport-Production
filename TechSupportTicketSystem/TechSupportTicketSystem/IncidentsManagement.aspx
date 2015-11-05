<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="IncidentsManagement.aspx.cs" Inherits="TechSupportTicketSystem.IncidentsManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="auto-style2">
        <tr>
            <td>
                <asp:Label ID="lblGetCustID" runat="server" Text="Customer ID" Font-Size="Small"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
                <asp:Button ID="btnGetCustomer" runat="server" Text="Get Customer" Width="207px" Font-Size="Small" OnClick="btnGetCustomer_Click" />
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
    <br />
    <br />
    <asp:Label ID="lblCustomerGrid" runat="server" Font-Size="Large"></asp:Label>
    <asp:GridView ID="CustomerGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="CustomerGridSqlDataSource" CellPadding="4" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
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
    <asp:SqlDataSource ID="CustomerGridSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID2)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID2" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="lblIncidents" runat="server" Font-Size="Large"></asp:Label>
    <asp:GridView ID="IncidentsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="IncidentID" DataSourceID="IncidentsSqlDataSource" OnSelectedIndexChanged="LinkButton1_Click">
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
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
    
        <asp:SqlDataSource ID="IncidentsSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" DeleteCommand="DELETE FROM [Incidents] WHERE [IncidentID] = @original_IncidentID AND [CustomerID] = @original_CustomerID AND [ProductCode] = @original_ProductCode AND (([TechID] = @original_TechID) OR ([TechID] IS NULL AND @original_TechID IS NULL)) AND [DateOpened] = @original_DateOpened AND (([DateClosed] = @original_DateClosed) OR ([DateClosed] IS NULL AND @original_DateClosed IS NULL)) AND [Title] = @original_Title AND [Description] = @original_Description AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))" InsertCommand="INSERT INTO [Incidents] ([CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title], [Description], [Status]) VALUES (@CustomerID, @ProductCode, @TechID, @DateOpened, @DateClosed, @Title, @Description, @Status)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [IncidentID], [CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title], [Description], [Status] FROM [Incidents] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Incidents] SET [CustomerID] = @CustomerID, [ProductCode] = @ProductCode, [TechID] = @TechID, [DateOpened] = @DateOpened, [DateClosed] = @DateClosed, [Title] = @Title, [Description] = @Description, [Status] = @Status WHERE [IncidentID] = @original_IncidentID AND [CustomerID] = @original_CustomerID AND [ProductCode] = @original_ProductCode AND (([TechID] = @original_TechID) OR ([TechID] IS NULL AND @original_TechID IS NULL)) AND [DateOpened] = @original_DateOpened AND (([DateClosed] = @original_DateClosed) OR ([DateClosed] IS NULL AND @original_DateClosed IS NULL)) AND [Title] = @original_Title AND [Description] = @original_Description AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_IncidentID" Type="Int32" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_TechID" Type="Int32" />
                <asp:Parameter Name="original_DateOpened" Type="DateTime" />
                <asp:Parameter Name="original_DateClosed" Type="DateTime" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Status" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="TechID" Type="Int32" />
                <asp:Parameter Name="DateOpened" Type="DateTime" />
                <asp:Parameter Name="DateClosed" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCustomerID" Name="CustomerID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="TechID" Type="Int32" />
                <asp:Parameter Name="DateOpened" Type="DateTime" />
                <asp:Parameter Name="DateClosed" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="original_IncidentID" Type="Int32" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_TechID" Type="Int32" />
                <asp:Parameter Name="original_DateOpened" Type="DateTime" />
                <asp:Parameter Name="original_DateClosed" Type="DateTime" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Status" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    <br />
    <asp:Button ID="btnAddIncident" runat="server" Text="Add Incident" OnClick="btnAddIncident_Click" />
    <asp:Button ID="btnEditIncident" runat="server" Text="Edit Incident" OnClick="btnEditIncident_Click" />
    <br />
    </asp:Content>


