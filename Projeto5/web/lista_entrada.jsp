<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.web.ProdutoJ" %>
<%@page import="com.database.web.QuantidadeSaidaProduto" %>
<%@page import="com.database.web.QuantidadeEntradaProduto" %>
<%@page import="com.database.web.EntradaProduto" %>
<!DOCTYPE html>
<%
    String enterParkingErrorMessage = null;

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
        <div style="align-self: center" class="header-novo-cadastro">
                <p>LISTA DE ENTRADAS</p>
                <span>Forneça as informações sobre as entradas de mercadoria.</span>
            </div>
        <div class="container pesquisa">
            <form>
                <div class="row">
                    <div class="col s1"></div>
                    <div class="input-field col s9">
                        <input placeholder="" type="text" class="input-pesquisa" name="txt_pesquisa">
                    </div>
                    <div class="col s2">
                        <button class="btn waves-effect waves-light btn-pesquisa" type="submit" name="btn-pesquisar">Pesquisar</button>
                    </div>
                </div>
            </form>
                <%if(enterParkingErrorMessage!=null){%>
                     <h6 style="color: red"><%=enterParkingErrorMessage%></h6>
                <%}%>
            <table align="center" class="responsive-table">
                <tr>
                <th>Cnpj</th>
                <th>Data</th>
                <th>Valo Total</th>
                <th></th>
                </tr>
            <%
                try{
                for(int i = 0 ; i<EntradaProduto.getStayList().size();i++){
                 EntradaProduto lista = EntradaProduto.getStayList().get(i);
            %>
                <tr>
                    <td><%=lista.getCnpj()%></td>
                    <td><%=lista.getDataEntrada()%></td>
                    <td>R$:<%=lista.getVlTotal()%></td>
                    <td>
                <form>
                            <input type="hidden" name="i" value="<%=i%>" />
                            <input class="btn waves-light btn-cart" type="submit" name="exibir" value="Exibir Produtos"/>
                            
                        </td>
                </form>
                    <%--<td style="text-align: center"><button type="submit" class="btn waves-effect waves-light btn-cart"><i class="material-icons">add_shopping_cart</i></button></td>--%>
                </tr>
                <%}}catch(Exception e){
                enterParkingErrorMessage = e.getMessage();
}%>
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
