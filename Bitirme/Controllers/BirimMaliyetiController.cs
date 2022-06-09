using Bitirme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bitirme.Controllers
{
    public class BirimMaliyetiController : Controller
    {
        // GET: BirimMaliyeti
        KuzeyMakEntities db = new KuzeyMakEntities();
        public ActionResult Index()
        {
            var objects = db.BirimMaliyet.ToList();
            return View(objects);
        }
        public ActionResult ToplamMaliyet()
        {
            var ba = db.SPToplamMaliyet1();
            return View(ba);
        }
        public ActionResult BirimMaliyetTutar()
        {
            var ba = db.BirimMaliyetSP2();
            return View(ba);
        }
        [HttpGet]
        public ActionResult Create()
        {
            
            List<SelectListItem> urun = (from i in db.Urun.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.UrunAd,
                                             Value = i.UrunId.ToString(),
                                         }
                                         ).ToList();
            urun.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            List<SelectListItem> dagitim = (from i in db.DagıtımOlcu.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.DagıtımOlcu_Ad,
                                             Value = i.DagıtımOlcu_Id.ToString(),
                                         }
                                         ).ToList();
            dagitim.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Dagitim = dagitim;
            ViewBag.Urunler = urun;
            return View();
        }
        [HttpPost]
        public ActionResult Create(BirimMaliyet parametre)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            else
            {
                
                    db.BirimMaliyet.Add(parametre);
                    db.SaveChanges();
                    return RedirectToAction("Index");      
            }


        }
        public ActionResult Remove(int id)
        {
            var remove = db.BirimMaliyet.Find(id);
            db.BirimMaliyet.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {

            List<SelectListItem> urun = (from i in db.Urun.ToList()
                                         select new SelectListItem
                                         {
                                             Text = i.UrunAd,
                                             Value = i.UrunId.ToString(),
                                         }
                                         ).ToList();
            urun.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            List<SelectListItem> dagitim = (from i in db.DagıtımOlcu.ToList()
                                            select new SelectListItem
                                            {
                                                Text = i.DagıtımOlcu_Ad,
                                                Value = i.DagıtımOlcu_Id.ToString(),
                                            }
                                         ).ToList();
            dagitim.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
            ViewBag.Dagitim = dagitim;
            ViewBag.Urunler = urun;

            var data = db.BirimMaliyet.Find(id);
            return View(data);
        }
        public ActionResult Edit(BirimMaliyet parametre)
        {
           

                var m = db.BirimMaliyet.Find(parametre.BM_Id);

                m.Dimmg = parametre.Dimmg;
                m.Dig = parametre.Dig;

                var m_urun = db.Urun.Where(ba => ba.UrunId == parametre.Urun.UrunId).FirstOrDefault();
                m.Urun_ID = m_urun.UrunId;

            var dd = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            m.BirimDagitimOlcu = dd.DagıtımOlcu_Id;

            db.SaveChanges();
                return RedirectToAction("Index");
           
        }


    }

}