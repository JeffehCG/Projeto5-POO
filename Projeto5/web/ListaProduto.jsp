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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista De Produtos</h1>
        
        <form action="CarrinhoTeste.jsp">
            <input type="submit" name="car" value="Carrinho"/>
        </form>
        
        <%-- Lista para Cliente(direcionar produto para carrinho)--%>
        <table>
            <tr>
                <th>Codigo De Barras</th>
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
                <td><%=lista.getCdBarra()%></td>
                <td><%=lista.getNome()%></td>
                <td><%=lista.getMarca()%></td>
                <td><%=lista.getVlVenda()%></td>
                <td><%=lista.getQtEstoque()%></td>
                    <form>
                        <td>
                            <input type="number" name="quantidade"/>
                        </td>
                        <td>
                            <input type="hidden" name="i" value="<%=i%>" />
                            <input type="submit" name="carrinho" value="Enviar Carinho"/>
                    </form>
                        </td>
            </tr>
            <%}%>
        </table>
        
        <%-- Lista para Administrador(Excluir, alterar produto)--%>
        <table>
            <tr>
                <th>Codigo De Barras</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Valor</th>
                <th>Quantidade Disponivel</th>
                <th>Quantidade Para Carrinho</th>
            </tr>
        
        <%
            for(int p = 0 ; p<ProdutoJ.getStayList().size();p++){
              ProdutoJ listaad = ProdutoJ.getStayList().get(p);
            %>
            <tr>
                <td><%=listaad.getCdBarra()%></td>
                <td><%=listaad.getNome()%></td>
                <td><%=listaad.getMarca()%></td>
                <td><%=listaad.getVlVenda()%></td>
                <td><%=listaad.getQtEstoque()%></td>
                    <form>
                        <td>
                            <input type="hidden" name="p" value="<%=p%>" />
                            <input type="submit" name="alterar" value="Alterar"/>
                            <input type="submit" name="excluir" value="Excluir"/>
                    </form>
                        </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
