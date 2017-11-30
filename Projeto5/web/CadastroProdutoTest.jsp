<%-- 
    Document   : newjsp
    Created on : 29/11/2017, 19:12:03
    Author     : User
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="com.database.web.ProdutoJ"%>
<%@page import="com.database.web.EntradaProduto" %>
<%@page import="com.database.web.QuantidadeEntradaProduto" %>
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
        
              
            
            if(request.getParameter("Entrada")!= null){
                int cnpj = Integer.parseInt(request.getParameter("txt_cnpj"));
                Timestamp dtr = EntradaProduto.InserirEntradaProduto(cnpj);
             
       } 
            
    if(request.getParameter("GravarEntrada")!=null){
        int cnpj = Integer.parseInt(request.getParameter("txt_cnpj"));
        Timestamp time = dtr;
        int codigoProd = Integer.parseInt(request.getParameter("txt_cd_produto"));
        int quantidade = Integer.parseInt(request.getParameter("txt_qt_produto"));
        double valorCust = Double.parseDouble(request.getParameter("txt_valor_custo"));
        try {
                QuantidadeEntradaProduto.EntradaProduto(cnpj, time, cdProduto, quantidade, valor);
            } catch (Exception e) {
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
                        codigo: <input type="text" name="txt_codigo_barras"/><br>
                nome: <input type="text" name="txt_nome"/><br>
                tipo: <input type="text" name="txt_tipo"/><br>
                marca: <input type="text" name="txt_marca"/><br>
                ds: <input type="text" name="txt_descricao"/><br>
                valor: <input type="text" name="txt_vl_venda"/><br>
                grade: <input type="text" name="txt_class_fiscal"/><br>
                <input type="submit" name="enter-parking" value="Registrar"/><br>
            </form>
        
        <br>
        <br>
        <br>
        
        <form>
            CNPJ: <input type="text" name="txt_cnpj" /><br>
            <input type="submit" name="entrada" value="Entrada de Mercadoria"><br><br>
        </form>
        
        <%
            
            if(request.getParameter("Entrada")!= null){
                int cnpj = Integer.parseInt(request.getParameter("txt_cnpj"));
                Timestamp dtr = EntradaProduto.InserirEntradaProduto(cnpj);
                
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
