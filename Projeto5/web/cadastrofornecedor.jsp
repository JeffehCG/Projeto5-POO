<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Connection con = null;

try {
        // Load the JDBC driver  
        String driverName = "org.apache.derby.jdbc.EmbeddedDriver";
        Class.forName(driverName);
        // Create a connection to the database  ;
        String url = "jdbc:derby:c:/derby/CompraOnline;create=true";
        con = DriverManager.getConnection("jdbc:derby:c:/derby/CompraOnline;shutdown=true");

        if(request.getParameter("cadastrar")!=null){
            String cnpj = request.getParameter("cnpj");
            String razao = request.getParameter("razao");
            Statement stmt = con.createStatement();
             String insertTableSQL = "INSERT INTO fornecedor"
                     +"cd_cnpj_fornecedor,nm_razao_social_fornecedor"
                     +"VALUES(?,?)";
            PreparedStatement preparedStatement = con.prepareStatement(insertTableSQL);
            preparedStatement.setString(1, cnpj);
            preparedStatement.setString(2, razao);
            preparedStatement.executeUpdate();
            %>
            
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
    alert("Fornecedor Cadastrado !")
</SCRIPT>

<%
            stmt.close();
            preparedStatement.close();
        }


    } catch (ClassNotFoundException e) {
        out.print("Erro Driver");
    } catch (SQLException e) {
        out.print("Erro SQL");
    } catch (Exception e) {
        out.print("Erro try catch");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form>           
            <fieldset>
            <legend>
                Cadastro Fornecedor
            </legend>

                <label for="cnpj">Informe o CNPJ:</label>
                <input type="number" name="cnpj" required>
                <label for="cnpj">Informe a razão social:</label>
                <input type="text" name="razao" required>
                <input type="submit" name="cadastrar" required>
            </fieldset>
        </form>

    </body>
</html>
