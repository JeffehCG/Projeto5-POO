<%-- 
    Document   : newjsp
    Created on : 29/11/2017, 19:12:03
    Author     : User
--%>

<%@page import="com.database.web.ProdutoJ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String enterParkingErrorMessage = null;
    if(request.getParameter("enter-parking")!= null){
        int codigo = Integer.parseInt(request.getParameter("txt_codigo_barras"));
        String nome = request.getParameter("txt_nome");
        String tipo = request.getParameter("txt_tipo");
        String marca = request.getParameter("txt_marca");
        String ds = request.getParameter("txt_descricao");
        double valor = Double.parseDouble(request.getParameter("txt_vl_venda"));
        int grade = Integer.parseInt(request.getParameter("txt_class_fiscal"));
        try{
            ProdutoJ.inserirProduto(codigo,nome,tipo,marca,ds,valor,grade);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            enterParkingErrorMessage = e.getMessage();
      
        }
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                    <form>
                codigo: <input type="text" name="txt_codigo_barras"/>
                nome: <input type="text" name="txt_nome"/>
                tipo: <input type="text" name="txt_tipo"/>
                marca: <input type="text" name="txt_marca"/>
                ds: <input type="text" name="txt_descricao"/>
                valor: <input type="text" name="txt_vl_venda"/>
                grade: <input type="text" name="txt_class_fiscal"/>
                <input type="submit" name="enter-parking" value="Registrar"/>
            </form>
        1>
    </body>
</html>
