using StudentManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentManagementSystem.Models;

namespace StudentManagementSystem.Controllers
{
    public class LoginController : Controller
    {

        Model1 db = new Model1();


        //
        // GET: /Login/
        public ActionResult Index()
        {
            return View();
        }




        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(User objchk)
        {


            if (ModelState.IsValid)
            {
                using (Model1 db = new Model1())
                {

                    var obj = db.User.FirstOrDefault(a => a.UserName.Equals(objchk.UserName) && a.Password.Equals(objchk.Password));

                    if (obj != null)
                    {
                        Session["UserID"] = obj.id.ToString();
                        Session["UserName"] = obj.UserName.ToString();
                        return RedirectToAction("Index", "Home");


                    }

                    else
                    {

                        ModelState.AddModelError("", "The UserName or Password Incorrect");



                    }


                }


            }

            return View(objchk);
        }


        public ActionResult Logout()
        {

            Session.Clear();
            return RedirectToAction("Index", "Login");



        }











    }
}