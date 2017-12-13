<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.web.ProdutoJ" %>
<!DOCTYPE html>
    <%
        String enterParkingErrorMessage = null;
        
        try {
            if(request.getParameter("alterarB")!=null){
                int cod = Integer.parseInt(request.getParameter("cod"));
                String nom = request.getParameter("nom");
                String tip = request.getParameter("tip");
                String mar = request.getParameter("mar");
                String des = request.getParameter("des");
                double vlv = Double.parseDouble(request.getParameter("vlv"));
                int gra = Integer.parseInt(request.getParameter("gra"));
                ProdutoJ.AlterarProduto(cod, nom, tip, mar, des, vlv, gra);
                response.sendRedirect(request.getRequestURI());
                
            }
            } catch (Exception e) {
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
    
    int cont = 0 ;
    int par = 0 ;
try {
            if(request.getParameter("alterar")!=null){
                par = Integer.parseInt(request.getParameter("p"));
                cont = 1;
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
            <%if(enterParkingErrorMessage!=null){%>
            <h6 style="color: red"><%=enterParkingErrorMessage%></h6>
            <%}%>
           <table align="center" class="responsive-table">
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>Tipo</th>
                    <th>Marca</th>
                    <th>Descrição</th>
                    <th>Valor</th>
                    <th>Grada</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                    <th>-------</th>
                    <th>Estoque</th>
                    <th>Custo</th>
                    <th>Lucro</th>
        
                </tr>
            <%
                try{
                for(int i = 0 ; i<ProdutoJ.getStayList().size();i++){
                 ProdutoJ lista = ProdutoJ.getStayList().get(i);
            %>
            
                <%if(cont == 1 && par == i){%>
                    <form>
                        <tr style="color: white;background: blue">
                        <td><input type="hidden" name="cod" value="<%=lista.getCdBarra()%>" /></td>
                        <td><input type="text" name="nom" value="<%=lista.getNome()%>"/></td>
                        <td><input type="text" name="tip" value="<%=lista.getTipo()%>"/></td>
                        <td><input type="text" name="mar" value="<%=lista.getMarca()%>"/></td>
                        <td><input type="text" name="des" value="<%=lista.getDesc()%>"/></td>
                        <td><input type="text" name="vlv" value="<%=lista.getVlVenda()%>"/></td>
                        <td><input type="text" name="gra" value="<%=lista.getCdGrade()%>"/></td>
                        <td>
                            <input type="hidden" name="p" value="<%=i%>" />
                            <input class="btn waves-light btn-cart" type="submit" name="alterarB" value="Alterar"/>
                        </td>
                        <td>-------</td>
                        <td>-------</td>
                        <td><input type="text" name="est" value="<%=lista.getQtEstoque()%>" disabled=""/></td>
                        <td><input type="text" name="vlc" value="<%=lista.getVlCusto()%>" disabled=""/></td>
                        <td>-------</td>
                        </tr>
                    </form>           
            <%}if(cont != 1){%>
                <tr>
                    <td><%=lista.getCdBarra()%></td>
                    <td><%=lista.getNome()%></td>
                    <td><%=lista.getTipo()%></td>
                    <td><%=lista.getMarca()%></td>
                    <td><%=lista.getDesc()%></td>
                    <td><%=lista.getVlVenda()%></td>
                    <td><%=lista.getCdGrade()%></td>   
                <form>
                        <td>
                            <input type="hidden" name="p" value="<%=i%>" />
                            <input class="btn waves-light btn-cart" type="submit" name="alterar" value="Alterar"/>
                        </td><td>
                            <input class="btn waves-light btn-cart" type="submit" name="excluir" value="Excluir"
                        </td>
                </form>
                <td>-------</td>
                <td><%=lista.getQtEstoque()%></td>
                <td><%=lista.getVlCusto()%></td>
                <td><%=(lista.getVlVenda()/lista.getVlCusto())*100%></td>
                    <%--<td style="text-align: center"><button type="submit" class="btn waves-effect waves-light btn-cart"><i class="material-icons">add_shopping_cart</i></button></td>--%>
                </tr>
                <%}}}catch(Exception e){
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

