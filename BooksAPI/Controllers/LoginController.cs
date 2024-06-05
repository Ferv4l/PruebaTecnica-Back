using BooksAPI.Data;
using BooksAPI.Interfaces;
using BooksAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BooksAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private IConfiguration _config;
        private readonly ApiContext apicontext;

        public IBooksRepository Repository { get; }
        public LoginController(IConfiguration config, IBooksRepository repository, ApiContext apicontext)
        {
            _config = config;
            Repository = repository;
            this.apicontext = apicontext;
        }


        [HttpPost]
        public IActionResult Post([FromBody] Login loginRequest)
        {
            var usuario = apicontext.Logins.FirstOrDefault(l => l.username == loginRequest.username && l.password == loginRequest.password);
            if (usuario != null)
            {
                var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
                var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

                var Sectoken = new JwtSecurityToken(_config["Jwt:Issuer"],
                  _config["Jwt:Issuer"],
                  null,
                  expires: DateTime.Now.AddMinutes(120),
                  signingCredentials: credentials);

                var token = new JwtSecurityTokenHandler().WriteToken(Sectoken);

                return Ok(token);
            }
            else
            {
                return BadRequest("No tienes acceso");
            }
        }
    }
}
