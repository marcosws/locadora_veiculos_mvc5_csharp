using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Locadora_Veiculo_MVC5;

namespace Locadora_Veiculo_MVC5.Controllers
{
    public class ModeloController : Controller
    {
        private LocadoraEntities db = new LocadoraEntities();

        // GET: /Modelo/
        public ActionResult Index()
        {
            var modelo = db.Modelo.Include(m => m.Marca);
            return View(modelo.ToList());
        }

        // GET: /Modelo/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Modelo modelo = db.Modelo.Find(id);
            if (modelo == null)
            {
                return HttpNotFound();
            }
            return View(modelo);
        }

        // GET: /Modelo/Create
        public ActionResult Create()
        {
            ViewBag.MarcaID = new SelectList(db.Marca, "MarcaID", "NomeMarca");
            return View();
        }

        // POST: /Modelo/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ModeloID,MarcaID,NomeModelo")] Modelo modelo)
        {
            if (ModelState.IsValid)
            {
                db.Modelo.Add(modelo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MarcaID = new SelectList(db.Marca, "MarcaID", "NomeMarca", modelo.MarcaID);
            return View(modelo);
        }

        // GET: /Modelo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Modelo modelo = db.Modelo.Find(id);
            if (modelo == null)
            {
                return HttpNotFound();
            }
            ViewBag.MarcaID = new SelectList(db.Marca, "MarcaID", "NomeMarca", modelo.MarcaID);
            return View(modelo);
        }

        // POST: /Modelo/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ModeloID,MarcaID,NomeModelo")] Modelo modelo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(modelo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MarcaID = new SelectList(db.Marca, "MarcaID", "NomeMarca", modelo.MarcaID);
            return View(modelo);
        }

        // GET: /Modelo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Modelo modelo = db.Modelo.Find(id);
            if (modelo == null)
            {
                return HttpNotFound();
            }
            return View(modelo);
        }

        // POST: /Modelo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Modelo modelo = db.Modelo.Find(id);
            db.Modelo.Remove(modelo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
