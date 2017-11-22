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
            <form>
                <div class="row">
                    <div class="input-field col s9">
                        <input style="margin-left: 40px;" placeholder="Digite o nome do produto a ser procurado" type="text" class="input-pesquisa" name="txt_pesquisa">
                    </div>
                    <div class="col s1">
                    </div>
                    <div class="col s2">
                        <button class="btn waves-effect waves-light btn-pesquisa" type="submit" name="btn_pesquisar">Pesquisar</button>
                    </div>
                </div>
            </form>
            <%-- Usa aquele esquema que o professor ensinou com o input type="hidden", e os IDs para saber qual deletar e qual alterar. 
            <%-- Não coloquei os nomes, e nem os IDs nos inputs. --%>
            <table align="center" class="responsive-table table-produto">
                <tr>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Quantidade</th>
                    <th>Custo</th>
                    <th>Venda</th>
                    <th>Lucro (%)</th>
                    <th>Modificar</th>
                </tr>
                <tr>
                    <td>Produto 1</td>
                    <td>Descrição do produto 1</td>
                    <td><input type="text" class="browser-default input-quantidade-p" value="3"></td>
                    <td><input type="text" class="browser-default input-quantidade-p" value="50,00"></td>
                    <td><input type="text" class="browser-default input-quantidade-p" value="55,00"></td>
                    <td>10%</td>
                    <td style="text-align: center">
                        <button type="submit" class="btn waves-effect waves-light btn-cart" name="btn_alterar"><i class="material-icons">create</i></button>
                        <button type="submit" class="btn waves-effect waves-light btn-cart" name="btn_excluir"><i class="material-icons">delete</i></button>
                    </td>
                </tr>
                <tr>
                    <td>Produto 2</td>
                    <td>Descrição do produto 2</td>
                    <td><input type="text" class="browser-default input-quantidade-p" value="9"></td>
                    <td><input type="text" class="browser-default input-quantidade-p" value="60,00"></td>
                    <td><input type="text" class="browser-default input-quantidade-p" value="72,00"></td>
                    <td>20%</td>
                    <td style="text-align: center">
                        <button type="submit" class="btn waves-effect waves-light btn-cart" name="btn_alterar"><i class="material-icons">create</i></button>
                        <button type="submit" class="btn waves-effect waves-light btn-cart" name="btn_excluir"><i class="material-icons">delete</i></button>
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

