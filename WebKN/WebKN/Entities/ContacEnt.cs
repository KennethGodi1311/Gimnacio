using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebKN.Entities
{
    public class ContacEnt
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
            public string Correo { get; set; }
            public string Asunto { get; set; }
            public string Mensaje { get; set; }

    }
}
