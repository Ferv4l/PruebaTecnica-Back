namespace BooksAPI.Models
{
    public class BooksRequest
    {
        public int BookID { get; set; }

    }

    public class BooksAdd
    {
        public string Title { get; set; }   
        public string Author { get; set; }
        public string Genre { get; set; }
        public DateTime PublisDate { get; set; }  

    }

    public class BooksUpdate
    {
        public int BookID { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Genre { get; set; }
        public DateTime PublisDate { get; set; }

    }
}
