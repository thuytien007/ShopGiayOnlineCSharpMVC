using System.Linq;
using System.Web.Mvc;
using WebMVCDemo.Models;

namespace WebMVCDemo.Areas.admin.Controllers
{
    public class DefaultController : Controller
    {
        ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();
        // GET: admin/Default
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LoginAdmin(string username, string pass)
        {
            LoginAdmin loginAdmin = db.LoginAdmins.SingleOrDefault(u => u.Username == username);
            if (loginAdmin.Username == username)
            {
                if (loginAdmin.Password == pass)
                {
                    return RedirectToAction("Index", "Default");
                }
                else
                {
                    return RedirectToAction("Login", "Default");
                }
            }
            else
            {
                return RedirectToAction("Login", "Default");
            }
            //return View();
        }




    }
}