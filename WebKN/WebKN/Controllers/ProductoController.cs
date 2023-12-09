using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebKN.Entities;
using WebKN.Models;

namespace WebKN.Controllers
{
    public class ProductoController : Controller
    {
        ProductoModel modelProducto = new ProductoModel();
        CarritoModel modelCarrito = new CarritoModel();

        [HttpGet]
        public ActionResult ConsultaProductos()
        {
            var datos = modelProducto.ConsultaProductos();
            return View(datos);
        }

        [HttpGet]
        public ActionResult RegistrarProducto()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarProducto(HttpPostedFileBase ImgProducto, ProductoEnt entidad)
        {
            entidad.Imagen = string.Empty;
            entidad.Estado = true;

            long conProducto = modelProducto.RegistrarProducto(entidad);

            if (conProducto > 0)
            {
                string extension = Path.GetExtension(Path.GetFileName(ImgProducto.FileName));
                string ruta = AppDomain.CurrentDomain.BaseDirectory + "Images\\" + conProducto + extension;
                ImgProducto.SaveAs(ruta);

                entidad.Imagen = "/Images/" + conProducto + extension;
                entidad.ConProducto = conProducto;

                modelProducto.ActualizarRutaProducto(entidad);

                return RedirectToAction("ConsultaProductos", "Producto");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se ha podido registrar su producto";
                return View();
            }
        }

        [HttpGet]
        public ActionResult ActualizarEstadoProducto(long q)
        {
            var entidad = new ProductoEnt();
            entidad.ConProducto = q;

            string respuesta = modelProducto.ActualizarEstadoProducto(entidad);

            if (respuesta == "OK")
            {
                return RedirectToAction("ConsultaProductos", "Producto");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se ha podido cambiar el estado del producto";
                return View();
            }
        }

        [HttpGet]
        public ActionResult ActualizarProducto(long q)
        {
            var datos = modelProducto.ConsultaProducto(q);
            return View(datos);
        }

        [HttpPost]
        public ActionResult ActualizarProducto(HttpPostedFileBase ImgProducto, ProductoEnt entidad)
        {
            string respuesta = modelProducto.ActualizarProducto(entidad);

            if (respuesta == "OK")
            {
                if (ImgProducto != null)
                {
                    string extension = Path.GetExtension(Path.GetFileName(ImgProducto.FileName));
                    string ruta = AppDomain.CurrentDomain.BaseDirectory + "Images\\" + entidad.ConProducto + extension;
                    ImgProducto.SaveAs(ruta);

                    entidad.Imagen = "/Images/" + entidad.ConProducto + extension;
                    entidad.ConProducto = entidad.ConProducto;

                    modelProducto.ActualizarRutaProducto(entidad);
                }

                var datos = modelCarrito.ConsultarCarrito(long.Parse(Session["ConUsuario"].ToString()));
                Session["Cant"] = datos.AsEnumerable().Sum(x => x.Cantidad);
                Session["SubT"] = datos.AsEnumerable().Sum(x => x.SubTotal);

                return RedirectToAction("ConsultaProductos", "Producto");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se ha podido actualizar la información del producto";
                return View();
            }
        }

    }
}