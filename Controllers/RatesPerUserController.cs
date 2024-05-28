using Desafio2_DAS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Desafio2_DAS.Controllers
{
    public class RatesPerUserController : Controller
    {
        // GET: RatesPerUser
        public ActionResult Index()
        {
            return View();
        }

        // GET: RatesPerUser/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: RatesPerUser/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RatesPerUser/Create
        [HttpPost]
        public ActionResult Create(string titulo, string usuario, float score)
        {
            try
            {
                // TODO: Add insert logic here
                
                    using (DbModel_Movies2 context = new DbModel_Movies2())
                    {
                        var pelicula = context.Peliculas.FirstOrDefault(p => p.titulo == titulo);
                        if (pelicula != null)
                        {
                        var rate_per_user = new rate_per_user();
                        rate_per_user.id_pelicula = pelicula.id_pelicula;
                        rate_per_user.id_usuario = usuario;
                        rate_per_user.calificacion = score;

                            context.rate_per_user.Add(rate_per_user);
                            context.SaveChanges();
                            
                    }
                    return RedirectToAction("Index", "Peliculas");
                }
                }
                catch(DbUpdateException ex)
                {
                var innerException = ex.InnerException?.InnerException;
                if (innerException != null)
                {
                    Debug.WriteLine("Inner "+innerException.Message);
                }
                Debug.WriteLine("DbUpdateException: " + ex.Message);
                return View("Error", ex);
                }
                catch (Exception ex)
                {
                    return View("Error", ex);
                }

        }

        // GET: RatesPerUser/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: RatesPerUser/Edit/5
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

        // GET: RatesPerUser/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: RatesPerUser/Delete/5
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
