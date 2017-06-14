<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CentroSena.aspx.cs" Inherits="SistemaWebEventosSena.Crud.CentroSena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Centros de formación </h1>
    <table class="nav-justified">
        <tr>
            <td>Codigo Centro de formación </td>
            <td>
                <asp:TextBox ID="Codigo_centro" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Nombre</td>
            <td>
                <asp:TextBox ID="Nombre_centro" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="Lb_Error" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="Btn_Consultar" runat="server" Text="Consultar" CssClass ="btn btn-default" OnClick="Btn_Consultar_Click" />
    <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" CssClass ="btn btn-primary" OnClick="Btn_Agregar_Click" />
    <asp:Button ID="Btn_Elimiar" runat="server" Text="Eliminar" CssClass ="btn btn-default" OnClick="Btn_Elimiar_Click" />
    <asp:Button ID="Btn_Editar" runat="server" Text="Editar" CssClass ="btn btn-default" OnClick="Btn_Editar_Click" />
    <br />  
    <asp:GridView ID="Gr_Centros" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Idcentro" DataSourceID="SqlDataSourcentro" CssClass ="table table-striped table-hover">
        <Columns>
            <asp:BoundField DataField="Idcentro" HeaderText="Idcentro" ReadOnly="True" SortExpression="Idcentro" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourcentro" runat="server" ConnectionString="<%$ ConnectionStrings:SiweConnection %>" SelectCommand="SELECT [Idcentro], [Descripcion] FROM [CentroSena]"></asp:SqlDataSource>
</asp:Content>








