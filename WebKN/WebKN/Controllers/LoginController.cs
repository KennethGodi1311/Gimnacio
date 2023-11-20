using System.Web.Mvc;
using WebKN.Entities;
using WebKN.Models;

namespace WebKN.Controllers
{
    public class LoginController : Controller
    {
        UsuarioModel modelUsuario = new UsuarioModel();
       
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult CerrarSesion()
        { 
            Session.Clear();
            return RedirectToAction("IniciarSesion", "Login");
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
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se ha podido validar su información";
                return View();
            }
        }

        [HttpGet]
        public ActionResult Membresias()
        {
            return View();
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
        public ActionResult Contac()
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
            var respuesta = modelUsuario.RegistrarCuenta(entidad);

            if (respuesta == "OK")
            {
                return RedirectToAction("IniciarSesion", "Login");
            }
            else
            {
                ViewBag.MensajeUsuario = "No se ha podido registrar su información";
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
                ViewBag.MensajeUsuario = "No se ha podido recuperar su información";
                return View();
            }
        }

    }
}