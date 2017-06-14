using CAD;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaWebEventosSena.Crud
{
    public partial class Agendador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime fecha = e.Day.Date;

            List<CADAgenda> miLista = new List<CADAgenda>();

            SIWEDataSet.AgendaDataTable miEvento = CADAgenda.GetData();

            if (miEvento == null)
            {
                return;
            }


            foreach (var item in miEvento)
            {
                CADAgenda agenda = new CADAgenda();

                agenda.Direccion_agenda = item.Direccion_agenda;
                agenda.Duracion_agenda = item.Duracion_agenda;
                agenda.Evento_agenda = item.Evento_agenda;
                agenda.Fecha_agenda = item.Fecha_agenda;
                agenda.Idagenda = item.Idsede;
                agenda.Idsede = item.Idsede;

                miLista.Add(agenda);
            }

            foreach (var item in miLista)
            {
                if (string.Equals(item.Fecha_agenda, fecha))
                {
                    Literal miEventNameLiteral = new Literal();

                    miEventNameLiteral.Mode = LiteralMode.PassThrough;
                    miEventNameLiteral.Text = "<br /> <span style='font-size:10px;'>" + item.Evento_agenda + "</span><br/>";
                    e.Cell.Controls.Add(miEventNameLiteral);
                }
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime fecha = Calendar1.SelectedDate;

            List<CADAgenda> miLista = new List<CADAgenda>();

            CADAgenda miEvento = CADAgenda.GetDataByFecha(fecha);

            if (miEvento == null)
            {
                Panel1.Visible = true;
                nuevoButton.Visible = true;
                modificarButton.Visible = false;
                eliminarButton.Visible = false;
                cancelarButton.Visible = false;
                guardarButton.Visible = false;
                miLista.Clear();
                agendaDetailsView.DataBind();
                return;
            }

            Panel1.Visible = true;
            nuevoButton.Visible = false;
            modificarButton.Visible = true;
            eliminarButton.Visible = true;
            cancelarButton.Visible = true;
            guardarButton.Visible = false;

            miLista.Add(miEvento);

            agendaDetailsView.DataSource = miLista;

            agendaDetailsView.DataBind();
        }

        protected void nuevoButton_Click(object sender, EventArgs e)
        {
            CamposPanel.Visible = true;
            guardarButton.Visible = true;
            cancelarButton.Visible = true;
            nuevoButton.Visible = false;

            fechaTextBox.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void modificarButton_Click(object sender, EventArgs e)
        {
            guardarButton.Visible = true;
            CamposPanel.Visible = true;

            string idAgenda = agendaDetailsView.Rows[0].Cells[1].Text;

            SIWEDataSet.AgendaDataTable miAgenda = CADAgenda.GetAgendaByIdagenda(Convert.ToInt32(idAgenda));

            foreach (DataRow item in miAgenda)
            {
                idAgendaTextBox.Text = item["Idagenda"].ToString();
                DropDownListSede.SelectedValue = item["Idsede"].ToString();
                eventoTextBox.Text = item["Evento_agenda"].ToString();
                fechaTextBox.Text = Convert.ToDateTime(item["Fecha_agenda"].ToString()).ToShortDateString();
                duracionTextBox.Text = item["Duracion_agenda"].ToString();
                direccionTextBox.Text = item["Direccion_agenda"].ToString();
            }

            modificarButton.Visible = false;
            eliminarButton.Visible = false;
        }

        protected void eliminarButton_Click(object sender, EventArgs e)
        {
            try
            {
                CADAgenda.DeleteAgenda(Convert.ToInt32(agendaDetailsView.Rows[0].Cells[1].Text));

                Calendar1_SelectionChanged(sender, e);
                LimpiarCampos();
            }
            catch (Exception)
            {

                LabelMensaje.Text = "No es posible eliminar el evento";
            }
        }

        protected void cancelarButton_Click(object sender, EventArgs e)
        {
            Calendar1_SelectionChanged(sender, e);
            CamposPanel.Visible = false;

            LimpiarCampos();
        }

        private void LimpiarCampos()
        {
            LabelMensaje.Text = string.Empty;
            idAgendaTextBox.Text = string.Empty;
            DropDownListSede.SelectedIndex = 0;
            eventoTextBox.Text = string.Empty;
            fechaTextBox.Text = string.Empty;
            duracionTextBox.Text = string.Empty;
            direccionTextBox.Text = string.Empty;
        }

        protected void guardarButton_Click(object sender, EventArgs e)
        {
            if (agendaDetailsView.Rows.Count == 1)
            {
                if (!ValidaCampos())
                {
                    return;
                }

                CADAgenda.InsertAgenda(Convert.ToInt32(idAgendaTextBox.Text),
                Convert.ToInt32(DropDownListSede.SelectedValue),
                eventoTextBox.Text, Convert.ToDateTime(fechaTextBox.Text),
                Convert.ToInt32(duracionTextBox.Text), direccionTextBox.Text);

                LabelMensaje.Text = "El evento ha sido ingresado";

                CamposPanel.Visible = false;
                guardarButton.Visible = false;
                cancelarButton.Visible = false;
            }
            else
            {
                CADAgenda.UpdateAgenda(Convert.ToInt32(idAgendaTextBox.Text),
                Convert.ToInt32(DropDownListSede.SelectedValue),
                eventoTextBox.Text, Convert.ToDateTime(fechaTextBox.Text),
                Convert.ToInt32(duracionTextBox.Text), direccionTextBox.Text);

                LabelMensaje.Text = "El evento ha sido actualizado";

                CamposPanel.Visible = false;
                guardarButton.Visible = false;
                cancelarButton.Visible = false;
            }

            Calendar1_SelectionChanged(sender, e);
            LimpiarCampos();
        }

        private bool ValidaCampos()
        {
            if (idAgendaTextBox.Text == string.Empty)
            {
                LabelMensaje.Text = "Debe ingresar un Id Agenda";
                idAgendaTextBox.Focus();
                return false;
            }

            int IDAgenda = 0;

            if (!int.TryParse(idAgendaTextBox.Text, out IDAgenda))
            {
                LabelMensaje.Text = "Debe ingresar un Id Agenda numerico";
                idAgendaTextBox.Focus();
                return false;
            }

            if (IDAgenda <= 0)
            {
                LabelMensaje.Text = "Debe ingresar una Id Agenda mayor a cero [0]";
                idAgendaTextBox.Focus();
                return false;
            }

            if (DropDownListSede.SelectedIndex == 0)
            {
                LabelMensaje.Text = "Debe selecionar una sede";
                DropDownListSede.Focus();
                return false;
            }
            if (eventoTextBox.Text == string.Empty)
            {
                LabelMensaje.Text = "Debe ingresar un evento";
                eventoTextBox.Focus();
                return false;
            }

            if (fechaTextBox.Text == string.Empty)
            {
                LabelMensaje.Text = "Debe ingresar una fecha";
                fechaTextBox.Focus();
                return false;
            }

            DateTime fecha;

            if (!DateTime.TryParse(fechaTextBox.Text, out fecha))
            {
                LabelMensaje.Text = "Debe ingresar una fecha valida";
                fechaTextBox.Focus();
                return false;
            }

            if (duracionTextBox.Text == string.Empty)
            {
                LabelMensaje.Text = "Debe ingresar una duracion";
                duracionTextBox.Focus();
                return false;
            }

            int duracion = 0;

            if (!int.TryParse(duracionTextBox.Text, out duracion))
            {
                LabelMensaje.Text = "Debe ingresar una duracion numerica";
                duracionTextBox.Focus();
                return false;
            }

            if (duracion <= 0)
            {
                LabelMensaje.Text = "Debe ingresar una duracion mayor a cero [0]";
                duracionTextBox.Focus();
                return false;
            }

            if (direccionTextBox.Text == string.Empty)
            {
                LabelMensaje.Text = "Debe ingresar una direccion";
                duracionTextBox.Focus();
                return false;
            }

            return true;
        }
    }
}