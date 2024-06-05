using BooksAPI.Data;
using BooksAPI.Interfaces;
using BooksAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace BooksAPI.Repositories
{
    public class BooksRepository: IBooksRepository
    {
        private readonly ApiContext apiContext;

        public BooksRepository(ApiContext apiContext)
        {
            this.apiContext = apiContext;
        }

        public IEnumerable<Books> ObtenerLibros()
        {
            try
            {
                var result = apiContext.Set<Books>().FromSql($"exec dbo.sp_GetAllBooks");
                return result;
            }
            catch (Exception ex)
            {
                throw new ("Error al obtener configuración", ex);
            }

        }

        public IEnumerable<Books> ObtenerLibrosPorId(BooksRequest bo)
        {
            try
            {
                var result = apiContext.Set<Books>().FromSql($"exec dbo.sp_GetBookById {bo.BookID}");
                return result;
            }
            catch (Exception ex)
            {
                throw new("Error al obtener configuración", ex);
            }
        }

        public Response AgregarLibros(BooksAdd boa)
        {
            try
            {
                var result = apiContext.Set<Response>().FromSql($"exec dbo.sp_InsertBook {boa.Title},{boa.Author},{boa.Genre},{boa.PublisDate}");
                return result.ToList().First();
            }
            catch (Exception ex)
            {
                throw new("Error al obtener configuración", ex);
            }
        }

        public Response EliminarLibro(BooksRequest bo)
        {
            try
            {
                var result = apiContext.Set<Response>().FromSql($"exec dbo.sp_DeleteBook {bo.BookID}");
                return result.ToList().First();
            }
            catch (Exception ex)
            {
                throw new("Error al obtener configuración", ex);
            }
        }

        public Response ActualizarLibro(BooksUpdate bou)
        {
            try
            {
                var result = apiContext.Set<Response>().FromSql($"exec dbo.sp_UpdateBooks {bou.BookID},{bou.Title},{bou.Author},{bou.Genre},{bou.PublisDate}");
                return result.ToList().First();
            }
            catch (Exception ex)
            {
                throw new("Error al obtener configuración", ex);
            }
        }


    }
}
