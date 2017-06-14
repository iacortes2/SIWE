using CAD.SIWEDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAD
{
   public class CADAgenda
    {
        public int IdAgenda { get; set; }
        public int IdSede { get; set; }
        public string EventoAgenda { get; set; }
        public DateTime FechaAgenda { get; set; }
        public float HoraInicio { get; set; }

        public float DuracionDias { get; set; }

        public float DuracionHoras { get; set; }

        public DateTime FechaCierre { get; set; }

        public float HoraCierre { get; set; }

        public bool Estado { get; set; }






        private static AgendaTableAdapter adaptador = new AgendaTableAdapter();

        public static CADAgenda GetAgendaByFecha(DateTime Fecha)
        {
            CADAgenda agenda = null;

            SIWEDataSet.AgendaDataTable miTabla = adaptador.GetAgendaByFecha(Fecha);

            if (miTabla.Rows.Count == 0)
            {
                return agenda;
            }

            SIWEDataSet.AgendaRow miRegistro = (SIWEDataSet.AgendaRow)miTabla.Rows[0];

            agenda = new CADAgenda();

            agenda.Estado = miRegistro.Estado;
            agenda.HoraCierre = (float)miRegistro.HoraCierre;
            agenda.FechaCierre = miRegistro.FechaCierre;
            agenda.DuracionHoras = (float)miRegistro.DuracionHoras;
            agenda.DuracionDias = (float)miRegistro.DuracionDias;
            agenda.HoraInicio = (float)miRegistro.HoraInicio;
            agenda.EventoAgenda = miRegistro.EventoAgenda;
            agenda.FechaAgenda = miRegistro.FechaAgenda;
            agenda.IdAgenda = miRegistro.IdAgenda;
            agenda.IdSede = miRegistro.IdSede;

            return agenda;
        }

        public static void UpdateAgenda(int IdAgenda, int IdSede, string EventoAgenda,
            DateTime FechaAgenda, float HoraInicio, float DuracionDias, float DuracionHoras,
            DateTime FechaCierre, float HoraCierre, bool Estado)
        {
            adaptador.UpdateAgenda(IdAgenda, IdSede, EventoAgenda, FechaAgenda, HoraInicio,
                DuracionDias, DuracionHoras, FechaCierre, HoraCierre, Estado);
        }

        public static void InsertAgenda(int Idagenda, int Idsede, string Evento_agenda, 
            DateTime Fecha_agenda, float Duracion_agenda, string Direccion_agenda)
        {
            adaptador.InsertAgenda(Idagenda, Idsede, Evento_agenda, Fecha_agenda, 
                Duracion_agenda, Direccion_agenda);
            
        }

        public static SIWEDataSet.AgendaDataTable GetData()
        {
            return adaptador.GetData();
        }

        public static void DeleteAgenda(int Idagenda)
        {
            adaptador.DeleteAgenda(Idagenda);
        }
    }
}
