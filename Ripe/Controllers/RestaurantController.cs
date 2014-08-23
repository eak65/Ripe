using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Ripe.Models;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace Ripe.Controllers
{
    public class RestaurantController : ApiController
    {

        public HttpResponseMessage GetRestaurant(int restuarantId)
        {

            using (var db = new Model1Container())
            {
                Restaurant r = db.Restaurants.Find(restuarantId);
                if (r != null)
                {
                    RestaurantDTO restaurant = new RestaurantDTO(r);
                    JObject menuObject = JObject.Parse(JsonConvert.SerializeObject(restaurant));
                    return Request.CreateResponse<JObject>(HttpStatusCode.OK, menuObject);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NoContent);
                }
            }

        }
        public HttpResponseMessage GetRestaurant(String locuId)
        {
            using (var db = new Model1Container())
            {
                Restaurant rest = db.Restaurants.Where(r => r.LocuId.Equals(locuId)).FirstOrDefault();
                if (rest != null)
                {
                    RestaurantDTO restaurant = new RestaurantDTO(rest);
                    JObject menuObject = JObject.Parse(JsonConvert.SerializeObject(restaurant));
                    return Request.CreateResponse<JObject>(HttpStatusCode.OK, menuObject);
                }
                else // attempt to locate the restaurant by name and lat/lon
                {

                    return Request.CreateResponse(HttpStatusCode.NoContent);
                }

            }


        }
    }
}
