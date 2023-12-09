using System.Linq;
using System.Web.Mvc;
using WebKN.Entities;
using WebKN.Models;

namespace WebKN.Controllers
{
    public class LoginController : Controller
    {
        UsuarioModel modelUsuario = new UsuarioModel();
        ProductoModel modelProducto = new ProductoModel();
        CarritoModel modelCarrito = new CarritoModel();

        [HttpGet]
        public ActionResult Index()
        {
            var datos = modelProducto.ConsultaProductos().Where(x => x.Estado == true && x.Cantidad > 0);
            return View(datos);
        }

        [HttpGet]
        public ActionResult CerrarSesion()
        {
            Session.Clear();
            return RedirectToAction("Index", "Login");
        }


        [HttpGet]
        public ActionResult IniciarSesion()
        { 
            return View();
        }

        [HttpPost]
        public ActionResult IniciarSesion(UsuarioEnt entidad)
        {
            var respuesta = modelUsuario.IniciarSesion(entidad);

            if (respuesta != null)
            {
                Session["ConUsuario"] = respuesta.ConUsuario;
                Session["Nombre"] = respuesta.Nombre;
                Session["Rol"] = respuesta.DescripcionRol;

                var datos = modelCarrito.ConsultarCarrito(respuesta.ConUsuario);
                Session["Cant"] = datos.Count();
                Session["SubT"] = datos.AsEnumerable().Sum(x => x.Precio);

                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se ha podido validar su información";
                return View();
            }
        }


        
        [HttpGet]
        public ActionResult SeccionesPersonalizadas()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Acerca()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Comentario()
        {
            return View();
        }




        [HttpGet]
        public ActionResult RegistrarCuenta()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarCuenta(UsuarioEnt entidad)
        {
            string respuesta = modelUsuario.RegistrarCuenta(entidad);

            if (respuesta == "OK")
            {
                return RedirectToAction("IniciarSesion", "Login");
            }
            else
            {
                ViewBag.MensajeUsuario = "Cuenta con exito";
                return View();
            }
        }


        [HttpGet]
        public ActionResult RecuperarCuenta()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RecuperarCuenta(UsuarioEnt entidad)
        {
            string respuesta = modelUsuario.RecuperarCuenta(entidad);

            if (respuesta == "OK")
            {
                return RedirectToAction("IniciarSesion", "Login");
            }
            else
            {
                ViewBag.MensajeUsuario = "Correo enviado";
                return View();
            }
        }

    }
}