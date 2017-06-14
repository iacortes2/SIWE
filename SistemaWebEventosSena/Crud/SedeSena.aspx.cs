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
    public partial class SedeSena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Consultar_Click(object sender, EventArgs e)
        {
            if (Codigo_sede.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el Código de la sede";
                Codigo_sede.Focus();
                return;
            }

            SIWEDataSet.SedeSenaDataTable Mi_sede = CAD.CADSede.GetSedeByIdsede(Int32.Parse(Codigo_sede.Text));
           

            if (Mi_sede == null)
            {
                Lb_Error.Text = "El código ingresado no existe en el sistema";
                Codigo_sede.Focus();
                return;
            }


            foreach (DataRow fila in Mi_sede.Rows)
            {
                Codigo_sede.Text = fila["Idsede"].ToString();
                Nombre_sede.Text = fila["Idcentro"].ToString();
                Nombre_sede.Text = fila["Descripcion"].ToString();
            }

            Lb_Error.Text = "Se consulto correctamente";
        }

        protected void Btn_Agregar_Click(object sender, EventArgs e)
        {
            if (Codigo_sede.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el Código de la sede";
                Codigo_sede.Focus();
                return;
            }

            if (Nombre_sede.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el nombre de la sede";
                Nombre_sede.Focus();
                return;
            }

            if (Codigo_centro.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el codigo del centro";
                Codigo_centro.Focus();
                return;
            }

            CADSede.InsertSede(Int32.Parse(Codigo_sede.Text), Int32.Parse(Codigo_centro.Text), Nombre_sede.Text);

            Lb_Error.Text = "Se ha ingresado el Centro de información exitosamente";

            Gr_Sedes.DataBind();

            Codigo_sede.Text = string.Empty;
            Codigo_centro.Text = string.Empty;
            Nombre_sede.Text = string.Empty;
        }

        protected void Btn_Elimiar_Click(object sender, EventArgs e)
        {
            if (Codigo_sede.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el nombre de la sede";
                Codigo_sede.Focus();
                return;
            }

            try
            {
                CADSede.DeleteSede(Int32.Parse(Codigo_sede.Text));
            }
            catch (Exception)
            {

                Lb_Error.Text = "No es posible eliminar la sede existe una referencia a otra tabla.";
            }

            Gr_Sedes.DataBind();
        }

        protected void Btn_Editar_Click(object sender, EventArgs e)
        {
            if (Codigo_sede.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar la sede";
                Codigo_sede.Focus();
                return;
            }

            if (Nombre_sede.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el nombre de la sede";
                Nombre_sede.Focus();
                return;
            }

            CADSede.UpdateSede(Int32.Parse(Codigo_sede.Text), Int32.Parse(Codigo_centro.Text), Nombre_sede.Text);
            Gr_Sedes.DataBind();
        }
    }
}