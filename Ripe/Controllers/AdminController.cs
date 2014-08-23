using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Ripe.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Serialization.Json;
using System.Threading.Tasks;
using System.Web.Http;

namespace Ripe.Controllers
{
    public class AdminController : ApiController
    {
        public async Task<HttpResponseMessage> PostRestaurant(JObject info)
        {
            String restaurentId = info["id"].ToObject<String>();
            List<String> entree = info["entree"].ToObject<List<String>>();
            List<String> appetizer = info["appetizer"].ToObject<List<String>>();
            List<String> dessert = info["dessert"].ToObject<List<String>>();
            List<String> drinks = info["drinks"].ToObject<List<String>>();
            List<String> other = info["other"].ToObject<List<String>>();
            List<String> soup = info["soup"].ToObject<List<String>>();

            String apikey = "6ad36ca9b012676380f9af057421e65da0cfb61a";
            var client = new HttpClient();
            var uri = new Uri("https://api.locu.com/v1_0/venue/" + restaurentId + "/?api_key=" + apikey);
            Stream respStream = await client.GetStreamAsync(uri);
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(RestaurantModel));
            RestaurantModel feed = (RestaurantModel)ser.ReadObject(respStream);

            IList<menus> menus = feed.objects[0].menus.ToList();
            IList<sections> appSections = new List<sections>();
            IList<sections> entreSections = new List<sections>();
            IList<sections> dessertSections = new List<sections>();
            IList<sections> drinkSections = new List<sections>();
            IList<sections> otherSections = new List<sections>();
            IList<sections> soupSections = new List<sections>();
            foreach (menus menu in menus)
            {
                foreach (sections section in menu.sections)
                {
                  
                    foreach (String secName in appetizer)
                    {
                        if (this.deepEqual(secName, section.section_name))
                        {
                            appSections.Add(section);
                            break;
                        }

                    }

                    foreach (String secName in entree)
                    {
                        if (this.deepEqual(secName, section.section_name))
                        {
                            entreSections.Add(section);
                            break;
                        }

                    }

                    foreach (String secName in dessert)
                    {
                        if (this.deepEqual(secName, section.section_name))
                        {
                            dessertSections.Add(section);
                            break;
                        }

                    }

                    foreach (String secName in drinks)
                    {
                        if (this.deepEqual(secName, section.section_name))
                        {
                            drinkSections.Add(section);
                            break;
                        }

                    }

                    foreach (String secName in other)
                    {
                        if (this.deepEqual(secName, section.section_name))
                        {
                            otherSections.Add(section);
                            break;
                        }

                    }

                    foreach (String secName in soup)
                    {
                        if (this.deepEqual(secName,section.section_name))
                        {
                            soupSections.Add(section);
                            break;
                        }

                    }
                }
            }

