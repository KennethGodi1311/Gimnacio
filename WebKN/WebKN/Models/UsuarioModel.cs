using System.Collections.Generic;
using System.Configuration;
using System.EnterpriseServices.Internal;
using System.Net.Http;
using System.Net.Http.Json;
using System.Net.Sockets;
using System.Web;
using System.Web.Mvc;
using WebKN.Entities;

namespace WebKN.Models
{
    public class UsuarioModel
    {
        /*
            GET     = Consultas = Parámetros viajan por el URL al API
            DELETE  = Deletes   = Parámetros viajan por el URL al API
            POST    = Inserts   = Parámetros viajan en un Body al API
            PUT     = Updates   = Parámetros viajan en un Body al API 
        */

        public string rutaServidor = ConfigurationManager.AppSettings["https://localhost:44337/RutaApi"];

        public UsuarioEnt IniciarSesion(UsuarioEnt entidad)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/IniciarSesion";
                var jsonData = JsonContent.Create(entidad);
                var res = client.PostAsync(urlApi, jsonData).Result;
                return res.Content.ReadFromJsonAsync<UsuarioEnt>().Result;
            }
        }

        public string RegistrarCuenta(UsuarioEnt entidad)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/RegistrarCuenta";
                var jsonData = JsonContent.Create(entidad);
                var res = client.PostAsync(urlApi, jsonData).Result;
                return res.Content.ReadFromJsonAsync<string>().Result;
            }
        }

        public string RecuperarCuenta(UsuarioEnt entidad)
        {
            using (var client = new HttpClient())
            {
                var urlApi ="https://localhost:44337/RecuperarCuenta?Identificacion=" + entidad.Identificacion;
                var res = client.GetAsync(urlApi).Result;
                return res.Content.ReadFromJsonAsync<string>().Result;
            }
        }

        public List<SelectListItem> ConsultarProvincias()
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/ConsultarProvincias";
                var res = client.GetAsync(urlApi).Result;
                return res.Content.ReadFromJsonAsync<List<SelectListItem>>().Result;
            }
        }

        public List<UsuarioEnt> ConsultaUsuarios()
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/ConsultaUsuarios";
                var res = client.GetAsync(urlApi).Result;
                return res.Content.ReadFromJsonAsync<List<UsuarioEnt>>().Result;
            }
        }

        public UsuarioEnt ConsultaUsuario(long q)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/ConsultaUsuario?q=" + q;
                var res = client.GetAsync(urlApi).Result;
                return res.Content.ReadFromJsonAsync<UsuarioEnt>().Result;
            }
        }

        public string ActualizarCuenta(UsuarioEnt entidad)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/ActualizarCuenta";
                var jsonData = JsonContent.Create(entidad);
                var res = client.PutAsync(urlApi, jsonData).Result;
                return res.Content.ReadFromJsonAsync<string>().Result;
            }
        }

        public string ActualizarEstadoUsuario(UsuarioEnt entidad)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/ActualizarEstadoUsuario";
                var jsonData = JsonContent.Create(entidad);
                var res = client.PutAsync(urlApi, jsonData).Result;
                return res.Content.ReadFromJsonAsync<string>().Result;
            }
        }

    }
}