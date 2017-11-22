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
                    <th>Descrição</th>
                    <th>Quantidade</th>
                    <th>Preço</th>
                    <th>Remover</th>
                </tr>
                <tr>
                    <td>Produto 1</td>
                    <td>Descrição do produto 1</td>
                    <td>
                        <input type="text" class="browser-default input-quantidade" value="1">
                        <div class="botoes-plus-minus">
                            <form>
                                <button type="submit" class="waves-effect btn-quantidade-plus" name="qtd_up"><i class="material-icons">arrow_drop_up</i></button>
                                <button type="submit" class="waves-effect btn-quantidade-minus" name="qtd_down"><i class="material-icons">arrow_drop_down</i></button>
                            </form>
                        </div>
                    </td>
                    <td>R$ 56,50</td>
                    <td>
                        <form><button type="submit" class="waves-effect btn-remover"><i class="material-icons">remove_shopping_cart</i></button></form>
                    </td>
                </tr>
                <tr>
                    <td>Produto 2</td>
                    <td>Descrição do produto 2</td>
                    <td>
                        <input type="text" class="browser-default input-quantidade" value="1">
                        <div class="botoes-plus-minus">
                            <form>
                                <button type="submit" class="waves-effect btn-quantidade-plus"><i class="material-icons">arrow_drop_up</i></button>
                                <button type="submit" class="waves-effect btn-quantidade-minus"><i class="material-icons">arrow_drop_down</i></button>
                            </form>
                        </div>
                    </td>
                    <td>R$ 56,50</td>
                    <td>
                        <form><button type="submit" class="waves-effect btn-remover"><i class="material-icons">remove_shopping_cart</i></button></form>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="text-align: right">Total</td>
                    <td>R$ 3000,00</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <form action="pagamento.html" method="post">
                            <button class="btn waves-effect waves-light btn-carrinho-finalizar" type="submit" name="btn-finalizar">Finalizar Compra</button>
                        </form>
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
