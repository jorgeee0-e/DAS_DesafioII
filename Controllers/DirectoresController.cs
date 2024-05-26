using Desafio2_DAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Desafio2_DAS.Controllers
{
    public class DirectoresController : Controller
    {
        // GET: Directores
        public ActionResult Index()
        {
            using (DbModel_Movies2 context = new DbModel_Movies2())
            {
                return View(context.Directores.ToList());
            }
                
        }

        // GET: Directores/Details/5
        public ActionResult Details(int id)
        {
            using (DbModel_Movies2 context = new DbModel_Movies2())
            {
                var peliculas = context.Directores.Where(x => x.id_director == id);
                return View(peliculas);
            }
                
        }

        // GET: Directores/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Directores/Create
        [HttpPost]
        public ActionResult Create(Directores director)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Directores/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Directores/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Directores/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Directores/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
