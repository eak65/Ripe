using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Ripe.Models
{
    [DataContract]
    public class RestaurantModel
    {
        [DataMember]
        public IList<objects> objects { get; set; }
        
      
    }

    public class objects
    {
        public String name { get; set; }
        public Boolean has_menu { get; set; }
        public String id { get; set; }
       public String  street_address{ get; set; }
        public String     region{ get; set; }
       public String      @long{ get; set; }
       public String      phone{ get; set; }
      public String       postal_code{ get; set; }
       public String      lat{ get; set; }
      public String       website_url{ get; set; }
       public  IList<menus> menus { get; set; }
    }
    public class menus
    {
        public String menu_name { get; set; }
        public IList<sections>sections {get;set;}

    }
        public class sections
        {
            public String section_name { get; set; }
            public IList<subsections> subsections { get; set; }
        }
    public class subsections
    {
        public IList<contents> contents { get; set; }

    }

    public class contents
    {
        public String price { get; set; }
        public String type { get; set; }
        public String name { get; set; }
        public String description { get; set; }
    }

}