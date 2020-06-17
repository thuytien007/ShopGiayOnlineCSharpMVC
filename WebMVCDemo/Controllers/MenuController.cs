using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCDemo.Models;

namespace WebMVCDemo.Controllers
{
    public class MenuController : Controller
    {
        ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();
        // GET: Menu
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult getMenu(string metatitle)
        {
            ViewBag.meta = metatitle;
            var v = from t in db.Menus
                    where t.Hide == false
                    orderby t.Order ascending
                    select t;
            return PartialView(v.ToList());
        }
    }
}