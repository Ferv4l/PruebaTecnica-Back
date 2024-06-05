using BooksAPI.Models;

namespace BooksAPI.Interfaces
{
    public interface IBooksService
    {
        IEnumerable<Books> ObtenerLibros();
        IEnumerable<Books> ObtenerLibrosPorId(BooksRequest bo);
        Response AgregarLibros(BooksAdd boa);
        Response EliminarLibro(BooksRequest bo);
        Response ActualizarLibro(BooksUpdate bou);

    }
}
