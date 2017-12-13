<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.web.QuantidadeSaidaProduto"%>
<%@page import="com.database.web.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    
    session = request.getSession(false);
    if(request.getParameter("btn_entrar")!= null){
        
        String email = request.getParameter("txt_email");
        String senha = request.getParameter("txt_senha");
        
        Connection con = null;
        PreparedStatement ps;
        ResultSet rs;
        String query;
                
        try
        {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        }catch(Exception e)
        {
            System.out.println(e);
        }
        
        try
        {
            
            con = DriverManager.getConnection("jdbc:derby:c:/derby/CompraOnline","root","");
            query = "SELECT * FROM cliente WHERE nm_email=? AND cd_senha=?";
            ps = con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2,senha);
            rs = ps.executeQuery();
                    
            if(rs.next())
            {
                //Login successful!
                //Creating Session...
                session = request.getSession();
                session.setAttribute("userEmail", email);
                
            }
            else
            {
                out.println("Email ou senha inválidos!!!! ");                        
            }
                    
        }catch(SQLException e)
        {
            System.out.println(e);
        }
        
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
        <%-- Pra deslogar, você pode fazer um servlet para fechar as conexões, e excluir os atributos. Mas da pra fazer de outras formas. --%>
        <div class="container">
            <div class="container-login">
                <%-- Esse negócio de logar com Facebook foi mais pra enfeitar, vi num site assim e achei bonito e coloquei. Mas não precisa
                fazer se não der. --%>
                <div class="login-facebook">
                    <div>
                        <p>ACESSE SUA CONTA GOOD JUDGMENT COM FACEBOOK</p>
                    </div>
                    <div class="icon-facebook"><img src="assets/user/img/facebook-login.png"></div>
                </div>
                <div class="login-ou">
                    OU
                </div>
                <div class="row">
                    <div class="col card-login">
                        <form>
                            <p>JÁ SOU CADASTRADO</p>
                            <div class="input-field">
                                <input id="icon_prefix" type="email" name="txt_email">
                                <label for="icon_prefix">Email</label>
                            </div>
                            <div class="input-field">
                                <input id="icon_prefix" type="password" name="txt_senha">
                                <label for="icon_prefix">Senha</label>
                            </div>
                            <button class="btn waves-effect waves-light login" type="submit" name="btn_entrar">Entrar</button>
                        </form>
                    </div>
                    <div class="col card-novo">
                        <%-- Coloca o email que ele digitar aqui no campo email do .jsp que abrir, pra ficar legal. --%>
                        <form method="post" action="cadastro-cliente.jsp"  name="inputpage">
                            <p>SOU UM NOVO CLIENTE</p>
                            <div class="input-field">
                                <input id="icon_prefix" type="email" name="txt_email_novo">
                                <label for="icon_prefix">Email</label>
                            </div>
                            <button class="btn waves-effect waves-light login" type="submit" >Continuar</button>
                        </form>
                    </div>
                </div>
                <hr/>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript" src="assets/user/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="assets/user/js/user.js"></script>
    </body>
</html>
