<%@page import="com.database.web.ProdutoJ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String enterParkingErrorMessage = null;
    //Grava produto no banco
    if(request.getParameter("enter-parking")!= null){
        int codigo = Integer.parseInt(request.getParameter("txt_codigo_barras" ));
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
    //Session Fornecedor
            if(request.getParameter("entrada")!=null){
                if (request.getParameter("txt_cnpj")!=null){
                 session.setAttribute("me.id",request.getParameter("txt_cnpj"));}
                response.sendRedirect("EntradaTeste.jsp");
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
        <div class="container">
            <div class="header-novo-cadastro">
                <p>CADASTRO DE PRODUTOS</p>
                <span>Forneça as informações sobre o produto abaixo. As informações poderam ser alteradas, ou apagadas posteriormente.</span>
            </div>
            <div class="row">
                <form>
                    <fieldset class="col fieldset-g prod">
                        <div class="row">
                            <div class="col s12"><span>*Campos Obrigatórios.</span></div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                                <p>*Nome:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_nome" required/>
                            </div>
                            <div class="input-field col s4">
                                <p>*Marca:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_marca"required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s5">
                                <p>*Classificação Fiscal:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_class_fiscal" required/>
                            </div>
                            <div class="input-field col s2">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s9">
                                <p>*Descrição:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_descricao" required/>
                            </div>
                            <div class="col s3">
                                <p>*Categoria:</p>
                                <select class="browser-default select-medium" name="txt_tipo" required style="width: 150px;">
                                    <option value="" disabled selected>Selecione</option>
                                    <option value="1">Tecnologia</option>
                                    <option value="2">Vestuário</option>
                                    <option value="4">Comestível</option>
                                    <option value="5">Higiênico</option>
                                    <option value="6">Outros</option>
                                </select>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="col fieldset-p prod">
                        <div class="row">
                            <div class="col s12"><span>*Campos Obrigatórios.</span></div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                                <p>Valor de Venda:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_vl_venda" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <p>*Código de Barras:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_codigo_barras" required/>
                            </div>
                        </div>
                        <br>
                        <br>
                        <input class="btn waves-effect waves-light btn-carrinho-finalizar" type="submit" name="enter-parking" value="Cadastrar"/>
                    </fieldset>
                </form>
            </div>
            <%--<button class="btn waves-effect waves-light btn-carrinho-finalizar" type="submit" name="btn_cadastrar">Cadastrar</button>--%>
        </div>
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript" src="assets/user/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="assets/user/js/user.js"></script>
    </body>
</html>
