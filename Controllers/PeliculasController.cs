using Desafio2_DAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Desafio2_DAS.Controllers
{
    public class PeliculasController : Controller
        
    {
        // GET: Peliculas
        public ActionResult Index()
        {
            using (DbModel_Movies2 context = new DbModel_Movies2())
            {
                var peliculas = context.Peliculas
                    .Include("Directores")
                    .Include("Generos")
                    .ToList();
                return View(peliculas);
            }

        }


        // GET: Peliculas/Details/5
        public ActionResult DetailsUnique(string nombre)
        {
            if (nombre is null)
            {
                throw new ArgumentNullException(nameof(nombre));
            }

            using (DbModel_Movies2 context = new DbModel_Movies2())
            {
                var peliculas = context.Peliculas
                    .Include("Generos")
                    .Include("Directores")
                    .Include("Puntuaciones")
                    .Where(x=> x.titulo.Contains(nombre)).ToList();
                return View("Details",peliculas);
            }
        }

        public ActionResult Details(string nombre)
        {
            if (nombre is null)
            {
                throw new ArgumentNullException(nameof(nombre));
            }

            using (DbModel_Movies2 context = new DbModel_Movies2())
            {
                var peliculas = context.Peliculas
                    .Include("Generos")
                    .Include("Puntuaciones")
                    .Include("Directores")
                    .Where(x => x.titulo.Contains(nombre)).ToList();
                return View("Index", peliculas);
            }
        }


        // GET: Peliculas/Details/Genero
        public ActionResult FiltrarPorGenero(String genero)
        {
            using (DbModel_Movies2 context = new DbModel_Movies2())
            {
                var peliculas = context.Peliculas
                    .Include("Generos")
                    .Include("Directores")
                    .Where(g => g.Generos.genero == genero)
                    .ToList();
                       
                return View("Index",peliculas);
            }
        }


        // GET: Peliculas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Peliculas/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
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

        // GET: Peliculas/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Peliculas/Edit/5
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

        // GET: Peliculas/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Peliculas/Delete/5
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
