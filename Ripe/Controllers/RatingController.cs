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
    public class RatingController : ApiController
    {

        public HttpResponseMessage GetReviews(int userId)
        {
            using (var db = new Model1Container())
            {
             IList<Rating>ratings=db.Ratings.Where(s => s.UserUserId == userId).ToList<Rating>();
             if (ratings != null)
             {
                 IList<RatingDTO> ratingsDTO = new List<RatingDTO>();
                 foreach(Rating rate in ratings)
                 {
                     ratingsDTO.Add(new RatingDTO(rate));

                 }
                 
                 JArray ratingsObject = JArray.Parse(JsonConvert.SerializeObject(ratingsDTO));

                 return Request.CreateResponse<JArray>(HttpStatusCode.OK, ratingsObject);
             }
             else
             {
                 return Request.CreateResponse(HttpStatusCode.NoContent);
             }

            }
         }
    }
}
