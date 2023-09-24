﻿using Doan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Doan.Controllers
{
    public class IndexController : Controller
    {
        Login_Model db = new Login_Model();
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
        public ActionResult Coffee()
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
            var check = db.Users.SingleOrDefault(x=>x.TenUser.Equals(acc) && x.MatKhau.Equals(pass));
            if(check != null)
            {
                Session["User"] = check;
                return RedirectToAction("Index");
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