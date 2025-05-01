using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductsManagement.Models
{
    public class Producto
    {
        [Key]
        public int CodigoProducto { get; set; }

        public string Nombre { get; set; }

        [ForeignKey("Categoria")]
        public int CodigoCategoria { get; set; }

        public Categoria Categoria { get; set; }

        public ICollection<Venta> Ventas { get; set; }
    }

}
