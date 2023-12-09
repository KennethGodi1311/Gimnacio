using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APIKN.Entities
{
    public class ComentarioEnt
    {
        public long ConComentario { get; set; }
        public long ConUsuario { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string  Correo { get; set; }
       
    }
}