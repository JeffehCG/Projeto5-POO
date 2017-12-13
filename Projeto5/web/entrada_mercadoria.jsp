<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.database.web.ProdutoJ" %>
<%@page import="com.database.web.EntradaProduto" %>
<%@page import="com.database.web.QuantidadeSaidaProduto" %>
<%@page import="com.database.web.QuantidadeEntradaProduto" %>
<!DOCTYPE html>
<%  double vlt = 0;           
    if(session.getAttribute("me.id")==null){
        response.sendRedirect(request.getContextPath());
    }
    
    int cnpj = Integer.parseInt((String)session.getAttribute("me.id")); // pega valor do cnpj na session
    String enterParkingErrorMessage = null;
    //Grava Item no array 
    try{
        if(request.getParameter("inserir")!= null){
            int cod = Integer.parseInt(request.getParameter("txt_cd_produto"));
            int qt = Integer.parseInt(request.getParameter("txt_qt_produto"));
            double vl = Double.parseDouble(request.getParameter("txt_valor_custo"));
            ProdutoJ pj = ProdutoJ.getProdutoJ(cod); // Verificar se produto esta cadastrado 
            if(pj!=null){
            QuantidadeEntradaProduto.setEntradaProdutos(cod,qt,vl);}
            else{
                enterParkingErrorMessage = "Produto não cadastrado";
            }
            
        }
     
      }catch(Exception e){
            enterParkingErrorMessage = e.getMessage();
      
        }
    
    // Exclui item selecionado do array
    try {
            if(request.getParameter("remove")!=null){
                int i = Integer.parseInt(request.getParameter("i"));
                QuantidadeEntradaProduto.getEntrada().remove(i);
            }
        } catch (Exception e) {
        }
        
    //Grava itens do array no banco
    try {
            if(request.getParameter("gravar")!=null) {
                Timestamp time = EntradaProduto.InserirEntradaProduto(cnpj);
                double vlTotal = 0;
                for(int c=0; c<QuantidadeEntradaProduto.getEntrada().size();c++){ 
                QuantidadeEntradaProduto a = QuantidadeEntradaProduto.getEntrada().get(c);
                    QuantidadeEntradaProduto.EntradaProduto(cnpj, time, a.getCodigoProduto(),a.getQtEntrada(),a.getVlCusto());
                    vlTotal += QuantidadeEntradaProduto.VlTotalCusto(a.getQtEntrada(),a.getVlCusto());
                    ProdutoJ.inserirCustoEEstoque(a.getCodigoProduto(), a.getVlCusto(), a.getQtEntrada());
                }
                QuantidadeEntradaProduto.getEntrada().clear();
                EntradaProduto.InserirVlTotal(vlTotal, cnpj, time);
                
                session.setAttribute("me.id",request.getParameter("txt_cnpj"));
                response.sendRedirect("alterar-produto.jsp");
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

<div class="header-novo-cadastro">
                <p>ENTRADA DE MERCADORIA</p>
                <span>Forneça as informações sobre o produto abaixo. As informações poderam ser alteradas, ou apagadas posteriormente.</span>
            </div>
            <div class="row">
                <%if(enterParkingErrorMessage!=null){%>
                     <h6 style="color: red"><%=enterParkingErrorMessage%></h6>
                <%}%>
                <form>
                    <fieldset class="col prod">
                        <div class="row">
                            <div class="input-field col s4">
                                <p>*Codigo Barras:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_cd_produto" required/>
                            </div>

                        </div>
                        <div class="row">
                            <div class="input-field col s5">
                                <p>*Quantidade :</p>
                                <input class="input-novo-cadastro" type="text" name="txt_qt_produto" required/>
                            </div>
                            <div class="input-field col s2">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s9">
                                <p>*Valor Unitario:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_valor_custo" required/>
                            </div>
                        </div>
                        <input class="btn waves-effect waves-light btn-carrinho-finalizar" type="submit" name="inserir" value="Inserir"/>
                    </fieldset>
                </form>
            <table align="center" class="responsive-table">
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>Marca</th>
                    <th>Quantidade </th>
                    <th>Valor Unitario </th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            
                <%try{%>
                <% for(int i=0; i<QuantidadeEntradaProduto.getEntrada().size();i++){ %>
                <% QuantidadeEntradaProduto o = QuantidadeEntradaProduto.getEntrada().get(i);
                   ProdutoJ a = ProdutoJ.getProdutoJ(o.getCodigoProduto());%>
                   
                <tr>
                    <td><%=o.getCodigoProduto()%></td>
                    <td><%=a.getNome()%>></td>
                    <td><%=a.getMarca()%></td>
                    <td><%=o.getQtEntrada()%></td>
                    <td>R$:<%=o.getVlCusto()%></td>
                <form>
                        <td>
                            <input type="hidden" name="i" value="<%=i%>" />
                            <input class="btn waves-light btn-cart" type="submit" name="alterar" value="Alterar"/></td><td>
                            <input class="btn waves-light btn-cart" type="submit" name="remove" value="Excluir"/>
                            
                        </td>
                </form>
                    <%--<td style="text-align: center"><button type="submit" class="btn waves-effect waves-light btn-cart"><i class="material-icons">add_shopping_cart</i></button></td>--%>
                </tr>
                <% vlt += o.getQtEntrada() * o.getVlCusto(); %>
                
                <%}}catch(Exception e){
                enterParkingErrorMessage = e.getMessage();
}%>

                                <tr>
                    <td></td>
                    <td></td>
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
                    <td></td>
                    <td>
                                            <td>
                        <form>
                            <input class="btn waves-light btn-carrinho-finalizar" type="submit" name="gravar" value="Gravar Entrada"/>
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
