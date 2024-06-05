using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BooksAPI.Models
{
    public class Login
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int IdUsuario { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        
    }

    public class LoginRequest
    {
        public string username { get; set; }
        public string password { get; set; }
    }
}
