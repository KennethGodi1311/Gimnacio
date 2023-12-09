using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Web;
using WebKN.Entities;

namespace WebKN.Models
{
    public class CarritoModel
    {

        public string rutaServidor = ConfigurationManager.AppSettings["https://localhost:44337"];

        public string RegistrarCarrito(CarritoEnt entidad)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/RegistrarCarrito";
                var jsonData = JsonContent.Create(entidad);
                var res = client.PostAsync(urlApi, jsonData).Result;
                return res.Content.ReadFromJsonAsync<string>().Result;
            }
        }

        public List<CarritoEnt> ConsultarCarrito(long q)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/ConsultarCarrito?q=" + q;
                var res = client.GetAsync(urlApi).Result;
                return res.Content.ReadFromJsonAsync<List<CarritoEnt>>().Result;
            }
        }

        public List<FacturaEnt> ConsultaFacturas(long q)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/ConsultaFacturas?q=" + q;
                var res = client.GetAsync(urlApi).Result;
                return res.Content.ReadFromJsonAsync<List<FacturaEnt>>().Result;
            }
        }

        public List<FacturaEnt> ConsultaDetalleFactura(long q)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/ConsultaDetalleFactura?q=" + q;
                var res = client.GetAsync(urlApi).Result;
                return res.Content.ReadFromJsonAsync<List<FacturaEnt>>().Result;
            }
        }


        public int PagarCarrito(CarritoEnt entidad)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/PagarCarrito";
                var jsonData = JsonContent.Create(entidad);
                var res = client.PostAsync(urlApi, jsonData).Result;
                return res.Content.ReadFromJsonAsync<int>().Result;
            }
        }

        public void EliminarRegistroCarrito(long q)
        {
            using (var client = new HttpClient())
            {
                var urlApi = rutaServidor + "https://localhost:44337/EliminarRegistroCarrito?q=" + q;
                var res = client.DeleteAsync(urlApi).Result;
            }
        }

    }
}