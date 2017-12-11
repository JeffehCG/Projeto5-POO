<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.web.QuantidadeSaidaProduto" %>
<%@page import="com.database.web.SaidaProduto" %>
<%@page import="com.database.web.ProdutoJ" %>
<!DOCTYPE html>
<%
    int cpf = 1; // Atribuir valor do cpf da sessão aqui 
    String enterParkingErrorMessage = null;
    
    //Remove item do array
        try {
            if(request.getParameter("remove")!=null){
                int i = Integer.parseInt(request.getParameter("i"));
                QuantidadeSaidaProduto.getSaida().remove(i);
            }
        } catch (Exception e) {
        }
    
        
    //Grava Itens do array no banco 
    try {
            if(request.getParameter("efetuar")!=null){
                Timestamp time = SaidaProduto.InserirSaidaProduto(cpf);
                double vlTotal = 0;
                for(int c = 0; c<QuantidadeSaidaProduto.getSaida().size();c++){
                   QuantidadeSaidaProduto venda = QuantidadeSaidaProduto.getSaida().get(c);
                   QuantidadeSaidaProduto.SaidaProduto(cpf, time, venda.getCodigoProduto(), venda.getQtSaida(), venda.getVlVenda());
                   vlTotal += QuantidadeSaidaProduto.VlTotalVenda(venda.getQtSaida(), venda.getVlVenda());
                   ProdutoJ.saidaEstoque(venda.getCodigoProduto(), venda.getQtSaida());
                }
                QuantidadeSaidaProduto.getSaida().clear();
                SaidaProduto.InserirVlTotal(vlTotal, cpf, time);
            }
        
        } catch (Exception e) {
            enterParkingErrorMessage = e.getMessage();
        }

    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho</title>
    </head>
    <body>
        <h1>Carrinho</h1>
        
         <table >
                <tr>
                    <th>Codigo</th>
                    <th>Quantidade </th>
                    <th>Valor Unitario</th>
                </tr>
                                                
                <% for(int i=0; i<QuantidadeSaidaProduto.getSaida().size();i++){ %>
                <% QuantidadeSaidaProduto ob = QuantidadeSaidaProduto.getSaida().get(i);%>
                <tr>
                    <td><%=ob.getCodigoProduto()%></td>
                    <td><%=ob.getQtSaida()%></td>
                    <td><%=ob.getVlVenda()%></td>
                    
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
                            <input type="submit" name="remove" value="Excluir"/>
                            <input type="submit" name="alterar" value="Alterar"/>
                            
                        </form>
                    </td>
                </tr>
                <%}%>                 
            </table> 
        
            <form>
                <input type="submit" name="efetuar" value="Efetuar Compra"/>
            </form>
            
    </body>
</html>
