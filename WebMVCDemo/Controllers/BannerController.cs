using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCDemo.Models;

namespace WebMVCDemo.Controllers
{
    public class BannerController : Controller
    {
        ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();
        // GET: Banner
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult getBanner()
        {
            var v = from t in db.Banners
                    where t.Hide == false
                    orderby t.Order ascending
                    select t;
            return PartialView(v.ToList());
        }
    }
}