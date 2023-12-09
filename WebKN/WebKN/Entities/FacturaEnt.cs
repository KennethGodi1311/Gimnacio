using System;

namespace WebKN.Entities
{
    public class FacturaEnt
    {
        public long ConMaestro { get; set; }
        public long ConUsuario { get; set; }
        public DateTime FechaCompra { get; set; }
        public decimal TotalCompra { get; set; }


        public string Nombre { get; set; }
        public decimal PrecioPagado { get; set; }
        public int CantidadPagado { get; set; }
        public decimal ImpuestoPagado { get; set; }

        public decimal SubTotal { get; set; }

        public decimal Impuesto { get; set; }

        public decimal Total { get; set; }


    }
}
