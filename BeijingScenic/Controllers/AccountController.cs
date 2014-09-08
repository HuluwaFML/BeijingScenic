using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BeijingScenic.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public JsonResult LoginAction()
        {
            string email = Request.Form["Email"];
            string password = Request.Form["Password"];

            //DB Operation
            DBdataDataContext uc = new DBdataDataContext();
            var lq = from l in uc.SUser select l;
            int flag = 0;
            var json = new JsonResult();
            foreach (var result in lq)
            {
                if (email == result.Email.ToString())
                {
                    flag = 1; //邮箱认证成功
                    if (password == result.Password.ToString())
                    {
                        flag = 2; //密码验证成功
                        json.Data = new object[] { new { email, password } };
                        //Set Cookie
                        HttpCookie cookie = new HttpCookie("CaptainCook");
                        DateTime dt = DateTime.Now;
                        TimeSpan ts = new TimeSpan(0, 1, 0, 0, 0);
                        cookie.Expires = dt.Add(ts);
                        cookie.Values.Add("Email", email);
                        cookie.Values.Add("Password", password);
                        Response.AppendCookie(cookie);
                    }
                }
            }

            if (flag == 0)
            {
                json.Data = "Error1";
            }
            else if (flag == 1)
            {
                json.Data = "Error2";
            }
            return json;
           
        }
    }
}
