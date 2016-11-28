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
    public class LocacaoController : Controller
    {
        private LocadoraEntities db = new LocadoraEntities();

        // GET: /Locacao/
        public ActionResult Index()
        {
            var locacao = db.Locacao.Include(l => l.Automovel).Include(l => l.Cliente);
            return View(locacao.ToList());
        }

        // GET: /Locacao/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locacao locacao = db.Locacao.Find(id);
            if (locacao == null)
            {
                return HttpNotFound();
            }
            return View(locacao);
        }

        // GET: /Locacao/Create
        public ActionResult Create()
        {
            ViewBag.AutomovelID = new SelectList(db.Automovel, "AutomovelID", "PlacaAutomovel");
            ViewBag.ClienteID = new SelectList(db.Cliente, "ClienteID", "NomeCliente");
            return View();
        }

        // POST: /Locacao/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="LocacaoID,AutomovelID,ClienteID,DataLocacao,DataDevolucao")] Locacao locacao)
        {
            if (ModelState.IsValid)
            {
                db.Locacao.Add(locacao);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AutomovelID = new SelectList(db.Automovel, "AutomovelID", "PlacaAutomovel", locacao.AutomovelID);
            ViewBag.ClienteID = new SelectList(db.Cliente, "ClienteID", "NomeCliente", locacao.ClienteID);
            return View(locacao);
        }

        // GET: /Locacao/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locacao locacao = db.Locacao.Find(id);
            if (locacao == null)
            {
                return HttpNotFound();
            }
            ViewBag.AutomovelID = new SelectList(db.Automovel, "AutomovelID", "PlacaAutomovel", locacao.AutomovelID);
            ViewBag.ClienteID = new SelectList(db.Cliente, "ClienteID", "NomeCliente", locacao.ClienteID);
            return View(locacao);
        }

        // POST: /Locacao/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="LocacaoID,AutomovelID,ClienteID,DataLocacao,DataDevolucao")] Locacao locacao)
        {
            if (ModelState.IsValid)
            {
                db.Entry(locacao).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AutomovelID = new SelectList(db.Automovel, "AutomovelID", "PlacaAutomovel", locacao.AutomovelID);
            ViewBag.ClienteID = new SelectList(db.Cliente, "ClienteID", "NomeCliente", locacao.ClienteID);
            return View(locacao);
        }

        // GET: /Locacao/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locacao locacao = db.Locacao.Find(id);
            if (locacao == null)
            {
                return HttpNotFound();
            }
            return View(locacao);
        }

        // POST: /Locacao/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Locacao locacao = db.Locacao.Find(id);
            db.Locacao.Remove(locacao);
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
