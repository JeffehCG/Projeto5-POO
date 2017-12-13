<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.web.QuantidadeSaidaProduto" %>
<%@page import="com.database.web.SaidaProduto" %>
<%@page import="com.database.web.ProdutoJ" %>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html>
<%  double vlt = 0 ;
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
        <title>Loja de Produtos Diversos | Good Judgment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="assets/user/css/style.css">
    </head>
    <body>
        <%-- Fazer um if para verificar qual o tipo de usuário logado e mostrar a navbar correta, além de mostrar o nome do usuário também. --%>
        <%@include file="WEB-INF/jspf/navbar-logado-admin.jspf" %>
        <%-- Usa aquele esquema que o professor ensinou com o input type="hidden", e os IDs para saber qual deletar --%>
        <%-- Não coloquei os nomes, e nem os IDs nos inputs. --%>
        <%-- Deve ser possível usar o carrinho mesmo deslogado, então usa os atributos do http session (set.Attribute) --%>
        <%-- Caso o usuário logue, todos os atributos da sessão deveram ser excluídos, e uma nova sessão para aquele usuário deve ser criada com 
        novos atributos caso ele adicione algo no carrinho, e claro, se ele deslogar, todos os atributos devem ser excluídos. É dessa forma que
        você vai alterar aquele "Olá Visitante" para o nome do usuário --%>
        <div class="container pesquisa">
            <p class="p-header">MEU CARRINHO</p>
            <table align="center" class="responsive-table">
                <tr>
                    <th>Nome</th>
                    <th>Marca</th>
                    <th>Quantidade</th>
                    <th>Preço Unitario</th>
                    <th>Remover</th>
                </tr>
                <% for(int i=0; i<QuantidadeSaidaProduto.getSaida().size();i++){ %>
                <% QuantidadeSaidaProduto ob = QuantidadeSaidaProduto.getSaida().get(i);
                   ProdutoJ a = ProdutoJ.getProdutoJ(ob.getCodigoProduto());%>
                <tr>
                    <td><%=a.getNome()%></td>
                    <td><%=a.getMarca()%></td>
                    <td>
                        <input type="text" class="browser-default input-quantidade" value="<%=ob.getQtSaida()%>">
                        <div class="botoes-plus-minus">
                            <form>
                                <button type="submit" class=" btn-quantidade-plus" name="qtd_up"><i class="material-icons">arrow_drop_up</i></button>
                                <button type="submit" class=" btn-quantidade-minus" name="qtd_down"><i class="material-icons">arrow_drop_down</i></button>
                            </form>
                        </div>
                    </td>
                    <td>R$:<%=ob.getVlVenda()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
                            <input class="btn-remover" type="submit" name="remove" value="Excluir"/>
                        </form>
                       <%-- <button class=" btn-remover" name="remove"><i class="material-icons">remove_shopping_cart</i></button> --%>
                    </td>
                </tr>
                <% vlt += ob.getQtSaida()*ob.getVlVenda();
                }
                %>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="text-align: right">Total</td>
                    <td>R$:<%=vlt%></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <form>
                            <input class="btn waves-light btn-carrinho-finalizar" type="submit" name="efetuar" value="Efetuar Compra"/>
                        </form>
                        <%--<form action="pagamento.html" method="post">
                            <button class="btn waves-effect waves-light btn-carrinho-finalizar" type="submit" name="btn-finalizar">Finalizar Compra</button>
                        </form>--%>
                    </td>
                </tr>
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
