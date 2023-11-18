using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace APIKN.Controllers
{
    public class ProductoController : ApiController
    {

        [HttpGet]
        [Route("ConsultaProductos")]
        public List<TProducto> ConsultaProductos()
        {
            using (var context = new BDKNEntities())
            {
                return context.TProducto.ToList();
            }
        }

        [HttpPost]
        [Route("RegistrarProducto")]
        public string RegistrarProducto(TProducto tProducto)
        {
            using (var context = new BDKNEntities())
            {
                context.TProducto.Add(tProducto);
                context.SaveChanges();
                return "OK";
            }
        }

        /*
       

        // GET: api/Producto/5
        [ResponseType(typeof(TProducto))]
        public IHttpActionResult GetTProducto(long id)
        {
            TProducto tProducto = db.TProducto.Find(id);
            if (tProducto == null)
            {
                return NotFound();
            }

            return Ok(tProducto);
        }

        // PUT: api/Producto/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTProducto(long id, TProducto tProducto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tProducto.ConProducto)
            {
                return BadRequest();
            }

            db.Entry(tProducto).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TProductoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        

        // DELETE: api/Producto/5
        [ResponseType(typeof(TProducto))]
        public IHttpActionResult DeleteTProducto(long id)
        {
            TProducto tProducto = db.TProducto.Find(id);
            if (tProducto == null)
            {
                return NotFound();
            }

            db.TProducto.Remove(tProducto);
            db.SaveChanges();

            return Ok(tProducto);
        }

        private bool TProductoExists(long id)
        {
            return db.TProducto.Count(e => e.ConProducto == id) > 0;
        }
        */

    }
}