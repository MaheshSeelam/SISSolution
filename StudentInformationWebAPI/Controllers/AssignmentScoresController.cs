using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using StudentInformationWebAPI.Models;

namespace StudentInformationWebAPI.Controllers
{
    public class AssignmentScoresController : ApiController
    {
        private StudentInformationSystemEntities db = new StudentInformationSystemEntities();

        // GET: api/AssignmentScores
        public IQueryable<AssignmentScore> GetAssignmentScores()
        {
            return db.AssignmentScores;
        }

        // GET: api/AssignmentScores/5
        [ResponseType(typeof(AssignmentScore))]
        public IHttpActionResult GetAssignmentScore(int id)
        {
            AssignmentScore assignmentScore = db.AssignmentScores.Find(id);
            if (assignmentScore == null)
            {
                return NotFound();
            }

            return Ok(assignmentScore);
        }

        // PUT: api/AssignmentScores/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutAssignmentScore(int id, AssignmentScore assignmentScore)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != assignmentScore.Id)
            {
                return BadRequest();
            }

            db.Entry(assignmentScore).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AssignmentScoreExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/AssignmentScores
        [ResponseType(typeof(AssignmentScore))]
        public IHttpActionResult PostAssignmentScore(AssignmentScore assignmentScore)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.AssignmentScores.Add(assignmentScore);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = assignmentScore.Id }, assignmentScore);
        }

        // DELETE: api/AssignmentScores/5
        [ResponseType(typeof(AssignmentScore))]
        public IHttpActionResult DeleteAssignmentScore(int id)
        {
            AssignmentScore assignmentScore = db.AssignmentScores.Find(id);
            if (assignmentScore == null)
            {
                return NotFound();
            }

            db.AssignmentScores.Remove(assignmentScore);
            db.SaveChanges();

            return Ok(assignmentScore);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AssignmentScoreExists(int id)
        {
            return db.AssignmentScores.Count(e => e.Id == id) > 0;
        }
    }
}