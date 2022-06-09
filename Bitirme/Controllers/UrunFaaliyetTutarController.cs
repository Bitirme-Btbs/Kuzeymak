using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class UrunFaaliyetTutarController : Controller
    {
        KuzeyMakEntities db = new KuzeyMakEntities();
        // GET: KuzeyMakEntities
        public ActionResult Index()
        {
            var a = db.ProductPrice1();

            return View(a);
        }
    }
}