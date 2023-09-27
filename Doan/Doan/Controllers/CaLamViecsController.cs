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
    public class CaLamViecsController : Controller
    {
        private Model_Login db = new Model_Login();

        // GET: CaLamViecs
        public ActionResult Index()
        {
            var caLamViecs = db.CaLamViecs.Include(c => c.User);
            return View(caLamViecs.ToList());
        }

        // GET: CaLamViecs/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CaLamViec caLamViec = db.CaLamViecs.Find(id);
            if (caLamViec == null)
            {
                return HttpNotFound();
            }
            return View(caLamViec);
        }

        // GET: CaLamViecs/Create
        public ActionResult Create()
        {
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser");
            return View();
        }

        // POST: CaLamViecs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaCLV,CaLamViec1,GioBD,GioKT,MaUser")] CaLamViec caLamViec)
        {
            if (ModelState.IsValid)
            {
                db.CaLamViecs.Add(caLamViec);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser", caLamViec.MaUser);
            return View(caLamViec);
        }

        // GET: CaLamViecs/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CaLamViec caLamViec = db.CaLamViecs.Find(id);
            if (caLamViec == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser", caLamViec.MaUser);
            return View(caLamViec);
        }

        // POST: CaLamViecs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaCLV,CaLamViec1,GioBD,GioKT,MaUser")] CaLamViec caLamViec)
        {
            if (ModelState.IsValid)
            {
                db.Entry(caLamViec).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser", caLamViec.MaUser);
            return View(caLamViec);
        }

        // GET: CaLamViecs/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CaLamViec caLamViec = db.CaLamViecs.Find(id);
            if (caLamViec == null)
            {
                return HttpNotFound();
            }
            return View(caLamViec);
        }

        // POST: CaLamViecs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            CaLamViec caLamViec = db.CaLamViecs.Find(id);
            db.CaLamViecs.Remove(caLamViec);
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
