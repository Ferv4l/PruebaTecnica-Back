using BooksAPI.Interfaces;
using BooksAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BooksAPI.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly IBooksService booksService;

        public BooksController(IBooksService booksService)
        {
            this.booksService = booksService;
        }

        [HttpGet("[action]")]
        public IActionResult ObtenerLibros()
        {
            return Ok(booksService.ObtenerLibros());
        }

        [HttpPost("[action]")]
        public IActionResult ObtenerLibrosPorId(BooksRequest bo)
        {
            return Ok(booksService.ObtenerLibrosPorId(bo));
        }

        [HttpPost("[action]")]
        public IActionResult AgregarLibro(BooksAdd boa)
        {
            return Ok(booksService.AgregarLibros(boa));
        }

        [HttpPost("[action]")]
        public IActionResult EliminarLibro(BooksRequest bo)
        {
            return Ok(booksService.EliminarLibro(bo));
        }

        [HttpPost("[action]")]
        public IActionResult ActualizarLibro(BooksUpdate bou)
        {
            return Ok(booksService.ActualizarLibro(bou));
        }
    }
}
