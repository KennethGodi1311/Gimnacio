using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Http;
using System.Web.Http.Description;

namespace APIKN.Controllers
{
    public class ProductoController : ApiController
    {
        [HttpGet]
        [Route("ConsultaProductos")]
        public List<TProducto> ConsultaProductos()
        {
            using (var context = new DBGYMEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return context.TProducto.ToList();
            }
        }

        [HttpGet]
        [Route("ConsultaProducto")]
        public TProducto ConsultaProducto(long q)
        {
            using (var context = new DBGYMEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return (from x in context.TProducto
                        where x.ConProducto == q
                        select x).FirstOrDefault();
            }
        }

        [HttpPost]
        [Route("RegistrarProducto")]
        public long RegistrarProducto(TProducto tProducto)
        {
            using (var context = new DBGYMEntities())
            {
                context.TProducto.Add(tProducto);
                context.SaveChanges();
                return tProducto.ConProducto;
            }
        }

        [HttpPut]
        [Route("ActualizarRutaProducto")]
        public string ActualizarRutaProducto(TProducto tProducto)
        {
            using (var context = new DBGYMEntities())
            {
                var datos = context.TProducto.Where(x => x.ConProducto == tProducto.ConProducto).FirstOrDefault();
                datos.Imagen = tProducto.Imagen;
                context.SaveChanges();
                return "OK";
            }
        }

        [HttpPut]
        [Route("ActualizarProducto")]
        public string ActualizarProducto(TProducto tProducto)
        {
            using (var context = new DBGYMEntities())
            {
                var datos = context.TProducto.Where(x => x.ConProducto == tProducto.ConProducto).FirstOrDefault();
                datos.Nombre = tProducto.Nombre;
                datos.Descripcion = tProducto.Descripcion;
                datos.Cantidad = tProducto.Cantidad;
                datos.Precio = tProducto.Precio;
                context.SaveChanges();
                return "OK";
            }
        }

        [HttpPut]
        [Route("ActualizarEstadoProducto")]
        public string ActualizarEstadoUsuario(TProducto tProducto)
        {
            using (var context = new DBGYMEntities())
            {
                var datos = context.TProducto.Where(x => x.ConProducto == tProducto.ConProducto).FirstOrDefault();
                datos.Estado = (datos.Estado ? false : true);
                context.SaveChanges();
                return "OK";
            }
        }


    }
}