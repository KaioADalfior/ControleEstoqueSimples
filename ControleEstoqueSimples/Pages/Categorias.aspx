<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" MasterPageFile="~/Site.Master" Inherits="ControleEstoqueSimples.Pages.Categorias" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <h2>Cadastro de Categorias</h2>

        <div class="row">

            <div class="col-md-6">
                <div class="form-group">
                    <label>Nome da Categoria</label>
                    <asp:TextBox runat="server" ID="txtNome" CssClass="form-control" />
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label>Descrição da Categoria</label>
                    <asp:TextBox runat="server" ID="txtDescricao" CssClass="form-control" />
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <asp:Button
                    Text="Cadastrar"
                    runat="server"
                    ID="btnCadastrar"
                    CssClass="btn btn-primary"
                    OnClick="btnCadastrar_Click" />
            </div>
        </div>

        <br />

        <asp:Label Text="" runat="server" ID="lblMensagem" CssClass="text-danger" />

        <hr />

        <asp:GridView
            ID="gvCategorias"
            runat="server"
            CssClass="table table-striped table-bordered table-hover"
            AutoGenerateColumns="false"
            OnRowCommand="gvCategorias_RowCommand">

            <Columns>

                <asp:BoundField DataField="idCategoria" HeaderText="ID" />

                <asp:BoundField DataField="Nome" HeaderText="Nome" />

                <asp:BoundField DataField="Descricao" HeaderText="Descrição" />

                <asp:TemplateField HeaderText="Ações">

                    <ItemTemplate>

                        <asp:LinkButton
                            ID="btnVisualizar"
                            runat="server"
                            CssClass="btn btn-info btn-xs"
                            CommandName="Visualizar"
                            CommandArgument='<%# Eval("idCategoria") %>'>
                        Visualizar
                    </asp:LinkButton>

                        <asp:LinkButton
                            ID="btnEditar"
                            runat="server"
                            CssClass="btn btn-warning btn-xs"
                            CommandName="Editar"
                            CommandArgument='<%# Eval("idCategoria") %>'>
                        Editar
                    </asp:LinkButton>

                        <asp:LinkButton
                            ID="btnExcluir"
                            runat="server"
                            CssClass="btn btn-danger btn-xs"
                            CommandName="Excluir"
                            CommandArgument='<%# Eval("idCategoria") %>'>
                        Excluir
                    </asp:LinkButton>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>


        <div class="modal fade" id="modalCategoria" tabindex="-1" role="dialog">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                        <h4 class="modal-title">Categoria</h4>

                    </div>

                    <div class="modal-body">

                        <div class="form-group">

                            <label>Nome</label>

                            <asp:TextBox
                                ID="txtNomeModal"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                        </div>

                        <div class="form-group">

                            <label>Descrição</label>

                            <asp:TextBox
                                ID="txtDescricaoModal"
                                runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine"
                                Rows="3">
                            </asp:TextBox>

                        </div>

                    </div>

                    <div class="modal-footer">

                        <asp:Button
                            ID="btnSalvarCategoria"
                            runat="server"
                            Text="Salvar"
                            CssClass="btn btn-success"
                            OnClick="btnSalvarCategoria_Click" />

                        <button
                            type="button"
                            class="btn btn-default"
                            data-dismiss="modal">
                            Fechar
                        </button>

                    </div>

                </div>

            </div>

        </div>


        <script>
            function abrirModal() {

                $('#modalUsuario').modal('show');

            }
        </script>
</asp:Content>
