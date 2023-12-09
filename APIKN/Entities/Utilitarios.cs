using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace APIKN.Entities
{
    public class Utilitarios
    {

        public void EnviarCorreo(string destino, string asunto, string contenido)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(ConfigurationManager.AppSettings["kenneth1311@hotmail.es"]);
            message.To.Add(new MailAddress(destino));
            message.Subject = asunto;
            message.Body = contenido;
            message.Priority = MailPriority.Normal;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["kenneth1311@hotmail.es"], ConfigurationManager.AppSettings["KennethG22"]);
            client.EnableSsl = true;
            client.Send(message);
        }

    }
}

