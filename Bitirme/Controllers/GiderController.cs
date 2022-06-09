using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class GiderController : Controller
    {
        KuzeyMakEntities db = new KuzeyMakEntities();
        // GET: Gider
        public ActionResult Index()
        {
            var Gider = db.Gider.ToList();
            return View(Gider);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Gider parametre)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            else
            {
                var mukerrerAd = db.Gider.Where(ba => ba.HesapAd == parametre.HesapAd).FirstOrDefault();
                var mukerrerKod = db.Gider.Where(ba => ba.HesapKodu == parametre.HesapKodu).FirstOrDefault();
                if (mukerrerAd==null && mukerrerKod==null)
                {
                db.Gider.Add(parametre);
                db.SaveChanges();
                return RedirectToAction("Index");
                }
                return View();
                
            }
        }
        public ActionResult Remove(int id)
        {
            var remove = db.Gider.Find(id);
            db.Gider.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            var details = db.Gider.Find(id);
            return View(details);
        }
        public ActionResult Edit(Gider parametre)
        {
            var mukerrerAd = db.Gider.Where(ba => ba.HesapAd == parametre.HesapAd).FirstOrDefault();
            var mukerrerKod = db.Gider.Where(ba => ba.HesapKodu == parametre.HesapKodu).FirstOrDefault();
            if (mukerrerAd == null && mukerrerKod == null)
            {

                var edit = db.Gider.Find(parametre.GiderId);
                edit.HesapKodu = parametre.HesapKodu;
                edit.HesapAd = parametre.HesapAd;
                edit.Tutar = parametre.Tutar;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var id = parametre.GiderId;
            string yolu = "Details/" + id.ToString();
            return RedirectToAction(yolu);

        }
    }
}