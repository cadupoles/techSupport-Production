﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductsManagement.aspx.cs" Inherits="TechSupportTicketSystem.ProductsManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 id="header_center">Products Maintenance</h2>
    <div class="productManagement">
        <asp:GridView ID="ProductsGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductCode" DataSourceID="ProductsSqlDataSource" Font-Size="Small" ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="ProductCode" SortExpression="ProductCode">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditProductCode" runat="server" Text='<%# Bind("ProductCode") %>'>> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="EditProductCodeRequiredFieldValidator" runat="server" ControlToValidate="txtEditProductCode" ErrorMessage="ProductCode is a required field" Font-Bold="True" ForeColor="Red" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ProductCodeRequiredFieldValidator" runat="server" ControlToValidate="txtProductCode" ErrorMessage="ProductCode is a required field" Font-Bold="True" ForeColor="Red" ValidationGroup="Footer"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditName" runat="server" Font-Bold="False" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EditNameRequiredFieldValidator" runat="server" ControlToValidate="txtEditName" ErrorMessage="Name is a required field." Font-Bold="True" ForeColor="Red" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Name is a required field." Font-Bold="True" ForeColor="Red" ValidationGroup="Footer"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version" SortExpression="Version">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditVersion" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EditVersionRequiredFieldValidator" runat="server" ControlToValidate="txtEditVersion" ErrorMessage="Version is a required field." Font-Bold="True" ForeColor="Red" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="EditVersionCompareValidator" runat="server" ControlToValidate="txtEditVersion" ErrorMessage="Version must be a number." Font-Bold="True" ForeColor="Red" Operator="DataTypeCheck" Type="Currency" ValidationGroup="Edit"></asp:CompareValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="VersionRequiredFieldValidator" runat="server" ControlToValidate="txtVersion" ErrorMessage="Version is a required field." Font-Bold="True" ForeColor="Red" ValidationGroup="Footer"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="VersionCompareValidator" runat="server" ControlToValidate="txtVersion" ErrorMessage="Version must be a number." Font-Bold="True" ForeColor="Red" Operator="DataTypeCheck" Type="Currency" ValidationGroup="Footer"></asp:CompareValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditReleaseDate" runat="server" Text='<%# Bind("ReleaseDate") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EditReleaseDateRequiredFieldValidator" runat="server" ControlToValidate="txtEditReleaseDate" ErrorMessage="Date is a required field." Font-Bold="True" ForeColor="Red" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="EditReleaseDateCompareValidator" runat="server" ControlToValidate="txtEditReleaseDate" ErrorMessage="Date must be ddd/MM/yyyy" ForeColor="Red" Operator="DataTypeCheck" Type="Date" ValidationGroup="Edit"></asp:CompareValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtReleaseDate" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReleaseDateRequiredFieldValidator" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Date is a required field." Font-Bold="True" ForeColor="Red" ValidationGroup="Footer"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="ReleaseDateCompareValidator" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Date must be ddd/MM/yyyy" ForeColor="Red" Operator="DataTypeCheck" Type="Date" ValidationGroup="Footer"></asp:CompareValidator>
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
                        <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Insert" ValidationGroup="Footer" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="ProductsSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:techSupportDB %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProductCode], [Name], [Version], [ReleaseDate] FROM [Products]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
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
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
    </asp:Content>
