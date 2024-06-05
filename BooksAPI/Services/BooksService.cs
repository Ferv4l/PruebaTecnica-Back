using BooksAPI.Interfaces;
using BooksAPI.Models;

namespace BooksAPI.Services
{
    public class BooksService: IBooksService
    {
        private readonly IBooksRepository _booksRepository;

        public BooksService(IBooksRepository booksRepository)
        {
            _booksRepository = booksRepository;
        }
        public IEnumerable<Books> ObtenerLibros()
        {
            return _booksRepository.ObtenerLibros();

        }
        public IEnumerable<Books> ObtenerLibrosPorId(BooksRequest bo)
        {
            return _booksRepository.ObtenerLibrosPorId(bo);

        }
        public Response AgregarLibros(BooksAdd boa)
        {
            return _booksRepository.AgregarLibros(boa);
        }

        public Response EliminarLibro(BooksRequest bo)
        {
            return _booksRepository.EliminarLibro(bo);
        }

        public Response ActualizarLibro(BooksUpdate bou)
        {
            return _booksRepository.ActualizarLibro(bou);
        }
    }
}
