using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControleEstoqueSimples.Pages
{
    public partial class Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Carregar();
            }
        }

        protected void Cadastrar()
        {
            try
            {
                string nome = txtNome.Text;
                string descricao = txtDescricao.Text;

                if(nome != "" && descricao != "")
                {
                    Categoria novaCategoria = new Categoria();

                    novaCategoria.Nome = nome;
                    novaCategoria.Descricao = descricao;

                    string mensagem = DAOs.CategoriaDAO.CadastrarCategoria(novaCategoria);
                    DiscordLogger.EnviarLog("Categoria Cadastrada: " + nome );


                    lblMensagem.Text = mensagem;

                    LimparCampos();
                }
            }
            catch (Exception ex)
            {
                lblMensagem.Text = "Erro na função Categorias.Cadastrar(): " + ex;
            }
        }


        private void LimparCampos()
        {
            txtNome.Text = "";
            txtDescricao.Text = "";
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            Cadastrar();
            Carregar();
        }

        private void Carregar()
        {
            try
            {
                List<Categoria> lista = DAOs.CategoriaDAO.ListarCategorias();

                gvCategorias.DataSource = lista;
                gvCategorias.DataBind();

            }
            catch (Exception ex)
            {
                lblMensagem.Text = "Erro na função Categorias.Carregar()" + ex;
            }
        }

        protected void gvCategorias_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnSalvarCategoria_Click(object sender, EventArgs e)
        {

        }
    }
}