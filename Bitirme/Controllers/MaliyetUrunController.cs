using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Bitirme.Models;
namespace Bitirme.Controllers
{
    public class MaliyetUrunController : Controller
    {
        KuzeyMakEntities db = new KuzeyMakEntities();
        // GET: MaliyetUrun
        public ActionResult Index()
        {
            var urunmaliyetler = db.MaliyetUrun.ToList();
            return View(urunmaliyetler);
        }
        public ActionResult Remove(int id)
        {
            var remove = db.MaliyetUrun.Find(id);
            db.MaliyetUrun.Remove(remove);
            db.SaveChanges();
            return RedirectToAction("Index");
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
            ViewBag.Urunler = urun;
            List<SelectListItem> Dagıtımolcusu = (from i in db.DagıtımOlcu.ToList()
                                                  select new SelectListItem
                                                  {
                                                      Text = i.DagıtımOlcu_Ad,
                                                      Value = i.DagıtımOlcu_Id.ToString(),
                                                  }
                                        ).ToList();
            ViewBag.Do = Dagıtımolcusu;
            Dagıtımolcusu.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });

            return View();
        }
        [HttpPost]
        public ActionResult Create(MaliyetUrun parametre)
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
            ViewBag.Urunler = urun;
            List<SelectListItem> Dagıtımolcusu = (from i in db.DagıtımOlcu.ToList()
                                                  select new SelectListItem
                                                  {
                                                      Text = i.DagıtımOlcu_Ad,
                                                      Value = i.DagıtımOlcu_Id.ToString(),
                                                  }
                                        ).ToList();
            ViewBag.Do = Dagıtımolcusu;
            Dagıtımolcusu.Insert(0, new SelectListItem()
            {
                Value = "0",
                Text = "-- Lütfen Seçiniz --"
            });
         
                var requiredUrun = parametre.Urun.UrunId;
                var requiredDagitim = parametre.DagıtımOlcu.DagıtımOlcu_Id;


                var mukerrer = db.MaliyetUrun.Where(ba => ba.UrunId == parametre.Urun.UrunId && ba.DagitimOlcuId==parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
               
                if (mukerrer==null)
                {
                    if (requiredUrun != 0)
                    {
                        if (requiredDagitim != 0)
                        {

                      
                  
                    
                      
                var urn = db.Urun.Where(ba => ba.UrunId == parametre.Urun.UrunId).FirstOrDefault();
                parametre.Urun = urn;
                var dao = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
                parametre.DagıtımOlcu = dao;


                db.MaliyetUrun.Add(parametre);
                db.SaveChanges();
                return RedirectToAction("Index");

                        }
                    
                }
                return View();
            }
            return View();
        }
        public ActionResult Edit(MaliyetUrun parametre)
        {
            var mukerrer = db.MaliyetUrun.Where(ba => ba.UrunId == parametre.Urun.UrunId && ba.DagitimOlcuId == parametre.DagıtımOlcu.DagıtımOlcu_Id && ba.UrunDagitimAdet==parametre.UrunDagitimAdet).FirstOrDefault();
            if (mukerrer==null)
            {

            
            var m = db.MaliyetUrun.Find(parametre.MaliyetUrunId);

            m.UrunDagitimAdet = parametre.UrunDagitimAdet;

            var m_urun = db.Urun.Where(ba => ba.UrunId == parametre.Urun.UrunId).FirstOrDefault();
            m.UrunId = m_urun.UrunId;

            var m_daol = db.DagıtımOlcu.Where(ba => ba.DagıtımOlcu_Id == parametre.DagıtımOlcu.DagıtımOlcu_Id).FirstOrDefault();
            m.DagitimOlcuId = m_daol.DagıtımOlcu_Id;
           
         

            db.SaveChanges();
            return RedirectToAction("Index"); }
            var id = parametre.MaliyetUrunId;
            string way = "Details/" + id.ToString();
            return RedirectToAction(way);
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
            ViewBag.Urunler = urun;
            List<SelectListItem> Dagıtımolcusu = (from i in db.DagıtımOlcu.ToList()
                                                  select new SelectListItem
                                                  {
                                                      Text = i.DagıtımOlcu_Ad,
                                                      Value = i.DagıtımOlcu_Id.ToString(),
                                                  }
                                        ).ToList();
            ViewBag.Do = Dagıtımolcusu;
           

            var dt = db.MaliyetUrun.Find(id);
            return View(dt);
        }
    }
}