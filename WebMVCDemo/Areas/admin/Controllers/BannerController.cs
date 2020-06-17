using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMVCDemo.Help;
using WebMVCDemo.Models;

namespace WebMVCDemo.Areas.admin.Controllers
{
    public class BannerController : Controller
    {
        private ShopGiayOnlineEntities db = new ShopGiayOnlineEntities();

        // GET: admin/Banner
        public ActionResult Index()
        {
            return View(db.Banners.ToList());
        }

        // GET: admin/Banner/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        // GET: admin/Banner/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/Banner/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,Image,Link,Meta,Hide,Order,DateBegin")] Banner banner, HttpPostedFileBase img)
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
                        path = Path.Combine(Server.MapPath("~/Areas/admin/Content/admin/upload"), filename);
                        img.SaveAs(path);
                        banner.Image = filename;
                    }
                    else
                    {
                        banner.Image = "logo.png";
                    }
                    banner.DateBegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    banner.Meta = Functions.ConvertToUnSign(banner.Meta);
                    banner.Order = banner.Order;
                    db.Banners.Add(banner);
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
            return View(banner);
        }

        // GET: admin/Banner/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        // POST: admin/Banner/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,Image,Link,Meta,Hide,Order,DateBegin")] Banner banner, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                Banner temp = getById(banner.Id);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Areas/admin/Content/admin/upload"), filename);
                        img.SaveAs(path);
                        temp.Image = filename; //Lưu ý
                    }
                    temp.Meta = Functions.ConvertToUnSign(banner.Meta); //convert Tiếng Việt không dấu
                    temp.Hide = banner.Hide;
                    temp.Order = banner.Order;
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
            return View(banner);
        }

        public Banner getById(int id)
        {
            return db.Banners.Where(x => x.Id == id).FirstOrDefault();

        }

            // GET: admin/Banner/Delete/5
            public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Banner banner = db.Banners.Find(id);
            if (banner == null)
            {
                return HttpNotFound();
            }
            return View(banner);
        }

        // POST: admin/Banner/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Banner banner = db.Banners.Find(id);
            db.Banners.Remove(banner);
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
