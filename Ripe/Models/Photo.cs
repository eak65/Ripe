//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ripe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Photo
    {
        public int Id { get; set; }
        public string URI { get; set; }
        public int FoodItemId { get; set; }
    
        public virtual User User { get; set; }
        public virtual FoodItem FoodItem { get; set; }
    }
}
