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
    public class StudentController : Controller
    {
        //
        // GET: /Employee/
        public ActionResult Index()
        {
            IEnumerable<StudentViewModel> empList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Employee").Result;
            empList = response.Content.ReadAsAsync<IEnumerable<StudentViewModel>>().Result;
            return View(empList);
        }

        public ActionResult AddOrEdit(int id = 0)
        {
            if (id == 0)
                return View(new StudentViewModel());
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Employee/" + id.ToString()).Result;
                return View(response.Content.ReadAsAsync<StudentViewModel>().Result);
            }
        }
        [HttpPost]
        public ActionResult AddOrEdit(StudentViewModel emp)
        {
            if (emp.EmployeeID == 0)
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PostAsJsonAsync("Employee", emp).Result;
                TempData["SuccessMessage"] = "Saved Successfully";
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PutAsJsonAsync("Employee/" + emp.EmployeeID, emp).Result;
                TempData["SuccessMessage"] = "Updated Successfully";
            }
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            HttpResponseMessage response = GlobalVariables.WebApiClient.DeleteAsync("Employee/" + id.ToString()).Result;
            TempData["SuccessMessage"] = "Deleted Successfully";
            return RedirectToAction("Index");
        }
    }
