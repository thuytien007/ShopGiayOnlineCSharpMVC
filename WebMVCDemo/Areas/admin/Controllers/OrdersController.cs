using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using WebMVCDemo.Models;

namespace WebMVCDemo.Areas.admin.Controllers
{
    public class OrdersController : Controller
    {
        private ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();

        // GET: admin/Orders
        public ActionResult Index()
        {
            var donHangs = db.DonHangs.Include(d => d.Customer).Include(c =>c.ChiTietDonHangs);
            //var chiTietDonHangs = db.ChiTietDonHangs.Include(d => d.ChiTietSanPham);
            return View(donHangs.ToList());
        }

        // GET: admin/Orders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            //var model = from dh in db.DonHangs
            //            join ctdh in db.ChiTietDonHangs on dh.MaHD equals ctdh.MaHD
            //            from ctdhs in db.ChiTietDonHangs
            //            join ctsp in db.ChiTietSanPhams on ctdhs.MaCTSP equals ctsp.MaCTSP
            //            from ctsps in db.ChiTietSanPhams
            //            join sp in db.SanPhams on ctsp.MaSp equals sp.MaSP
            //            //select new Class1( test = 1);
            if (donHang == null)
            {
                return HttpNotFound();
            }
            return View(donHang);
        }

        // GET: admin/Orders/Create
        public ActionResult Create()
        {
            ViewBag.MaKH = new SelectList(db.Customers, "MaKH", "TenKH");  
            return View();
        }

        // POST: admin/Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHD,NgayDatHang,TongTien,MaKH,TrangThai,Meta,Hide,Order,DateBegin")] DonHang donHang)
        {
            if (ModelState.IsValid)
            {
                db.DonHangs.Add(donHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaKH = new SelectList(db.Customers, "MaKH", "TenKH", donHang.MaKH);
            return View(donHang);
        }

        // GET: admin/Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            if (donHang == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaKH = new SelectList(db.Customers, "MaKH", "TenKH", donHang.MaKH);
            return View(donHang);
        }

        // POST: admin/Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHD,NgayDatHang,TongTien,MaKH,TrangThai,Meta,Hide,Order,DateBegin")] DonHang donHang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(donHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaKH = new SelectList(db.Customers, "MaKH", "TenKH", donHang.MaKH);
            return View(donHang);
        }

        // GET: admin/Orders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang donHang = db.DonHangs.Find(id);
            if (donHang == null)
            {
                return HttpNotFound();
            }
            return View(donHang);
        }

        // POST: admin/Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DonHang donHang = db.DonHangs.Find(id);
            db.DonHangs.Remove(donHang);
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
