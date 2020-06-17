using System;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMVCDemo.Help;
using WebMVCDemo.Models;

namespace WebMVCDemo.Areas.admin.Controllers
{
    public class ProductsController : Controller
    {
        private ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();

        // GET: admin/Products
        public ActionResult Index()
        {
            var sanPhams = db.SanPhams.Include(s => s.NhomSanPham);
            return View(sanPhams.ToList());
        }

        // GET: admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.MaNhom = new SelectList(db.NhomSanPhams, "MaNhom", "TenNhom");
            return View();
        }

        // POST: admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "MaSP,MaNhom,TenSP,Gia,MoTa,Img,Moi,Meta,Hide,Order,DateBegin")] SanPham sanPham, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = System.IO.Path.Combine(Server.MapPath("~/Areas/admin/Content/admin/upload"), filename);
                        img.SaveAs(path);
                        sanPham.Img = filename;
                    }
                    else
                    {
                        sanPham.Img = "logo.png";
                    }
                    sanPham.MaNhom = sanPham.MaNhom;
                    sanPham.TenSP = sanPham.TenSP;
                    sanPham.Gia = sanPham.Gia;
                    sanPham.MoTa = sanPham.MoTa;
                    sanPham.Moi = sanPham.Moi;
                    sanPham.Hide = sanPham.Hide;
                    sanPham.Order = sanPham.Order;
                    sanPham.DateBegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    sanPham.Meta = Functions.ConvertToUnSign(sanPham.Meta);
                    db.SanPhams.Add(sanPham);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //ViewBag.MaNhom = new SelectList(db.NhomSanPhams, "MaNhom", "TenNhom", sanPham.MaNhom);
            return View(sanPham);
        }

        // GET: admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNhom = new SelectList(db.NhomSanPhams, "MaNhom", "TenNhom", sanPham.MaNhom);
            return View(sanPham);
        }

        // POST: admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "MaSP,MaNhom,TenSP,Gia,MoTa,Img,Moi,Meta,Hide,Order,DateBegin")] SanPham sanPham, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                SanPham temp = getById(sanPham.MaSP);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = System.IO.Path.Combine(Server.MapPath("~/Areas/admin/Content/admin/upload"), filename);
                        img.SaveAs(path);
                        temp.Img = filename;
                    }
                    temp.TenSP = sanPham.TenSP;
                    temp.Gia = sanPham.Gia;
                    temp.MoTa = sanPham.MoTa;
                    temp.Moi = sanPham.Moi;              
                    temp.Meta = Functions.ConvertToUnSign(sanPham.Meta); //convert Tiếng Việt không dấu
                    temp.Hide = sanPham.Hide;
                    temp.Order = sanPham.Order;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            //ViewBag.MaNhom = new SelectList(db.NhomSanPhams, "MaNhom", "TenNhom", sanPham.MaNhom);
            return View(sanPham);
        }
        public SanPham getById(int id)
        {
            return db.SanPhams.Where(x => x.MaSP == id).FirstOrDefault();

        }
        // GET: admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
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
