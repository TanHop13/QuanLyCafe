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
using System.Text;
using System.Security.Cryptography;
using System.Data.Entity.Infrastructure;
using System.Web.Helpers;

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
            //var acc = user.MaUser;
            //var pass = user.MatKhau;
            //var admin = db.Users.SingleOrDefault(x => x.MaUser.Equals(acc) && x.MatKhau.Equals(pass) && x.PhanQuyen == 1);
            //var nhanvien = db.Users.SingleOrDefault(s => s.MaUser.Equals(acc) && s.MatKhau.Equals(pass) && s.PhanQuyen == 0);
            //if (admin != null)
            //{
            //    Session["User"] = admin;
            //    return Redirect("~/DoDungs/Index2");
            //}
            //else if(nhanvien!=null)
            //{
            //    Session["User"] = nhanvien;
            //    return Redirect("~/NhanVien/Index2");
            //}
            //else
            //{
            //    ViewBag.LoginFail = "Đăng nhập thất bại, vui lòng kiểm tra lại";
            //    return View("Login");
            //}
            if (ModelState.IsValid)
            {


                var mk = GetMD5(user.MatKhau);
                var checkAdmin = db.Users.SingleOrDefault(s => s.MaUser.Equals(user.MaUser) && s.MatKhau.Equals(mk) && s.PhanQuyen == 1);
                var checkNV = db.Users.SingleOrDefault(s => s.MaUser.Equals(user.MaUser) && s.MatKhau.Equals(mk) && s.PhanQuyen == 0);
                if (checkAdmin != null)
                {
                    Session["User"] = checkAdmin;
                    return Redirect("~/DoDungs/Index2");
                }
                else if (checkNV != null)
                {
                    Session["User"] = checkNV;
                    return Redirect("~/NhanVien/Index2");
                }
                else
                {
                    ViewBag.LoginFail = "Đăng nhập thất bại, vui lòng kiểm tra lại";
                    return View("Login");
                }
            }
            return View();
        }

        public ActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SignUp(User user)
        {
            if (ModelState.IsValid)
            {
                var check = db.Users.FirstOrDefault(s => s.TenUser == user.TenUser);
                if (check == null)
                {
                    user.MatKhau = GetMD5(user.MatKhau);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.Users.Add(user);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Tài khoản đã tồn tại";
                    return View();
                }


            }

            //db.Users.Add(user);
            //db.SaveChanges();
            return RedirectToAction("Login");
        }

        public ActionResult SignOut()
        {
            Session["User"] = null;
            return RedirectToAction("Index");
        }
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
    }
}