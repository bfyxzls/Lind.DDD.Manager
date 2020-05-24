using Lind.DDD.Authorization;
using Lind.DDD.Filters;
using Lind.DDD.IRepositories;
using Lind.DDD.Manager.Filters;
using Lind.DDD.Manager.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Lind.DDD.Manager.Controllers
{
    public class EvaluationController : Controller
    {
        protected readonly IExtensionRepository<Evaluation> evaluationRepository;
        protected readonly ManagerContext db;

        public EvaluationController()
        {
            db = new ManagerContext();
            evaluationRepository = new ManagerEfRepository<Evaluation>();
        }
        // GET: Evaluation
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var linq = evaluationRepository.GetModel();

            ViewBag.TotalRecord = linq.Count();

            return View(linq.OrderBy(i => i.Id)
                            .ToPagedList(new Paging.PageParameters(page, pageSize))
                            .ToList());
        }

        // GET: Evaluation/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Evaluation/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Evaluation/Create
        [ManagerActionLoggerAttribute("添加评论")]
        [ActionAuthority(Authority.Create)]
        [HttpPost]
        public ActionResult Create(Evaluation entity)
        {
            if (ModelState.IsValid)
            {
                evaluationRepository.Insert(entity);
                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError("", "请把表单填写完整...");
                return View(entity);
            }
        }

        // GET: Evaluation/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Evaluation/Edit/5
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

        // GET: Evaluation/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Evaluation/Delete/5
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
