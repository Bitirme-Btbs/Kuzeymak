using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class OthersController : Controller
    {
        KuzeyMakEntities db = new KuzeyMakEntities();
        // GET: ORANvTUTAR
        public ActionResult Oran()
        {
            var oran = db.Oran.ToList();
            return View(oran);
        }

        //FaaliyetMaliyet
        public ActionResult Tutar()
        {
            var tutar = db.GenelTutar.ToList();
            return View(tutar);
        }

       
        public ActionResult FaaliyetToplam()
        {
            var ft = db.ToplamFaaliyetTutar.ToList();
            return View(ft);
        }
        public ActionResult Endirekt()
        {
            var endirekt = db.EndirektUretimMaliyeti.ToList();
            return View(endirekt);
        }


    }
}