using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using WebMVCDemo.Models;

namespace WebMVCDemo.Areas.admin.Controllers
{
    public class ProductGroupController : Controller
    {
        private ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();

        // GET: admin/ProductGroup
        public ActionResult Index()
        {
            return View(db.NhomSanPhams.ToList());
        }

        // GET: admin/ProductGroup/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhomSanPham nhomSanPham = db.NhomSanPhams.Find(id);
            if (nhomSanPham == null)
            {
                return HttpNotFound();
            }
            return View(nhomSanPham);
        }

        // GET: admin/ProductGroup/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/ProductGroup/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNhom,TenNhom,Meta,Hide,Order,DateBegin")] NhomSanPham nhomSanPham)
        {
            if (ModelState.IsValid)
            {
                db.NhomSanPhams.Add(nhomSanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nhomSanPham);
        }

        // GET: admin/ProductGroup/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhomSanPham nhomSanPham = db.NhomSanPhams.Find(id);
            if (nhomSanPham == null)
            {
                return HttpNotFound();
            }
            return View(nhomSanPham);
        }

        // POST: admin/ProductGroup/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNhom,TenNhom,Meta,Hide,Order,DateBegin")] NhomSanPham nhomSanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhomSanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nhomSanPham);
        }

        // GET: admin/ProductGroup/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhomSanPham nhomSanPham = db.NhomSanPhams.Find(id);
            if (nhomSanPham == null)
            {
                return HttpNotFound();
            }
            return View(nhomSanPham);
        }

        // POST: admin/ProductGroup/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NhomSanPham nhomSanPham = db.NhomSanPhams.Find(id);
            db.NhomSanPhams.Remove(nhomSanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
