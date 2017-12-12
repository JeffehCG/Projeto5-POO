<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.web.ProdutoJ" %>
<%@page import="com.database.web.QuantidadeSaidaProduto" %>
<%@page import="com.database.web.QuantidadeEntradaProduto" %>
<!DOCTYPE html>
<%
    String enterParkingErrorMessage = null;
    try{
    //Exibe produtos do banco
    if(request.getParameter("carrinho")!=null){
        int i = Integer.parseInt(request.getParameter("i"));
        int qt = Integer.parseInt(request.getParameter("quantidade"));
        ProdutoJ carrinho = ProdutoJ.getStayList().get(i);
        QuantidadeSaidaProduto.setSaidaProdutos(carrinho.getCdBarra(), qt, carrinho.getVlVenda());
        
    }
        }catch(Exception e){
        enterParkingErrorMessage = e.getMessage();
    }
    try{
    //Excluir produto do banco
    if(request.getParameter("excluir")!=null){
        int p = Integer.parseInt(request.getParameter("p"));
        ProdutoJ exclusao = ProdutoJ.getStayList().get(p);
        ProdutoJ.excluirProduto(exclusao.getCdBarra());
        response.sendRedirect(request.getRequestURI());
    }
    }catch(Exception e){
        enterParkingErrorMessage = "Produto não pode ser excluido, tem relação com vendas ou compras";
    }

%>
<html>
    <head>
        <title>Loja de Produtos Diversos | Good Judgment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="assets/user/css/style.css">
    </head>
    <body>
                <form action="CarrinhoTeste.jsp">
            <input type="submit" name="car" value="Carrinho"/>
        </form>
        <%-- Fazer um if para verificar qual o tipo de usuário logado e mostrar a navbar correta, além de mostrar o nome do usuário também. --%>
        <%@include file="WEB-INF/jspf/navbar-logado-admin.jspf" %>
        <div class="container pesquisa">
            <form>
                <div class="row">
                    <div class="col s1"></div>
                    <div class="input-field col s9">
                        <input placeholder="Digite o nome do produto a ser procurado" type="text" class="input-pesquisa" name="txt_pesquisa">
                    </div>
                    <div class="col s2">
                        <button class="btn waves-effect waves-light btn-pesquisa" type="submit" name="btn-pesquisar">Pesquisar</button>
                    </div>
                </div>
            </form>
            <table align="center" class="responsive-table">
                <tr>
                <th>Nome</th>
                <th>Marca</th>
                <th>Valor</th>
                <th>Quantidade Disponivel</th>
                <th>Quantidade Para Carrinho</th>
                </tr>
            <%
                for(int i = 0 ; i<ProdutoJ.getStayList().size();i++){
                 ProdutoJ lista = ProdutoJ.getStayList().get(i);
            %>
                <tr>
                    <td><%=lista.getNome()%></td>
                    <td><%=lista.getMarca()%></td>
                    <td><%=lista.getVlVenda()%></td>
                    <td><%=lista.getQtEstoque()%></td>
                <form>
                        <td style="text-align: center">
                            <input class="btn waves-light btn-cart" type="number" name="quantidade"/>
                        </td>
                        <td>
                            <input type="hidden" name="i" value="<%=i%>" />
                            <input class="btn waves-light btn-cart" type="submit" name="carrinho" value="Enviar Carinho"/>
                            
                        </td>
                </form>
                    <%--<td style="text-align: center"><button type="submit" class="btn waves-effect waves-light btn-cart"><i class="material-icons">add_shopping_cart</i></button></td>--%>
                </tr>
                <%}%>
            </table>
        </div>
        <div class="container">
            <hr/>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript" src="assets/user/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="assets/user/js/user.js"></script>
    </body>
</html>
