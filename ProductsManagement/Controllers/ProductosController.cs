using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProductsManagement.Models;

namespace ProductsManagement.Controllers
{
    public class ProductosController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ProductosController(ApplicationDbContext context)
        {
            _context = context;
        }

        public ActionResult Index(int? categoriaId)
        {
            // Categorías con ventas en 2019
            var categorias = _context.Categoria
                .Where(c => c.Productos.Any(p => p.Ventas.Any(v => v.Fecha.Year == 2019)))
                .ToList();

            ViewBag.Categorias = new SelectList(categorias, "CodigoCategoria", "Nombre");

            var productos = new List<Producto>();

            if (categoriaId.HasValue)
            {
                productos = _context.Producto
                    .Where(p => p.CodigoCategoria == categoriaId.Value &&
                                p.Ventas.Any(v => v.Fecha.Year == 2019))
                    .ToList();
            }

            return View(productos);
        }
    }

}
