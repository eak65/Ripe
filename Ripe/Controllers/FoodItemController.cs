using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Ripe.Models;
namespace Ripe.Controllers
{
    public class FoodItemController : ApiController
    {
 /*      public HttpResponseMessage GetReviews(JObject review)
        {
            int foodItemId = review["foodItemId"].ToObject<int>();

            using (var db = new Model1Container())
            {
                FoodItem foodItem = db.FoodItems.Find(foodItemId);
                if (foodItem != null)
                {
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NoContent);
                }
            }
        }*/

        public HttpResponseMessage PostReview(JObject review)
        {
           int userId= review["userId"].ToObject<int>();
           int foodItemId = review["foodItemId"].ToObject<int>();
           String reviewText = review["reviewText"].ToObject<String>();
           int score = review["score"].ToObject<int>();
     
            using(var db = new Model1Container())
            {
              
               
                FoodItem foodItem = db.FoodItems.Find(foodItemId);
                  if(foodItem!=null)
                  {
                    Rating rating=foodItem.Ratings.Where(r => r.UserUserId == userId).FirstOrDefault();
                    if(rating!=null)  // find rating if it exist.
                        {
                            rating.Score = score;
                            rating.Score = score;
                            if (!reviewText.Equals(""))
                            {
                                rating.Review = reviewText;
                            }
                        }
                    else // rating not found so post it
                    {
                        Rating rate = new Rating();
                        User person = db.Users.Find(userId);
                        if (person == null)
                            return Request.CreateResponse(HttpStatusCode.NotFound);
                        rate.Score = score;
                        if(!reviewText.Equals(""))
                        {
                            rate.Review = reviewText;
                        } person.Ratings.Add(rate);
                        foodItem.Ratings.Add(rate);
                        db.Ratings.Add(rate);
                   

                    }
                    db.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.Accepted);
                  }
                  return Request.CreateResponse(HttpStatusCode.NoContent);
            }

        }

    }
}
