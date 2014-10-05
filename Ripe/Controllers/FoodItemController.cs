using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Ripe.Models;
using Newtonsoft.Json;
namespace Ripe.Controllers
{
    public class FoodItemController : ApiController
    {
     public HttpResponseMessage GetReviews(JObject review)
        {
            int foodItemId = review["foodItemId"].ToObject<int>();

            using (var db = new Model1Container())
            {
                FoodItem foodItem = db.FoodItems.Find(foodItemId);
                if (foodItem != null)
                {
                    JArray foodItems = JArray.Parse(JsonConvert.SerializeObject(foodItem.Ratings.ToList()));
                    return Request.CreateResponse<JArray>(HttpStatusCode.OK, foodItems);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NoContent);
                }
            }
        }

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
                        rating = new Rating();
                        rating.Date = DateTime.UtcNow;
                        User person = db.Users.Find(userId);
                        if (person == null)
                            return Request.CreateResponse(HttpStatusCode.NotFound);
                        rating.Score = score;
                        if(!reviewText.Equals(""))
                        {
                            rating.Review = reviewText;
                        }
                        rating.RestaurantName = foodItem.MenuSection.Appetizer.Restaurant.Name;

                        person.Ratings.Add(rating);
                        foodItem.Ratings.Add(rating);
                        db.Ratings.Add(rating);
                   

                    }
                    db.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.Accepted);
                  }
                  return Request.CreateResponse(HttpStatusCode.NoContent);
            }

        }

    }
}
