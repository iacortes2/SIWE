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
    public partial class CentroSena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Consultar_Click(object sender, EventArgs e)
        {
            if (Codigo_centro.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el COdigo del Centro";
                Codigo_centro.Focus();
                return;
            }

            SIWEDataSet.CentroSenaDataTable Mi_centro = CAD.CADCentro.GetCentroByIdcentro(Int32.Parse(Codigo_centro.Text));
            if (Mi_centro == null)
            {
                Lb_Error.Text = "El código ingresado no existe en el sistema";
                Codigo_centro.Focus();
                return;
            }

            foreach (DataRow fila in Mi_centro.Rows)
            {
                Codigo_centro.Text = fila["Idcentro"].ToString();
                Nombre_centro.Text = fila["Descripcion"].ToString();
            }

            Lb_Error.Text = "Se consulto correctamente";
        }

        protected void Btn_Agregar_Click(object sender, EventArgs e)
        {
            if (Codigo_centro.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el COdigo del Centro";
                Codigo_centro.Focus();
                return;
            }

            if (Nombre_centro.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el nombre del Centro";
                Nombre_centro.Focus();
                return;
            }

            CADCentro.InsertCentro(Int32.Parse(Codigo_centro.Text), Nombre_centro.Text);

            Lb_Error.Text = "Se ha ingresado el Centro de información exitosamente";

            Gr_Centros.DataBind();

            Codigo_centro.Text = string.Empty;
            Nombre_centro.Text = string.Empty;
        }

        protected void Btn_Elimiar_Click(object sender, EventArgs e)
        {
            if (Codigo_centro.Text == string.Empty)
            {
                Lb_Error.Text = "Debe ingresar el nombre del Centro";
                Codigo_centro.Focus();
                return;
            }

            CADCentro.DeleteCentro(Int32.Parse(Codigo_centro.Text));

            Gr_Centros.DataBind();

        }

        protected void Btn_Editar_Click(object sender, EventArgs e)
        {
            
                if (Codigo_centro.Text == string.Empty)
                {
                    Lb_Error.Text = "Debe ingresar el Codigo del Centro";
                    Codigo_centro.Focus();
                    return;
                }

                if (Nombre_centro.Text == string.Empty)
                {
                    Lb_Error.Text = "Debe ingresar el nombre del Centro";
                    Nombre_centro.Focus();
                    return;
                }

                CADCentro.UpdateCentro(Int32.Parse(Codigo_centro.Text), Nombre_centro.Text);
            Gr_Centros.DataBind();
        }
    }    
}
