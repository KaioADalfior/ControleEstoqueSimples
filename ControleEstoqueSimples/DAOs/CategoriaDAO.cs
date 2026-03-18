using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ControleEstoqueSimples.DAOs
{
    public class CategoriaDAO
    {
        public static string CadastrarCategoria(Categoria novaCategoria)
        {
            string mensagem = "";

            try
            {
                using (ControleEstoqueEntities ctx = new ControleEstoqueEntities())
                {
                    ctx.Categorias.Add(novaCategoria);
                    ctx.SaveChanges();
                }

                mensagem = "Categoria " + novaCategoria.Nome + " cadastrada com sucesso!";

            }
            catch (Exception ex)
            {
                mensagem = "Erro na função CategoriaDAO.CadastrarCategoria(): " + ex;
            }

            return mensagem;
        }

        public static List<Categoria> ListarCategorias()
        {

            try
            {
                using (ControleEstoqueEntities ctx = new ControleEstoqueEntities())
                {
                    return ctx.Categorias.ToList();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Erro na função CategoriaDAO.ListarCategorias(): ", ex);
            }
        }
    }
}