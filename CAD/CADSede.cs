using CAD.SIWEDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAD
{
   public class CADSede
    {

        private static SedeSenaTableAdapter adaptador = new SedeSenaTableAdapter ();


        public static void UpdateSede(int Idsede, int Idcentro, string descripcion)
        {
            adaptador.UpdateSede(Idsede, Idcentro, descripcion);
        }

        public static void InsertSede(int Idsede, int Idcentro, string Descripcion)
        {
            adaptador.InsertSede(Idsede, Idcentro, Descripcion);
        }

        public static SIWEDataSet.SedeSenaDataTable
        GetSedeByIdsede(int Idsede)
         {
             return adaptador.GetSedeIdsede(Idsede);
         }

        public static SIWEDataSet.SedeSenaDataTable GetData()
        {
            return adaptador.GetData();
        }

        public static void DeleteSede(int Idsede)
        {
            adaptador.DeleteSede(Idsede);
        }
    }
}
