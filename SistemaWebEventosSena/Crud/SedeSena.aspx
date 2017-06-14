<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SedeSena.aspx.cs" Inherits="SistemaWebEventosSena.Crud.SedeSena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <h1>Sedes Sena </h1>
    <table class="nav-justified">
        <tr>
            <td>Codigo Sedes de Sena </td>
            <td>
                <asp:TextBox ID="Codigo_sede" runat="server" Width="83px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Nombre</td>
            <td>
                <asp:TextBox ID="Nombre_sede" runat="server" Width="262px"></asp:TextBox>
            </td>
        </tr>

      <tr>
            <td>Codigo Centro de fomración</td>
            <td>
                <asp:TextBox ID="Codigo_centro" runat="server" Width="77px"></asp:TextBox>
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
    <asp:GridView ID="Gr_Sedes" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Idsede" DataSourceID="SqlDataSoursede" CssClass ="table table-striped table-hover">
        <Columns>
            <asp:BoundField DataField="Idsede" HeaderText="Idcentro" ReadOnly="True" SortExpression="Idsede" />
            <asp:BoundField DataField="Idcentro" HeaderText="Idcentro" ReadOnly="True" SortExpression="Idcentro" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSoursede" runat="server" ConnectionString="<%$ ConnectionStrings:SiweConnection %>" SelectCommand="SELECT [Idsede],[Idcentro], [Descripcion] FROM [SedeSena]"></asp:SqlDataSource>
</asp:Content>
