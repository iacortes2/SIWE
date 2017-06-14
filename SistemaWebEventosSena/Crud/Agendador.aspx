<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agendador.aspx.cs" Inherits="SistemaWebEventosSena.Crud.Agendador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="container">
            <table class="table">
                <tr>
                    <td rowspan="2" style="width: 70%;">
                        <asp:Calendar ID="Calendar1" runat="server" Height="450px" 
                            OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" NextPrevFormat="FullMonth" TitleFormat="Month" Width="100%" CellSpacing="2">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                            <DayStyle Width="14%" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                            <TodayDayStyle BackColor="#CCCC99" />
                        </asp:Calendar>
                    </td>
                    <td>
                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            &nbsp;<asp:Button ID="nuevoButton" runat="server" CssClass="btn btn-success btn-sm" Text="Nuevo" OnClick="nuevoButton_Click" />
                            &nbsp;<asp:Button ID="modificarButton" runat="server" CssClass="btn btn-warning btn-sm" OnClick="modificarButton_Click" Text="Modifcar" />
                            &nbsp;<asp:Button ID="eliminarButton" runat="server" CssClass="btn btn-danger btn-sm" Text="Eliminar" OnClick="eliminarButton_Click" OnClientClick="return confirm('¿Esta seguro de borrar el registro?')" />
                            &nbsp;<asp:Button ID="cancelarButton" runat="server" CssClass="btn btn-default btn-sm" Text="Cancelar" OnClick="cancelarButton_Click" />
                            &nbsp;<asp:Button ID="guardarButton" runat="server" CssClass="btn btn-success btn-sm" Text="Guardar" OnClick="guardarButton_Click" />
                            <br />
                            <br />
                            <asp:Label ID="LabelMensaje" runat="server" Text="" CssClass="lead"></asp:Label>
                            <br />
                        </asp:Panel>
                        <br />
                        <asp:Panel ID="CamposPanel" runat="server" Visible="False">
                            <table class="auto-style1">
                                <tr>
                                    <td>
                                        Id Agenda:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="idAgendaTextBox" runat="server" Width="180px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Sede:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListSede" runat="server" DataSourceID="SqlDataSourceSede" DataTextField="Descripcion" DataValueField="Idsede"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceSede" runat="server" ConnectionString="<%$ ConnectionStrings:SiweConnection %>" SelectCommand="SELECT [Idsede], [Descripcion] FROM [SedeSena]
UNION
SELECT 0, '[Seleccione Sede]'
Order By 2"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Evento:</td>
                                    <td>
                                        <asp:TextBox ID="eventoTextBox" runat="server" Width="180px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Fecha:</td>
                                    <td>
                                        <asp:TextBox ID="fechaTextBox" runat="server" Width="180px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Duración (dias):</td>
                                    <td>
                                        <asp:TextBox ID="duracionTextBox" runat="server" Width="180px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Dirección</td>
                                    <td>
                                        <asp:TextBox ID="direccionTextBox" runat="server" Width="180px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>

                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td style="width:25%;">
                        <asp:DetailsView ID="agendaDetailsView" runat="server" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Height="50px" Width="280px"
                            AutoGenerateRows="False"
                            EmptyDataText="<h2 style='width:70%; text-align:center;'>No hay evento registrado</h2>">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="Idagenda" HeaderText="Id Agenda" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
<asp:BoundField DataField="Idsede" HeaderText="Sede">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Evento_agenda" HeaderText="Evento" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fecha_agenda" DataFormatString="{0:D}" HeaderText="Fecha" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Duracion_agenda" HeaderText="Duracion" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Direccion_agenda" HeaderText="Direccion" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Fields>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>
                    </td>
                </tr>
            </table>

        </div>
</asp:Content>
