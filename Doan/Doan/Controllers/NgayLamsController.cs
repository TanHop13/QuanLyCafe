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
    public class NgayLamsController : Controller
    {
        private Model_Login db = new Model_Login();

        // GET: NgayLams
        public ActionResult Index()
        {
            var ngayLams = db.NgayLams.Include(n => n.CaLamViec).Include(n => n.User);
            return View(ngayLams.ToList());
        }

        // GET: NgayLams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgayLam ngayLam = db.NgayLams.Find(id);
            if (ngayLam == null)
            {
                return HttpNotFound();
            }
            return View(ngayLam);
        }
        public ActionResult Details_NhanVien(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgayLam ngayLam = db.NgayLams.Find(id);
            if (ngayLam == null)
            {
                return HttpNotFound();
            }
            return View(ngayLam);
        }

        // GET: NgayLams/Create
        public ActionResult Create()
        {
            ViewBag.MaCLV = new SelectList(db.CaLamViecs, "MaCLV", "CaLamViec1");
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser");
            return View();
        }

        // POST: NgayLams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNL,MaCLV,MaUser,NgayLamViec")] NgayLam ngayLam)
        {
            if (ModelState.IsValid)
            {
                db.NgayLams.Add(ngayLam);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaCLV = new SelectList(db.CaLamViecs, "MaCLV", "CaLamViec1", ngayLam.MaCLV);
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser", ngayLam.MaUser);
            return View(ngayLam);
        }

        // GET: NgayLams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgayLam ngayLam = db.NgayLams.Find(id);
            if (ngayLam == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaCLV = new SelectList(db.CaLamViecs, "MaCLV", "CaLamViec1", ngayLam.MaCLV);
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser", ngayLam.MaUser);
            return View(ngayLam);
        }

        // GET: NgayLams/Edit/5
        public ActionResult Edit_NhanVien(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgayLam ngayLam = db.NgayLams.Find(id);
            if (ngayLam == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaCLV = new SelectList(db.CaLamViecs, "MaCLV", "CaLamViec1", ngayLam.MaCLV);
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser", ngayLam.MaUser);
            return View(ngayLam);
        }
        // POST: NgayLams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNL,MaCLV,MaUser,NgayLamViec")] NgayLam ngayLam)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ngayLam).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaCLV = new SelectList(db.CaLamViecs, "MaCLV", "CaLamViec1", ngayLam.MaCLV);
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser", ngayLam.MaUser);
            return View(ngayLam);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit_NhanVien([Bind(Include = "MaNL,MaCLV,MaUser,NgayLamViec")] NgayLam ngayLam)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ngayLam).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaCLV = new SelectList(db.CaLamViecs, "MaCLV", "CaLamViec1", ngayLam.MaCLV);
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "TenUser", ngayLam.MaUser);
            return View(ngayLam);
        }
        // GET: NgayLams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgayLam ngayLam = db.NgayLams.Find(id);
            if (ngayLam == null)
            {
                return HttpNotFound();
            }
            return View(ngayLam);
        }

        // POST: NgayLams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NgayLam ngayLam = db.NgayLams.Find(id);
            db.NgayLams.Remove(ngayLam);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete_NhanVien(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgayLam ngayLam = db.NgayLams.Find(id);
            if (ngayLam == null)
            {
                return HttpNotFound();
            }
            return View(ngayLam);
        }

        // POST: NgayLams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed_NhanVien(int id)
        {
            NgayLam ngayLam = db.NgayLams.Find(id);
            db.NgayLams.Remove(ngayLam);
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

        public ActionResult NhanVien(string id)
        {
            var ngayLams = db.NgayLams.Where(n => n.User.MaUser == id);
            return View(ngayLams.ToList());
        }
    }
}
