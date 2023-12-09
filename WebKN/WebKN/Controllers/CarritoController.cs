using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebKN.Entities;
using WebKN.Models;

namespace WebKN.Controllers
{
    public class CarritoController : Controller
    {
        CarritoModel modelCarrito = new CarritoModel();

        [HttpGet]
        public ActionResult RegistrarCarrito(int cantidad, long conProducto)
        {
            var entidad = new CarritoEnt();
            entidad.ConUsuario = long.Parse(Session["ConUsuario"].ToString());
            entidad.ConProducto = conProducto;
            entidad.Cantidad = cantidad;
            entidad.FechaCarrito = DateTime.Now;

            modelCarrito.RegistrarCarrito(entidad);

            var datos = modelCarrito.ConsultarCarrito(long.Parse(Session["ConUsuario"].ToString()));
            Session["Cant"] = datos.AsEnumerable().Sum(x => x.Cantidad);
            Session["SubT"] = datos.AsEnumerable().Sum(x => x.SubTotal);

            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult ConsultaCarrito()
        {
            var datos = modelCarrito.ConsultarCarrito(long.Parse(Session["ConUsuario"].ToString()));
            Session["TotalPago"] = datos.AsEnumerable().Sum(x => x.Total);
            return View(datos);
        }

        [HttpGet]
        public ActionResult ConsultaFacturas()
        {
            var datos = modelCarrito.ConsultaFacturas(long.Parse(Session["ConUsuario"].ToString()));
            return View(datos);
        }

        [HttpGet]
        public ActionResult ConsultaDetalleFactura(long q)
        {
            var datos = modelCarrito.ConsultaDetalleFactura(q);
            return View(datos);
        }

        [HttpPost]
        public ActionResult PagarCarrito()
        {
            var entidad = new CarritoEnt();
            entidad.ConUsuario = long.Parse(Session["ConUsuario"].ToString());

            var respuesta = modelCarrito.PagarCarrito(entidad);
            var datos = modelCarrito.ConsultarCarrito(long.Parse(Session["ConUsuario"].ToString()));
            Session["Cant"] = datos.AsEnumerable().Sum(x => x.Cantidad);
            Session["SubT"] = datos.AsEnumerable().Sum(x => x.SubTotal);

            if (respuesta > 0)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se ha podido procesar su pago, verifica las unidades disponibles";
                return View("ConsultaCarrito", datos);
            }
        }

        [HttpGet]
        public ActionResult EliminarRegistroCarrito(long q)
        {
            modelCarrito.EliminarRegistroCarrito(q);

            var datos = modelCarrito.ConsultarCarrito(long.Parse(Session["ConUsuario"].ToString()));
            Session["Cant"] = datos.AsEnumerable().Sum(x => x.Cantidad);
            Session["SubT"] = datos.AsEnumerable().Sum(x => x.SubTotal);
            return RedirectToAction("ConsultaCarrito", "Carrito");
        }

    }
}