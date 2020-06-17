using System.Linq;
using System.Web.Mvc;
using WebMVCDemo.Models;

namespace WebMVCDemo.Controllers
{
    public class ProductController : Controller
    {
        ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();
        // GET: Product
        public ActionResult Index(string meta)
        {
            var v = from t in db.NhomSanPhams
                    where t.Meta == meta
                    select t;
            return View(v.FirstOrDefault());
        }

        public ActionResult Detail(int id)
        {
            ViewBag.meta = "san-pham";
            var v = from t in db.ChiTietSanPhams
                    where t.MaSP == id
                    select t;
            return View(v.FirstOrDefault());
        }

        public ActionResult getSize(int id)
        {
            var v = from t in db.ChiTietSanPhams
                    where t.MaSP == id
                    select t;
            return PartialView(v.ToList());

        }
    }
}