            menus finalMenu = new menus();
            Restaurant restuarant = new Restaurant();
            restuarant.Name = feed.objects[0].name;
            restuarant.region = feed.objects[0].region;
            restuarant.Phone = feed.objects[0].phone;
            restuarant.WebsiteURL = feed.objects[0].website_url;
            restuarant.zip = feed.objects[0].region;
            restuarant.lat = feed.objects[0].lat;
            restuarant.LocuId = feed.objects[0].id;
            restuarant.StreetAddress = feed.objects[0].street_address;
            restuarant.lon = feed.objects[0].@long;
            using (var db = new Model1Container())
            {
                Restaurant rest= db.Restaurants.Include("Appetizer").Include("Drink").Include("Other").Include("Dessert").Include("Entree").Include("SoupSalad").Where(r => r.LocuId.Equals(restuarant.LocuId)).FirstOrDefault();
                if (rest != null)
                {
                    try
                    {
                        db.Appetizers.Remove(rest.Appetizer);
                        db.Drinks.Remove(rest.Drink);
                        db.Other.Remove(rest.Other);
                        db.Desserts.Remove(rest.Dessert);
                        db.Entrees.Remove(rest.Entree);
                        db.SoupSalads.Remove(rest.SoupSalad);

                        db.Restaurants.Remove(rest);
                        db.SaveChanges();
                    }
                    catch(Exception e)
                    {

                    }
                }
                    rest = new Restaurant();
                    db.Restaurants.Add(rest);
                    // super weird
                   rest.Appetizer = new Appetizer();
                //   rest.Appetizer.Id = rest.Id;
                    rest.Entree = new Entree();
                 //   rest.Entree.Id = rest.Id+1;
                    rest.SoupSalad = new SoupSalad();
                 //   rest.SoupSalad.Id = rest.Id + 2;
                    rest.Dessert = new Dessert();
                   // rest.Dessert.Id = rest.Id + 3;
                    rest.Other = new Other();
                  //  rest.Other.Id = rest.Id + 4;
                    rest.Drink = new Drink();
                  //  rest.Drink.Id = rest.Id + 5;
                   db.Appetizers.Add(rest.Appetizer);
                    db.Entrees.Add(rest.Entree);
                    db.SoupSalads.Add(rest.SoupSalad);
                    db.Desserts.Add(rest.Dessert);
                    db.Other.Add(rest.Other);
                    db.Drinks.Add(rest.Drink);
                
                
                    
                    rest.Name = restuarant.Name;
                    rest.region =restuarant.region;
                    rest.Phone =  restuarant.Phone ;
                    rest.WebsiteURL = restuarant.WebsiteURL ;
                    rest.zip =  restuarant.zip;
                    rest.lat =restuarant.lat ;
                    rest.LocuId =restuarant.LocuId ;
                    rest.StreetAddress = restuarant.StreetAddress;
                    rest.lon = restuarant.lon;

               
              



                       rest.Appetizer.MenuSections=this.getMenuSections(db,appSections);
                     rest.Entree.MenuSections = this.getMenuSections(db,entreSections);
                      rest.SoupSalad.MenuSections = this.getMenuSections(db,soupSections);
                       rest.Dessert.MenuSections = this.getMenuSections(db,dessertSections);
                   rest.Other.MenuSections = this.getMenuSections(db,otherSections);
                     rest.Drink.MenuSections = this.getMenuSections(db,drinkSections);
              
                       db.SaveChanges();
             

            }
            JObject jobj = JObject.Parse(JsonConvert.SerializeObject(feed));
            return Request.CreateResponse<JObject>(HttpStatusCode.OK, jobj);

        }

        public void Get(int id)
        {
            using(var db = new Model1Container())
            {
             Restaurant rest=  db.Restaurants.Find(id);
        List<MenuSection> me=     rest.Appetizer.MenuSections.ToList<MenuSection>();
        List<FoodItem> food = me[0].FoodItems.ToList<FoodItem>();
            
            }
        }
      public Boolean deepEqual(String s1, String s2)
        {
            if (s1.Length <= s2.Length)
            {
                for (int i = 0; i < s1.Length; i++)
                {
                    try
                    {
                        if (!s1[i].Equals(s2[i]))
                        {
                            return false;
                        }
                    }
                    catch (Exception e)
                    {

                    }

                }
                return true;
            }
            else
            {
                return false;
            }

          
        }

       public ICollection<MenuSection> getMenuSections(Model1Container db ,ICollection<sections> sections)
        {
            ICollection<MenuSection> menuSections = new HashSet<MenuSection>();
            foreach (sections s in sections)
            {
                MenuSection section = new MenuSection();
                section.SectionName = s.section_name;
                foreach(subsections subsection in s.subsections)
                {

                foreach (contents item in subsection.contents)
                {
                    FoodItem fooditem = new FoodItem();
                    fooditem.Name = item.name;
                    fooditem.Price = item.price;
                    if (item.type.Equals("SECTION_TEXT"))
                        break;
                    fooditem.Type = item.type;
                    fooditem.Description = item.description;
                    section.FoodItems.Add(fooditem);
                    db.FoodItems.Add(fooditem);

                }
                }
                menuSections.Add(section);
                db.MenuSections.Add(section);
            }
            return menuSections;
        }
    }
}
