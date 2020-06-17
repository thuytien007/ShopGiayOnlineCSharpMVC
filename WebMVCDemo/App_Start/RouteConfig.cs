using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebMVCDemo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //Màn hình trang chủ
            routes.MapRoute("Index", "{type}/{meta}",
                new { controller = "Default", action = "Index", meta = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type", "trang-chu" }
                },
                namespaces: new[] { "WebMVCDemo.Controllers" });

            //Màn hình liên hệ
            routes.MapRoute("Contact", "{type}/{meta}",
                new { controller = "Contact", action = "Contact", meta = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    { "type","lien-he" }
                },
                namespaces: new[] { "WebMVCDemo.Controllers" });

            //Lấy sản phẩm theo nhóm sản phẩm
            routes.MapRoute("Product", "{type}/{meta}",
                new { controller = "Product", action = "Index", meta = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type", "san-pham" }
                },
                namespaces: new[] { "WebMVCDemo.Controllers" });

            //Lấy chi tiết sản phẩm
            routes.MapRoute("Detail", "{type}/{meta}/{id}",
                new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type", "san-pham" }
                },
                namespaces: new[] { "WebMVCDemo.Controllers" });

            //Màn hình chính
            //routes.MapRoute(
            //    name: "Default",
            //    url: "{controller}/{action}/{id}",
            //    defaults: new { controller = "Default", action = "Index", id = UrlParameter.Optional }
            //);

            //Admin
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Default", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "WebMVCDemo.Controllers" }
            );
        }
    }
}
