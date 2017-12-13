<%@page import="com.database.web.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.web.DatabaseCreatorListener"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%

     String enterParkingErrorMessage = null;

        if (request.getParameter("btn_cadastrar") != null) {
           Float cnpj = Float.parseFloat(request.getParameter("txt_cnpj"));            
           String razao = (request.getParameter("txt_razao"));            
           try{
               Fornecedor.inserirFornecedor(cnpj,razao);
             //  response.sendRedirect(request.getRequestURI());
%>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
    alert("Fornecedor Cadastrado!");
</SCRIPT>
<%
       
        
}catch (Exception e) {
        enterParkingErrorMessage = e.getMessage();
    }
}
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Fornecedores | Good Judgment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="assets/materialize/css/materialize.min.css">
        <link rel="stylesheet" href="assets/user/css/style.css">
    </head>
    <body>
        <%-- Fazer um if para verificar qual o tipo de usuário logado e mostrar a navbar correta, além de mostrar o nome do usuário também. --%>
        <%@include file="WEB-INF/jspf/navbar-logado-admin.jspf" %>
        <div class="container">
            <div class="header-novo-cadastro">
                <p>CADASTRO DE FORNECEDOR</p>
                <span>Forneça as informações sobre o fornecedor abaixo.</span>
            </div>
            <div class="row">
                <form>
                    <fieldset class="col fieldset-g">
                        <div class="row">
                            <div class="col s12"><span>*Campos Obrigatórios.</span></div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                                <p>*Razão Social:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_razao" required />
                            </div>
                            <div class="input-field col s4">
                                <p>*CNPJ:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_cnpj" required />
                            </div>
                        </div>
                        <input class="btn waves-effect waves-light btn-carrinho-finalizar" type="submit" name="btn_cadastrar" value="Cadastrar"/>
                    </fieldset>
                </form>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript" src="assets/user/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="assets/user/js/user.js"></script>
    </body>
</html>


