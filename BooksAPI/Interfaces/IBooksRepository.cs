using BooksAPI.Models;
using System.Linq.Expressions;

namespace BooksAPI.Interfaces
{
    public interface IBooksRepository
    {
        IEnumerable<Books>ObtenerLibros();
        IEnumerable<Books>ObtenerLibrosPorId(BooksRequest bo);
        Response AgregarLibros(BooksAdd boa);
        Response EliminarLibro(BooksRequest bo);
        Response ActualizarLibro(BooksUpdate bou);
    }
}
