using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebKN.Entities
{
    public class ComentarioEnt
    {
            public int conComentario { get; set; }
            public int conUsuario { get; set; }
            public string Nombre { get; set; }
            public string Descripcion { get; set; }
            public string Correo { get; set; }
         

    }
}
