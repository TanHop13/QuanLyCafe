using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Doan.Models;


namespace Doan.Controllers
{
    public class DoDungsController : Controller
    {
       private Model_Login db = new Model_Login();

        // GET: DoDungs
        public ActionResult Index(string Searching = "")
        {
            if (Searching != "")
            {
                var doDung = db.DoDungs.Include(s => s.LoaiDoDung).Where(x => x.TenDD.ToUpper().Contains(Searching.ToUpper()));
                return View(doDung.ToList());
            }
            var doDungs = db.DoDungs.Include(d => d.LoaiDoDung);
            return View(doDungs.ToList());
        }
        public ActionResult Index2(string Sort)
        {
            ViewBag.SortByName = String.IsNullOrEmpty(Sort) ? "ten" : "";
            ViewBag.SortByPrice = (Sort == "dongia" ? "dongia_desc" : "dongia");
            var doDungs = db.DoDungs.Include(d => d.LoaiDoDung);
            switch(Sort)
            {
                case "ten":
                    doDungs = doDungs.OrderByDescending(s => s.TenDD);
                    break;
                case "dongia_desc":
                    doDungs = doDungs.OrderByDescending(s => s.Gia);
                    break;
                case "dongia":
                    doDungs = doDungs.OrderBy(s => s.Gia);
                    break;
                default:
                    doDungs = doDungs.OrderBy(s => s.MaDD);
                    break;
            }
            return View(doDungs.ToList());
        }
        // GET: DoDungs/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoDung doDung = db.DoDungs.Find(id);
            if (doDung == null)
            {
                return HttpNotFound();
            }
            return View(doDung);
        }

        // GET: DoDungs/Create
        public ActionResult Create()
        {
            ViewBag.MaLDD = new SelectList(db.LoaiDoDungs, "MaLoaiDD", "TenLoai");
            return View();
        }

        // POST: DoDungs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaDD,TenDD,Gia,MaLDD,HinhDD")] DoDung doDung)
        {
            if (ModelState.IsValid)
            {
                db.DoDungs.Add(doDung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLDD = new SelectList(db.LoaiDoDungs, "MaLoaiDD", "TenLoai", doDung.MaLDD);
            return View(doDung);
        }

        // GET: DoDungs/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoDung doDung = db.DoDungs.Find(id);
            if (doDung == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLDD = new SelectList(db.LoaiDoDungs, "MaLoaiDD", "TenLoai", doDung.MaLDD);
            return View(doDung);
        }

        // POST: DoDungs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDD,TenDD,Gia,MaLDD,HinhDD")] DoDung doDung)
        {
            if (ModelState.IsValid)
            {
                db.Entry(doDung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLDD = new SelectList(db.LoaiDoDungs, "MaLoaiDD", "TenLoai", doDung.MaLDD);
            return View(doDung);
        }

        // GET: DoDungs/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoDung doDung = db.DoDungs.Find(id);
            if (doDung == null)
            {
                return HttpNotFound();
            }
            return View(doDung);
        }

        // POST: DoDungs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            DoDung doDung = db.DoDungs.Find(id);
            db.DoDungs.Remove(doDung);
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
