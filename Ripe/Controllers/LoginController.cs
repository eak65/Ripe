using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Ripe.Models;
using System.Data.Entity.Spatial;
using Newtonsoft.Json;
namespace Ripe.Controllers
{
    public class LoginController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

      public HttpResponseMessage PutLogin (JObject body)
        {
            String email = body["email"].ToObject<String>();
            String password = body["password"].ToObject<String>();
            using (var db = new Model1Container())
            {
                User currentUser= db.Users.Where(u => u.Email.Equals(email)).FirstOrDefault();
                if (currentUser != null)
                {
                    if (currentUser.Password.Equals(password))
                    {
                        UserDTO user = new UserDTO(currentUser);
                        JObject userObject = JObject.Parse(JsonConvert.SerializeObject(user));
                        return Request.CreateResponse<JObject>(HttpStatusCode.OK, userObject);
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.Unauthorized);

                    }
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }

            }


        }
     
        // PUT api/<controller>/5
        public HttpResponseMessage PostSignUp(JObject body)
        {
        String firstname=  body["firstName"].ToObject<String>();
        String password = body["password"].ToObject<String>();
        String email = body["email"].ToObject<String>();
        String lastname = body["lastName"].ToObject<String>();
        String sex = body["sex"].ToObject<String>();
        String location = body["location"].ToObject<String>();

            using(var db = new Model1Container())
            {
               User testUser= db.Users.Where(s=> s.Email.Equals(email)).FirstOrDefault();
               if (testUser == null) { 
                User newUser = new User();
                newUser.FirstName = firstname;
                newUser.LastName = lastname;
                newUser.Email = email;
                newUser.Sex = sex;
                newUser.Location = DbGeography.FromText(location);
                newUser.Password = password;
                db.Users.Add(newUser);
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.Accepted);

               }
               else {

                   return Request.CreateResponse(HttpStatusCode.Conflict);
               }
            
        
        
        }



        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}