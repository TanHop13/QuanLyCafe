using Doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Serialization.Configuration;
using System.Data.Entity;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Web.UI.WebControls;


namespace Doan.Controllers
{
    public class IndexController : Controller
    {
        Model_Login db = new Model_Login();
        // GET: Index
        public ActionResult Index()
        {
           return View();
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Blog()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Login(User user)
        {
            var acc = user.TenUser;
            var pass = user.MatKhau;
            //User users = (User) Session["user"];
            //var admin = db.Users.Count(s => s.TenUser.ToUpper() == users.TenUser.ToUpper() & s.PhanQuyen = false);
            //var NhanVien = db.Users.Count(x => x.MaUser == users.MaUser & x.PhanQuyen = true);
            //if(admin == 1)
            //{
            //    Session["User"] = admin;
            //    return RedirectToAction("/DoDungs/Index");
            //}
            //else if(NhanVien == 1)
            //{
            //    Session["User"] = NhanVien;
            //    return RedirectToAction("Index");
            //}
            var admin = db.Users.SingleOrDefault(x => x.TenUser.Equals(acc) && x.MatKhau.Equals(pass) && x.PhanQuyen == 1);
            var nhanvien = db.Users.SingleOrDefault(s => s.TenUser.Equals(acc) && s.MatKhau.Equals(pass) && s.PhanQuyen == 0);
            if (admin != null)
            {
                Session["User"] = admin;
                return Redirect("~/DoDungs/Index2");
            }
            else if(nhanvien!=null)
            {
                Session["User"] = nhanvien;
                return Redirect("~/NhanVien/Index2");
            }
            else
            {
                ViewBag.LoginFail = "Đăng nhập thất bại, vui lòng kiểm tra lại";
                return View("Login");
            }
        }

        public ActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignUp(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
            return RedirectToAction("Login");
        }

        public ActionResult SignOut()
        {
            Session["User"] = null;
            return RedirectToAction("Index");
        }
    }
}