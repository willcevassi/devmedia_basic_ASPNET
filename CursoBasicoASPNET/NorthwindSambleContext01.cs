using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace CursoBasicoASPNET
{
    public class NorthwindSambleContext01
    {
       NortwindLinkContextDataContext context = new NortwindLinkContextDataContext();

        public Table<Product> getProdutos()
        {
            return context.Products;
        }

        public IQueryable<Product> getProdutos(string nome)
        {
            if (nome == null)
            {
                return getProdutos().AsQueryable<Product>();

            }
            return context.Products.Where(p => p.ProductName.Contains(nome));
        }

        public void addProduct(Product p)
        {
            context.Products.InsertOnSubmit(p);
            context.SubmitChanges();
        }

        public void removeProduct(Product p)
        {
            context.Products.DeleteOnSubmit(p);
            context.SubmitChanges();
        }

        public void updateProduct(Product p)
        {

        }
    }
}