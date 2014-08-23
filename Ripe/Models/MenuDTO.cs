using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ripe.Models
{

    public class RestaurantDTO
    {
        public RestaurantDTO(Restaurant r)
        {
            this.Appetizer = new AppetizerDTO(r.Appetizer);
            this.Dessert = new DessertDTO(r.Dessert);
            this.SoupSalad = new SoupSaladDTO(r.SoupSalad);
            this.Drink = new DrinkDTO(r.Drink);
            this.Entree = new EntreeDTO(r.Entree);
            this.Other = new OtherDTO(r.Other);
            
        }
        public AppetizerDTO Appetizer { get; set; }
        public DessertDTO Dessert { get; set; }
        public SoupSaladDTO SoupSalad { get; set; }
        public DrinkDTO Drink { get; set; }
        public EntreeDTO Entree { get; set; }

        public OtherDTO Other { get; set; }


    }
    public class AppetizerDTO
    {
      public  AppetizerDTO(Appetizer app)
      {
          this.foodItems = new HashSet<FoodItemDTO>();

          foreach (MenuSection menu in app.MenuSections)
          {
              foreach (FoodItem item in menu.FoodItems)
              {
                  this.foodItems.Add(new FoodItemDTO(item));
              }
          }
      }
      public virtual ICollection<FoodItemDTO> foodItems { get; set; }

    }
    public class EntreeDTO
    {
        public EntreeDTO(Entree app)
        {
            this.foodItems = new HashSet<FoodItemDTO>();

            foreach (MenuSection menu in app.MenuSections)
            {
                foreach (FoodItem item in menu.FoodItems)
                {
                    this.foodItems.Add(new FoodItemDTO(item));
                }
            }
        }
        public virtual ICollection<FoodItemDTO> foodItems { get; set; }

    }

    public class DrinkDTO
    {
        public DrinkDTO(Drink app)
        {
            this.foodItems = new HashSet<FoodItemDTO>();

            foreach (MenuSection menu in app.MenuSections)
            {
                foreach (FoodItem item in menu.FoodItems)
                {
                    this.foodItems.Add(new FoodItemDTO(item));
                }
            }
        }
        public virtual ICollection<FoodItemDTO> foodItems { get; set; }

    }
    public class DessertDTO
    {
        public DessertDTO(Dessert app)
        {
            this.foodItems = new HashSet<FoodItemDTO>();

            foreach (MenuSection menu in app.MenuSections)
            {
                foreach (FoodItem item in menu.FoodItems)
                {
                    this.foodItems.Add(new FoodItemDTO(item));
                }
            }
        }
        public virtual ICollection<FoodItemDTO> foodItems { get; set; }

    }

    public class SoupSaladDTO
    {
        public SoupSaladDTO(SoupSalad app)
        {
            this.foodItems = new HashSet<FoodItemDTO>();

            foreach (MenuSection menu in app.MenuSections)
            {
                foreach (FoodItem item in menu.FoodItems)
                {
                    this.foodItems.Add(new FoodItemDTO(item));
                }
            }
        }
        public virtual ICollection<FoodItemDTO> foodItems { get; set; }

    }
    public class OtherDTO
    {
        public OtherDTO(Other app)
        {
            this.foodItems = new HashSet<FoodItemDTO>();

            foreach (MenuSection menu in app.MenuSections)
            {
                foreach (FoodItem item in menu.FoodItems)
                {
                    this.foodItems.Add(new FoodItemDTO(item));
                }
            }
        }
        public virtual ICollection<FoodItemDTO> foodItems { get; set; }

    }





    public class FoodItemDTO
    {
        public FoodItemDTO(FoodItem food)
        {

            this.Name = food.Name;
            this.Price = food.Price;
            this.Type = food.Type;
            this.Description = food.Description;
            this.Id = food.Id;
            this.MenuSectionId = food.MenuSectionId;
           this.Ratings = new HashSet<RatingDTO>();
            foreach(Rating r in food.Ratings.ToList())
            {
                this.Ratings.Add(new RatingDTO(r));
            }
         //   this.Photos = new HashSet<Photo>();
        }
    
        public int Id { get; set; }
        public int MenuSectionId { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<RatingDTO> Ratings { get; set; }
     //   public virtual ICollection<PhotoDTO> Photos { get; set; }
    }
    public class RatingDTO
    {
        public RatingDTO(Rating rates)
        {
            this.Id = rates.Id;
            this.Score = rates.Score;
            this.Review = rates.Review;
            this.FoodItemId = rates.FoodItemId;
            this.UserUserId = rates.UserUserId;
            this.User = new UserDTO();
            this.User.FirstName = rates.User.FirstName;
            this.User.LastName = rates.User.LastName;

        }
               public int Id { get; set; }
        public int Score { get; set; }
        public string Review { get; set; }
        public int FoodItemId { get; set; }
        public int UserUserId { get; set; }
    
        public virtual UserDTO User { get; set; }
    }
}