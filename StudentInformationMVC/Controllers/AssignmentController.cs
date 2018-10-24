using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Http;
using StudentInformationMVC.Models;
using System.Threading;

namespace StudentInformationMVC.Controllers
{
    public class AssignmentController : Controller
    {
        //
        // GET: /Employee/
        public ActionResult Index()
        {
            IEnumerable<AssignmentViewModel> empList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Assignments").Result;
            empList = response.Content.ReadAsAsync<IEnumerable<AssignmentViewModel>>().Result;
            return View(empList);
        }

        [HttpPost]
        public ActionResult AddOrEdit(AssignmentViewModel emp)
        {
            if (emp.Id == 0)
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PostAsJsonAsync("Assignments", emp).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PutAsJsonAsync("Assignments/" + emp.Id, emp).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
            }
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            HttpResponseMessage response = GlobalVariables.WebApiClient.DeleteAsync("Assignments/" + id.ToString()).Result;
            TempData["SuccessMessage"] = "Deleted Successfully";
            return RedirectToAction("Index");
        }
    }
}
