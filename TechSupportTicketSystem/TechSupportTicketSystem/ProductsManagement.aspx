<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductsManagement.aspx.cs" Inherits="TechSupportTicketSystem.ProductsManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Products List</h2>
    <asp:GridView ID="ProductsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ProductCode" DataSourceID="ProductsSqlDataSource" ShowFooter="True">
        <Columns>
            <asp:TemplateField HeaderText="ProductCode" SortExpression="ProductCode">
                <EditItemTemplate>
                    <asp:TextBox ID="txtProductCodeEdit" runat="server" Text='<%# Bind("ProductCode") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductCodeInsertRequiredFieldValidator" runat="server" ErrorMessage="Product Code is a required field." ControlToValidate="txtProductCodeEdit" Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductCodeInsertRequiredFieldValidator1" runat="server" ControlToValidate="txtProductCode" ErrorMessage="ProductCode is a required field." Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:CompareValidator ID="NameEditCompareValidator" runat="server" ControlToValidate="txtNameEdit" ErrorMessage="Name must contain letters." ValueToCompare="string" Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="NameEditRequiredFieldValidator" runat="server" ControlToValidate="txtNameEdit" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name must contain letters." ValueToCompare="String" Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Product is a required field." Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Version" SortExpression="Version">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditVersion" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                    <asp:CompareValidator ID="VersionEditCompareValidator" runat="server" ControlToValidate="txtEditVersion" ErrorMessage="Version must be number with one digit." Type="Currency" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Version is a required field." Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="VersionCompareValidator" runat="server" ControlToValidate="txtVersion" ErrorMessage="Version must  be a number with one digit." Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Type="Currency" Operator="DataTypeCheck"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="VersionRequiredFieldValidator" runat="server" ControlToValidate="txtVersion" ErrorMessage="Version is a required field." Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEditDate" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="DateEditRequiredFieldValidator" runat="server" ControlToValidate="txtEditDate" ErrorMessage="Release Date is a required field." Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="DateEditCompareValidator" runat="server" ControlToValidate="txtEditDate" ErrorMessage="Please enter a valid date." Type="Date" Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Operator="DataTypeCheck"></asp:CompareValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtReleaseDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="DateRequiredFieldValidator" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Release Date is a required field." Font-Bold="True" Font-Size="Smaller" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="DateEditCompareValidator" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Please enter a valid date." Font-Bold="True" Font-Size="Smaller" ForeColor="Red" Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Insert" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:SqlDataSource ID="ProductsSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProductCode], [Name], [Version], [ReleaseDate] FROM [Products]" UpdateCommand="UPDATE [Products] SET [ProductCode] = @ProductCode, [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
