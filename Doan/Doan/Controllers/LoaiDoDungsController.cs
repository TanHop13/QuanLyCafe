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
    public class LoaiDoDungsController : Controller
    {
        private Model_Login db = new Model_Login();

        // GET: LoaiDoDungs
        public ActionResult Index()
        {
            return View(db.LoaiDoDungs.ToList());
        }

        // GET: LoaiDoDungs/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDoDung loaiDoDung = db.LoaiDoDungs.Find(id);
            if (loaiDoDung == null)
            {
                return HttpNotFound();
            }
            return View(loaiDoDung);
        }

        // GET: LoaiDoDungs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LoaiDoDungs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLoaiDD,TenLoai,MoTa")] LoaiDoDung loaiDoDung)
        {
            if (ModelState.IsValid)
            {
                db.LoaiDoDungs.Add(loaiDoDung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loaiDoDung);
        }

        // GET: LoaiDoDungs/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDoDung loaiDoDung = db.LoaiDoDungs.Find(id);
            if (loaiDoDung == null)
            {
                return HttpNotFound();
            }
            return View(loaiDoDung);
        }

        // POST: LoaiDoDungs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLoaiDD,TenLoai,MoTa")] LoaiDoDung loaiDoDung)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiDoDung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiDoDung);
        }

        // GET: LoaiDoDungs/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDoDung loaiDoDung = db.LoaiDoDungs.Find(id);
            if (loaiDoDung == null)
            {
                return HttpNotFound();
            }
            return View(loaiDoDung);
        }

        // POST: LoaiDoDungs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            LoaiDoDung loaiDoDung = db.LoaiDoDungs.Find(id);
            db.LoaiDoDungs.Remove(loaiDoDung);
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
