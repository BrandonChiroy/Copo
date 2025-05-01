using System.ComponentModel.DataAnnotations;

namespace ProductsManagement.Models
{
    public class Categoria
    {
        [Key]
        public int CodigoCategoria { get; set; }

        public string Nombre { get; set; }

        public ICollection<Producto> Productos { get; set; }
    }

}
