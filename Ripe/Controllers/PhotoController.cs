using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Auth;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.WindowsAzure;

using System.Configuration;
using System.IO;
using System.Drawing;
using System.Web.Hosting;
using System.Web;
using System.Drawing.Imaging;
using Newtonsoft.Json.Linq;
using Ripe.Models;
using Newtonsoft.Json;
using System.Threading.Tasks;
namespace Ripe.Controllers
{
    public class PhotoController : ApiController
    {
        public HttpResponseMessage GetPhotos(int userId)
        {
            using(var db = new Model1Container())
            {

                IList<Photo> photos = db.Photos.Where(p => p.User.UserId == userId).ToList();
                IList<PhotoDTO> photosDTO = new List<PhotoDTO>();
                foreach(Photo p in photos)
                {
                    photosDTO.Add(new PhotoDTO(p));
                }


                JArray photoArray = JArray.Parse(JsonConvert.SerializeObject(photosDTO));

                return Request.CreateResponse<JArray>(HttpStatusCode.OK,photoArray);
        }}

        public async Task<HttpResponseMessage> PostProfilePhoto()
        {
            //    int foodId = photoObject["foodItemId"].ToObject<Int32>();


            if (Request.Content.IsMimeMultipartContent())
            {
                await Request.Content.ReadAsMultipartAsync<MultipartMemoryStreamProvider>(new MultipartMemoryStreamProvider()).ContinueWith((task) =>
                {
                    MultipartMemoryStreamProvider provider = task.Result;
                    foreach (HttpContent content in provider.Contents)
                    {
                        Stream stream = content.ReadAsStreamAsync().Result;
                        Image image = Image.FromStream(stream);
                        var testName = content.Headers.ContentDisposition.Name;
                        String[] headerValues1 = (String[])Request.Headers.GetValues("userId");
                        int userId = Int32.Parse(headerValues1[0]);

                        using (var db = new Model1Container())
                        {
                            User user = db.Users.Find(userId);

                            ProfileImage photo = new ProfileImage();
                            photo.User = user;


                            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
                           ConfigurationManager.ConnectionStrings["StorageConnectionString"].ConnectionString);
                            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
                            // Retrieve a reference to a container. 
                            CloudBlobContainer container = blobClient.GetContainerReference("profileimage");

                            // Create the container if it doesn't already exist.
                            container.CreateIfNotExists();
                            container.SetPermissions(new BlobContainerPermissions
                            {
                                PublicAccess =
                                    BlobContainerPublicAccessType.Blob
                            });

                            string uniqueBlobName = string.Format("/image_{0}.png",userId);
                            CloudBlockBlob blob = container.GetBlockBlobReference(uniqueBlobName);
                            photo.URI = blob.Uri.ToString();
                            var streamOut = new System.IO.MemoryStream();
                            image.Save(streamOut, ImageFormat.Png);
                            streamOut.Position = 0;

                            blob.UploadFromStream(streamOut);
                            db.SaveChanges();
                            streamOut.Close();
                            stream.Close();

                        }


                    }
                });

            }
            return Request.CreateResponse(HttpStatusCode.OK);
        }
        public async Task<HttpResponseMessage> PostPhoto()
        {
        //    int foodId = photoObject["foodItemId"].ToObject<Int32>();


               if (Request.Content.IsMimeMultipartContent())
               {
                 await  Request.Content.ReadAsMultipartAsync<MultipartMemoryStreamProvider>(new MultipartMemoryStreamProvider()).ContinueWith((task) =>
                   {
                       MultipartMemoryStreamProvider provider = task.Result;
                       foreach (HttpContent content in provider.Contents)
                       {
                           Stream stream = content.ReadAsStreamAsync().Result;
                           Image image = Image.FromStream(stream);
                           var testName = content.Headers.ContentDisposition.Name;
                           String[] headerValues = (String[])Request.Headers.GetValues("foodId");
                           String[] headerValues1 = (String[])Request.Headers.GetValues("userId");
                           String[] headerValues2 = (String[])Request.Headers.GetValues("restaurantId");
                           int userId = Int32.Parse(headerValues1[0]);
                           int foodId = Int32.Parse(headerValues[0]);
                           int restaurantId = Int32.Parse(headerValues2[0]);
           using (var db = new Model1Container())
           {
               FoodItem foodItem=db.FoodItems.Find(foodId);
               User user = db.Users.Find(userId);
               Restaurant r = db.Restaurants.Find(restaurantId);
                       Photo photo = new Photo();
                       photo.User = user;
                       photo.Date = DateTime.UtcNow;
                       photo.RestaurantName = r.Name;
                       photo.FoodName = foodItem.Name;
                       photo.RestaurantId = r.Id;
                           CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
                          ConfigurationManager.ConnectionStrings["StorageConnectionString"].ConnectionString);
                           CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
                           // Retrieve a reference to a container. 
                           CloudBlobContainer container = blobClient.GetContainerReference("fooditem");

                           // Create the container if it doesn't already exist.
                           container.CreateIfNotExists();
                           container.SetPermissions(new BlobContainerPermissions
                           {
                               PublicAccess =
                                   BlobContainerPublicAccessType.Blob
                           });

                           string uniqueBlobName = string.Format("fooditem/image_{0}.png",
                  Guid.NewGuid().ToString());
                          foodItem.Photos.Add(photo);
                           CloudBlockBlob blob = container.GetBlockBlobReference(uniqueBlobName);
                          photo.URI = blob.Uri.ToString();
                           var streamOut = new System.IO.MemoryStream();
                           image.Save(streamOut, ImageFormat.Png);
                           streamOut.Position = 0;

                           blob.UploadFromStream(streamOut);
                           db.SaveChanges();
                            }


                       }
                   });
              
           }
            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
