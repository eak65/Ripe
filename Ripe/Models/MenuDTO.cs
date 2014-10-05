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
            
            this.SoupSalad = new SoupSaladDTO(r.SoupSalad);
            this.Entree = new EntreeDTO(r.Entree);
            this.Dessert = new DessertDTO(r.Dessert);
            this.Side = new SideDTO(r.Side);
          //  this.Drink = new DrinkDTO(r.Drink);
        
      //      this.Other = new OtherDTO(r.Other);
            
        }
 
        public AppetizerDTO Appetizer { get; set; }  
        public SoupSaladDTO SoupSalad { get; set; }
        public EntreeDTO Entree { get; set; }
        public DessertDTO Dessert { get; set; }
     
     //   public DrinkDTO Drink { get; set; }
       
       public SideDTO Side { get; set; }
    //    public OtherDTO Other { get; set; }


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
    public class SideDTO
    {
        public SideDTO(Side side)
        {
            this.foodItems = new HashSet<FoodItemDTO>();

            foreach (MenuSection menu in side.MenuSections)
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


    public class PhotoDTO
    {
            public PhotoDTO(Photo p)
            {
                this.URI = p.URI;
                this.Date = p.Date;
               this.FoodItemId= p.FoodItemId;
            }

            public String URI { get; set; }
            public DateTime Date { get; set; }
            public int FoodItemId { get; set; }

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
            this.Photos = new HashSet<PhotoDTO>();
            foreach (Photo r in food.Photos.ToList())
            {
                this.Photos.Add(new PhotoDTO(r));
            }
        }
    
        public int Id { get; set; }
        public int MenuSectionId { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<RatingDTO> Ratings { get; set; }
        public virtual ICollection<PhotoDTO> Photos { get; set; }
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
            this.Date = rates.Date;
            this.RestaurantName = rates.RestaurantName;
            this.FoodItemName = rates.FoodItem.Name;
            this.RestaurantId = rates.RestaurantId;
        }
               public int Id { get; set; }
        public int Score { get; set; }
        public string Review { get; set; }
        public int FoodItemId { get; set; }
        public int RestaurantId { get; set; }

        public int UserUserId { get; set; }
        public DateTime Date { get; set; }
        public virtual UserDTO User { get; set; }
        public string RestaurantName { get; set; }
        public string FoodItemName { get; set; }
    }
}