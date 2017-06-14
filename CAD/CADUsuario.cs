using CAD.SIWEDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAD
{
    public class CADUsuario
    {
        private static UsuarioTableAdapter adaptator = new UsuarioTableAdapter();
       
    
        public static void UpdateUsuario(int Idusuario, int Idsede, int Idcentro, string Identificacion, DateTime fechanacimiento)
        {
            adaptator.UpdateUsuario(Idusuario, Idsede, Idcentro, Identificacion, fechanacimiento);
        }

        public static void InsertUsuario(int Idusuario, int Idsede, int Idcentro, string Identificacion, DateTime fechanacimiento)
        {
            adaptator.InsertUsuario(Idusuario, Idsede, Idcentro, Identificacion, fechanacimiento);
        }

        public static SIWEDataSet.UsuarioDataTable
         GetUsuarioByIdusuario(int Idusuario)
        {
            return adaptator.GetUsuarioByIdusuario(Idusuario);
        }

        public static SIWEDataSet.UsuarioDataTable GetData()
        {
            return adaptator.GetData();
        }

        public static void DeleteUsuario(int Idusuario)
        {
            adaptator.DeleteUsuario(Idusuario);
        }
    }
}

