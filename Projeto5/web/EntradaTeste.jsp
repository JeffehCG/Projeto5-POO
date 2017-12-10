<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.database.web.QuantidadeEntradaProduto"%>
<%@page import="com.database.web.EntradaProduto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    int cpf = Integer.parseInt((String)session.getAttribute("me.id"));
    String enterParkingErrorMessage = null;
    try{
        if(request.getParameter("inserir")!= null){
            int cod = Integer.parseInt(request.getParameter("txt_cd_produto"));
            int qt = Integer.parseInt(request.getParameter("txt_qt_produto"));
            double vl = Double.parseDouble(request.getParameter("txt_valor_custo"));
            QuantidadeEntradaProduto.setEntradaProdutos(cod,qt,vl);
            
        }
     
      }catch(Exception e){
            enterParkingErrorMessage = e.getMessage();
      
        }
        
    try {
            if(request.getParameter("gravar")!=null) {
                Timestamp time = EntradaProduto.InserirEntradaProduto(cpf);
                for(int c=0; c<QuantidadeEntradaProduto.getEntrada().size();c++){ 
                QuantidadeEntradaProduto a = QuantidadeEntradaProduto.getEntrada().get(c);
                    QuantidadeEntradaProduto.EntradaProduto(cpf, time, a.getCodigoProduto(),a.getQtEntrada(),a.getVlCusto());
                }
                QuantidadeEntradaProduto.getEntrada().clear();
            }
        } catch (Exception e) {
            enterParkingErrorMessage = e.getMessage();
        }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Entrada</h1>
        <form>
            <input type="text" name="txt_cd_produto" /><br>
            <input type="text" name="txt_qt_produto" /><br>
            <input type="text" name="txt_valor_custo" /><br>
            <input type="submit" name="inserir" value="Entrada" /><br><br><br><br>
            <input type="submit" name="gravar" value="Gravar Entrada"/>
        </form>
        <h1 style="color: red"><%=enterParkingErrorMessage%></h1>
        
                    <table >
                <tr>
                    <th>Codigo</th>
                    <th>Quantidade </th>
                    <th>Valor </th>
                </tr>
                                                
                <% for(int i=0; i<QuantidadeEntradaProduto.getEntrada().size();i++){ %>
                <% QuantidadeEntradaProduto o = QuantidadeEntradaProduto.getEntrada().get(i);%>
                <tr>
                    <td><%=o.getCodigoProduto()%></td>
                    <td><%=o.getQtEntrada()%></td>
                    <td><%=o.getVlCusto()%></td>
                    
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
                            <input class="btn btn-inverse" type="submit" name="remove" value="Excluir"/>
                            <input class="btn btn-inverse" type="submit" name="alterar" value="Alterar"/>
                            
                        </form>
                    </td>
                </tr>
                <%}%>                 
            </table> 
        
    </body>
</html>
