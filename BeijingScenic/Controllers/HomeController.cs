using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BeijingScenic.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            HttpCookie hc = Request.Cookies["CaptainCook"];
            if (hc != null)
            {
                ViewData["email"] = hc["Email"];
            }
            return View();
        }

        public ActionResult GetUsers()
        {
            return View("Index");
        }
    }
}
