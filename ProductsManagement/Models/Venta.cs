using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductsManagement.Models
{
    public class Venta
    {
        [Key]
        public int CodigoVenta { get; set; }

        public DateTime Fecha { get; set; }

        [ForeignKey("Producto")]
        public int CodigoProducto { get; set; }

        public Producto Producto { get; set; }
    }

}
