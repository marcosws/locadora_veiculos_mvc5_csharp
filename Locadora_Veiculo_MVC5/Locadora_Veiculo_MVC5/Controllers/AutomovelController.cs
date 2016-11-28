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
    public class AutomovelController : Controller
    {
        private LocadoraEntities db = new LocadoraEntities();

        // GET: /Automovel/
        public ActionResult Index()
        {
            var automovel = db.Automovel.Include(a => a.Modelo);
            return View(automovel.ToList());
        }

        // GET: /Automovel/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            
            Automovel automovel = db.Automovel.Find(id);
            if (automovel == null)
            {
                return HttpNotFound();
            }
            return View(automovel);
        }

        // GET: /Automovel/Create
        public ActionResult Create()
        {
            ViewBag.ModeloID = new SelectList(db.Modelo, "ModeloID", "NomeModelo");
            return View();
        }

        // POST: /Automovel/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="AutomovelID,ModeloID,PlacaAutomovel,AnoAutomovel")] Automovel automovel)
        {
            if (ModelState.IsValid)
            {
                db.Automovel.Add(automovel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ModeloID = new SelectList(db.Modelo, "ModeloID", "NomeModelo", automovel.ModeloID);
            return View(automovel);
        }

        // GET: /Automovel/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Automovel automovel = db.Automovel.Find(id);
            if (automovel == null)
            {
                return HttpNotFound();
            }
            ViewBag.ModeloID = new SelectList(db.Modelo, "ModeloID", "NomeModelo", automovel.ModeloID);
            return View(automovel);
        }

        // POST: /Automovel/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="AutomovelID,ModeloID,PlacaAutomovel,AnoAutomovel")] Automovel automovel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(automovel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ModeloID = new SelectList(db.Modelo, "ModeloID", "NomeModelo", automovel.ModeloID);
            return View(automovel);
        }

        // GET: /Automovel/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Automovel automovel = db.Automovel.Find(id);
            if (automovel == null)
            {
                return HttpNotFound();
            }
            return View(automovel);
        }

        // POST: /Automovel/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Automovel automovel = db.Automovel.Find(id);
            db.Automovel.Remove(automovel);
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
