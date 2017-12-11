<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.database.web.QuantidadeEntradaProduto"%>
<%@page import="com.database.web.EntradaProduto" %>
<%@page import="com.database.web.ProdutoJ" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  
    int cnpj = Integer.parseInt((String)session.getAttribute("me.id")); // pega valor do cnpj na session
    String enterParkingErrorMessage = null;
    //Grava Item no array 
    try{
        if(request.getParameter("inserir")!= null){
            int cod = Integer.parseInt(request.getParameter("txt_cd_produto"));
            int qt = Integer.parseInt(request.getParameter("txt_qt_produto"));
            double vl = Double.parseDouble(request.getParameter("txt_valor_custo"));
            ProdutoJ pj = ProdutoJ.getProdutoJ(cod); // Verificar se produto esta cadastrado 
            if(pj!=null){
            QuantidadeEntradaProduto.setEntradaProdutos(cod,qt,vl);}
            else{
                enterParkingErrorMessage = "Produto não cadastrado";
            }
            
        }
     
      }catch(Exception e){
            enterParkingErrorMessage = e.getMessage();
      
        }
    
    // Exclui item selecionado do array
    try {
            if(request.getParameter("remove")!=null){
                int i = Integer.parseInt(request.getParameter("i"));
                QuantidadeEntradaProduto.getEntrada().remove(i);
            }
        } catch (Exception e) {
        }
        
    //Grava itens do array no banco
    try {
            if(request.getParameter("gravar")!=null) {
                Timestamp time = EntradaProduto.InserirEntradaProduto(cnpj);
                double vlTotal = 0;
                for(int c=0; c<QuantidadeEntradaProduto.getEntrada().size();c++){ 
                QuantidadeEntradaProduto a = QuantidadeEntradaProduto.getEntrada().get(c);
                    QuantidadeEntradaProduto.EntradaProduto(cnpj, time, a.getCodigoProduto(),a.getQtEntrada(),a.getVlCusto());
                    vlTotal += QuantidadeEntradaProduto.VlTotalCusto(a.getQtEntrada(),a.getVlCusto());
                    ProdutoJ.inserirCustoEEstoque(a.getCodigoProduto(), a.getVlCusto(), a.getQtEntrada());
                }
                QuantidadeEntradaProduto.getEntrada().clear();
                EntradaProduto.InserirVlTotal(vlTotal, cnpj, time);
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
            Codigo de Barras <input type="text" name="txt_cd_produto" /><br>
            Quantidade de entrada<input type="text" name="txt_qt_produto" /><br>
            Valor Unitario<input type="text" name="txt_valor_custo" /><br>
            <input type="submit" name="inserir" value="Entrada" /><br><br><br><br>
            <input type="submit" name="gravar" value="Gravar Entrada"/>
        </form>
        <h1 style="color: red"><%=enterParkingErrorMessage%></h1>
        
                    <table >
                <tr>
                    <th>Codigo</th>
                    <th>Quantidade </th>
                    <th>Valor Unitario </th>
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
                            <input type="submit" name="remove" value="Excluir"/>
                            <input type="submit" name="alterar" value="Alterar"/>
                            
                        </form>
                    </td>
                </tr>
                <%}%>                 
            </table> 
        
    </body>
</html>
