<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <div class="container pesquisa">
            <p class="p-header">CONFIRA A LISTA DOS PRODUTOS EM PROMOÇÃO</p>
            <table align="center" class="responsive-table">
                <tr>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Preço Original</th>
                    <th>Preço com Desconto</th>
                    <th>Adicionar ao Carrinho</th>
                </tr>
                <tr>
                    <td>Produto 1</td>
                    <td>Descrição do produto 1</td>
                    <td style="text-decoration: line-through">R$ 70,00</td>
                    <td>R$ 56,50</td>
                    <td style="text-align: center"><button type="submit" class="btn waves-effect waves-light btn-cart"><i class="material-icons">add_shopping_cart</i></button></td>
                </tr>
                <tr>
                    <td>Produto 2</td>
                    <td>Descrição do produto 2</td>
                    <td style="text-decoration: line-through">R$ 50,00</td>
                    <td>R$ 37,00</td>
                    <td style="text-align: center"><button type="submit" class="btn waves-effect waves-light btn-cart"><i class="material-icons">add_shopping_cart</i></button></td>
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
