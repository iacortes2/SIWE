using CAD.SIWEDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAD
{
    public class CADCentro
    {
        private static CentroSenaTableAdapter adaptador = new CentroSenaTableAdapter();

        public static void UpdateCentro(int Idcentro, string Descripcion)
        {
            adaptador.UpdateCentro(Idcentro, Descripcion);
        }

        public static void InsertCentro(int Idcentro, string Descripcion)
        {
            adaptador.InsertCentro(Idcentro, Descripcion);
        }

        public static SIWEDataSet.CentroSenaDataTable 
            GetCentroByIdcentro(int Idcentro)
        {
            return adaptador.GetCentroByIdcentro(Idcentro);
        }

        public static SIWEDataSet.CentroSenaDataTable GetData()
        {
            return adaptador.GetData();
        }

        public static void DeleteCentro(int Idcentro)
        {
            adaptador.DeleteCentro(Idcentro);
        }
    }
}