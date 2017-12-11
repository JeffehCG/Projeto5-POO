<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.web.ProdutoJ" %>
<%@page import="com.database.web.QuantidadeSaidaProduto" %>
<!DOCTYPE html>
<%
    if(request.getParameter("carrinho")!=null){
        int i = Integer.parseInt(request.getParameter("i"));
        int qt = Integer.parseInt(request.getParameter("quantidade"));
        ProdutoJ carrinho = ProdutoJ.getStayList().get(i);
        QuantidadeSaidaProduto.setSaidaProdutos(carrinho.getCdBarra(), qt, carrinho.getVlVenda());
        
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
    </body>
</html>
