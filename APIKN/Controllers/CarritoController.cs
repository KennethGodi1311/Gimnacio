using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace APIKN.Controllers
{
    public class CarritoController : ApiController
    {

        [HttpPost]
        [Route("RegistrarCarrito")]
        public string RegistrarCarrito(TCarrito tCarrito)
        {
            using (var context = new DBGYMEntities())
            {
                var datos = (from x in context.TCarrito
                             where x.ConUsuario == tCarrito.ConUsuario
                                && x.ConProducto == tCarrito.ConProducto
                             select x).FirstOrDefault();

                if (datos == null)
                {
                    context.TCarrito.Add(tCarrito);
                    context.SaveChanges();
                }
                else
                {
                    datos.Cantidad = tCarrito.Cantidad;
                    context.SaveChanges();
                }
                return "OK";
            }
        }

        [HttpGet]
        [Route("ConsultarCarrito")]
        public object ConsultarCarrito(long q)
        {
            using (var context = new DBGYMEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return (from x in context.TCarrito
                        join y in context.TProducto on x.ConProducto equals y.ConProducto
                        where x.ConUsuario == q
                        select new
                        {
                            x.ConCarrito,
                            x.ConUsuario,
                            x.ConProducto,
                            x.Cantidad,
                            x.FechaCarrito,
                            y.Nombre,
                            y.Precio,
                            SubTotal = (y.Precio * x.Cantidad),
                            Impuesto = (y.Precio * x.Cantidad) * 0.13M,
                            Total = (y.Precio * x.Cantidad) + (y.Precio * x.Cantidad) * 0.13M
                        }).ToList();
            }
        }

        [HttpGet]
        [Route("ConsultaFacturas")]
        public List<TMaestro> ConsultaFacturas(long q)
        {
            using (var context = new DBGYMEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return (from x in context.TMaestro
                        where x.ConUsuario == q
                        select x).ToList();
            }
        }

        [HttpGet]
        [Route("ConsultaDetalleFactura")]
        public object ConsultaDetalleFactura(long q)
        {
            using (var context = new DBGYMEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                return (from x in context.TDetalle
                        join y in context.TProducto on x.ConProducto equals y.ConProducto
                        where x.ConMaestro == q
                        select new
                        {
                            x.ConMaestro,
                            y.Nombre,
                            x.PrecioPagado,
                            x.CantidadPagado,
                            x.ImpuestoPagado,
                            SubTotal = (x.PrecioPagado * x.CantidadPagado),
                            Impuesto = (x.ImpuestoPagado * x.CantidadPagado),
                            Total = (x.PrecioPagado * x.CantidadPagado) + (x.ImpuestoPagado * x.CantidadPagado),
                        }).ToList();
            }
        }

        [HttpPost]
        [Route("PagarCarrito")]
        public int PagarCarrito(TCarrito tCarrito)
        {
            using (var context = new DBGYMEntities())
            {
                return context.PagarCarrito(tCarrito.ConUsuario);
            }
        }

        [HttpDelete]
        [Route("EliminarRegistroCarrito")]
        public void EliminarRegistroCarrito(long q)
        {
            using (var context = new DBGYMEntities())
            {
                var datos = (from x in context.TCarrito
                             where x.ConCarrito == q
                             select x).FirstOrDefault();

                context.TCarrito.Remove(datos);
                context.SaveChanges();
            }
        }

    }
}
