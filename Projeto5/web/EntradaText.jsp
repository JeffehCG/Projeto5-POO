<%-- 
    Document   : EntradaText
    Created on : 30/11/2017, 17:53:49
    Author     : User
--%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.database.web.EntradaProduto" %>
<%@page import="com.database.web.QuantidadeEntradaProduto" %>
<%@page import="com.database.web.DateEntrada" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

        DateEntrada dtr = new DateEntrada();
        if(request.getParameter("GravarEntrada")!=null){
        int cnpj = Integer.parseInt(request.getParameter("txt_cnpj"));
        Timestamp time = dtr.getData();
        int codigoProd = Integer.parseInt(request.getParameter("txt_cd_produto"));
        int quantidade = Integer.parseInt(request.getParameter("txt_qt_produto"));
        double valorCust = Double.parseDouble(request.getParameter("txt_valor_custo"));
        try {
                QuantidadeEntradaProduto.EntradaProduto(cnpj, time, codigoProd, quantidade, valorCust);
            } catch (Exception e) {
      

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
         <%
           
            if(request.getParameter("Entrada")!= null){
                cnpj = Integer.parseInt(request.getParameter("txt_cnpj"));
                EntradaProduto.InserirEntradaProduto(cnpj,dtr.getData());
                
        %><form>
            Codigo :<input type="text" name="txt_cd_produto" /><br>
            Quantidade: <input type="text" name="txt_qt_produto"/><br>
            Valor :<input type="text" name="txt_valor_custo" /><br>
            <input type="submit" name="GravarEntrada" value="Grava Entrada"/>
            
</form><%
            }
            %>
        
    </body>
</html>
