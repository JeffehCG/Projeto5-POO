<%@page import="com.database.web.fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.web.DatabaseCreatorListener"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%
    Connection con = null;

    try {
        // Load the JDBC driver  
        String driverName = "org.apache.derby.jdbc.EmbeddedDriver";
        Class.forName(driverName);
        // Create a connection to the database  ;
        String url = "jdbc:derby:c:/derby/CompraOnline;create=true";
        con = DriverManager.getConnection("jdbc:derby:c:/derby/CompraOnline;shutdown=true");

        if (request.getParameter("cadastrar") != null) {
           int cnpj = Integer.parseInt(request.getParameter("cnpj"));            
           fornecedor o = new fornecedor(cnpj,request.getParameter("razao"));
           o.insereFornecedor();
%>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
    alert("Fornecedor Cadastrado !")
</SCRIPT>
<%
       
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
                                <p>*Nome Fantasia:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_fantasia" required />
                            </div>
                            <div class="input-field col s4">
                                <p>*CNPJ:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_cnpj" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s5">
                                <p>*Inscrição Estadual:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_ins_estadual" required />
                            </div>
                            <div class="input-field col s5">
                                <p>Inscrição Municipal:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_ins_municipal" />
                            </div>
                            <div class="input-field col s2">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s7">
                                <p>*Endereço:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_endereco" required />
                            </div>
                            <div class="input-field col s2">
                                <p>*Número:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_numero" required />
                            </div>
                            <div class="input-field col s3">
                                <p>Complemento:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_complemento" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                                <p>*Bairro:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_bairro" required />
                            </div>
                            <div class="input-field col s5">
                                <p>*Cidade:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_cidade" required />
                            </div>
                            <div class="col s3">
                                <p>*Estado:</p>
                                <select class="browser-default select-medium" name="cb_estado" required>
                                    <option value="" disabled selected>Selecione</option>
                                    <option value="1">Acre</option>
                                    <option value="2">Alagoas</option>
                                    <option value="4">Amapá</option>
                                    <option value="5">Amazonas</option>
                                    <option value="6">Bahia</option>
                                    <option value="7">Ceará</option>
                                    <option value="8">Destrito Federal</option>
                                    <option value="9">Espírito Santo</option>
                                    <option value="10">Goiás</option>
                                    <option value="11">Maranhão</option>
                                    <option value="12">Mato Grosso</option>
                                    <option value="13">Mato Grosso do Sul</option>
                                    <option value="14">Minas Gerais</option>
                                    <option value="15">Pará</option>
                                    <option value="16">Paraíba</option>
                                    <option value="17">Paraná</option>
                                    <option value="18">Pernambuco</option>
                                    <option value="19">Piauí</option>
                                    <option value="20">Rio de Janeiro</option>
                                    <option value="21">Rio Grande do Norte</option>
                                    <option value="22">Rio Grande do Sul</option>
                                    <option value="23">Rondônia</option>
                                    <option value="24">Roraima</option>
                                    <option value="25">Santa Catarina</option>
                                    <option value="27">Sergipe</option>
                                    <option value="28">Tocantins</option>
                                </select>
                            </div>
                        </div>
                    </fieldset>
                </form>
                <form>
                    <fieldset class="col fieldset-p">
                        <div class="row">
                            <div class="col s12"><span>*Campos Obrigatórios.</span></div>
                        </div>
                        <div class="row">
                            <div class="input-field col s8">
                                <p>*Email:</p>
                                <input type="email" class="input-novo-cadastro" name="txt_email" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <div class="row">
                                    <p style="margin-left: 10px">*Telefone Primário:</p>
                                    <div class="input-field col s3">
                                        <input type="text" class="input-novo-cadastro" name="txt_tel_primario_ddd" required />
                                    </div>
                                    <div class="input-field col s9">
                                        <input type="text" class="input-novo-cadastro" name="txt_tel_primario" required />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <div class="row">
                                    <p style="margin-left: 10px">Telefone Secundário:</p>
                                    <div class="input-field col s3">
                                        <input type="text" class="input-novo-cadastro" name="txt_tel_secundario_ddd" />
                                    </div>
                                    <div class="input-field col s9">
                                        <input type="text" class="input-novo-cadastro" name="txt_tel_secundario" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <p>Produtos Fornecidos:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_produto" />
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <button class="btn waves-effect waves-light btn-carrinho-finalizar" type="submit" name="btn_cadastrar">Cadastrar</button>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript" src="assets/user/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="assets/user/js/user.js"></script>
    </body>
</html>


