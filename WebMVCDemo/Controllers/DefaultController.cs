using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCDemo.Models;

namespace WebMVCDemo.Controllers
{
    public class DefaultController : Controller
    {
        ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();
        // GET: Default
        public ActionResult Index()
        {
            ViewBag.meta = "trang-chu";
            return View();
        }

        public ActionResult getCategory()
        {
            ViewBag.meta = "san-pham";
            var v = from t in db.NhomSanPhams
                    where t.Hide == false
                    orderby t.Order ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getProduct(int id, string metatitle)
        {
            ViewBag.meta = "san-pham";
            var v = from t in db.SanPhams
                    where t.MaNhom == id && t.Hide == false
                    orderby t.Order ascending
                    select t;
            return PartialView(v.ToList());
        }
    }
}