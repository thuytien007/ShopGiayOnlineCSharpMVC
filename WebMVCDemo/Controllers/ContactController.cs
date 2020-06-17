using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCDemo.Models;

namespace WebMVCDemo.Controllers
{
    public class ContactController : Controller
    {
        ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();
        // GET: Contact
        public ActionResult Contact(string meta)
        {
            var v = from t in db.Menus
                    where t.Meta == meta
                    select t;
            return View(v.FirstOrDefault());
        }
    }
}