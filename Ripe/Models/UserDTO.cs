using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ripe.Models
{
    public class UserDTO
    {
        public UserDTO() { }

        public UserDTO(User user)
        {
           this.Ratings = new HashSet<Rating>();
           this.Photos = new HashSet<Photo>();
            this.UserId = user.UserId;
            this.Password = user.Password;
            this.Email = user.Email;
            this.FirstName = user.FirstName;
            this.LastName = user.LastName;
            this.Sex = user.Sex;
            this.Location = user.Location;
        }
    
        public int UserId { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Sex { get; set; }
        public System.Data.Entity.Spatial.DbGeography Location { get; set; }
    
        public virtual ICollection<Rating> Ratings { get; set; }
        public virtual ICollection<Photo> Photos { get; set; }
    }
}