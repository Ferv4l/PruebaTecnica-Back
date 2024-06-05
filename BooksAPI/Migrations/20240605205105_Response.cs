using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BooksAPI.Migrations
{
    /// <inheritdoc />
    public partial class Response : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Response",
                columns: table => new
                {
                    codigo = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    mensaje = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Response");
        }
    }
}
