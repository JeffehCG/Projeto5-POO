<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.database.web.Database"%>
<%@page import="com.database.web.Database"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<%@page import="com.database.web.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String enterRegisterUserErroMessage = null;//Ira salvar uma possivel mensagem de erro
    
    if(request.getParameter("btn_cadastrar")!= null){//Ao botão cadastrar ser pressionado, passa os parâmetros para registrar um novo cliente
        
        
           
        
        
        String cpf = request.getParameter("txt_cpf");
        String nome = request.getParameter("txt_nome");
        String senha = request.getParameter("txt_senha");
        String email = request.getParameter("txt_email");
        String sexo = request.getParameter("rb_sexo");

        //Forma de converter o valor de do calendario de string para date
        String nascimento = (request.getParameter("cb_mes")+"/"+request.getParameter("cb_dia")+"/"+request.getParameter("cb_ano"));
              
        
        
        String cidade = request.getParameter("txt_cidade");        
        String bairro = request.getParameter("txt_bairro");        
        String endereco = request.getParameter("txt_endereco");
        int numeroendereco = Integer.parseInt(request.getParameter("txt_numero"));
        String complemento = request.getParameter("txt_complemento");
        String estado = request.getParameter("txt_estado");        
        int telefonePrimario = Integer.parseInt(request.getParameter("txt_telefonePrimario"));
        int telefoneSecundario = Integer.parseInt(request.getParameter("txt_telefoneSecundario"));
        
        try{
            System.out.println("valor da data "+nascimento);
            User.inserirUser(cpf, nome, senha, email, sexo, nascimento, cidade, bairro, endereco, numeroendereco, complemento, estado, telefonePrimario, telefoneSecundario);
            session = request.getSession();
            session.setAttribute("userEmail", email);
            response.sendRedirect("home.jsp");
        
    
        }catch(Exception e){
            enterRegisterUserErroMessage = e.getMessage();      
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
        <div class="container">
            <div class="header-novo-cadastro">
                <p>PARA FAZER PARTE DA GOOD JUDGMENT, CADASTRE ALGUMAS INFORMAÇÕES SOBRE VOCÊ.</p>
                <span>Seus dados são os mesmos para todas as lojas Good Judgment. Sua compra ficou muito mais fácil e rápida.</span>
            </div>
            <div class="row">
                <form>
                    <fieldset class="col fieldset-g">
                        <div class="row">
                            <div class="col s12"><span>*Campos Obrigatórios.</span></div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <p>*Seu Nome:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_nome" required/>
                            </div>
                            <div class="input-field col s6">
                                <p>*CPF:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_cpf" required/>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom:10px;">
                            <div class="col s5 radio-pos">
                                <p>*Sexo:</p>
                                <input type="radio" class="with-gap input-novo-cadastro" name="rb_sexo" value="M" id="masc" required><label for="masc" class="radio-label">Masculino</label>
                                <input type="radio" class="with-gap input-novo-cadastro" name="rb_sexo" value="F" id="fem" required><label for="fem" class="radio-label">Feminino</label>
                            </div>
                            <div class="col s7">
                                <p>*Data de Nascimento:</p>
                                <div class="row">
                                    <select class="browser-default select-small col s3" name="cb_dia" required>
                                        <option value="" disabled selected>Dia</option>
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                    <select class="browser-default select-small col s3" name="cb_mes" required>
                                        <option value="" disabled selected>Mês</option>
                                        <option value="01">Jan</option>
                                        <option value="02">Fev</option>
                                        <option value="03">Mar</option>
                                        <option value="04">Abr</option>
                                        <option value="05">Mai</option>
                                        <option value="06">Jun</option>
                                        <option value="07">Jul</option>
                                        <option value="08">Ago</option>
                                        <option value="09">Set</option>
                                        <option value="10">Out</option>
                                        <option value="11">Nov</option>
                                        <option value="12">Dez</option>
                                    </select>
                                    <select class="browser-default select-small col s3" name="cb_ano" required>
                                        <option value="" disabled selected>Ano</option>
                                        <option value="2016">2016</option>
                                        <option value="2015">2015</option>
                                        <option value="2014">2014</option>
                                        <option value="2013">2013</option>
                                        <option value="2012">2012</option>
                                        <option value="2011">2011</option>
                                        <option value="2010">2010</option>
                                        <option value="2008">2008</option>
                                        <option value="2007">2007</option>
                                        <option value="2006">2006</option>
                                        <option value="2005">2005</option>
                                        <option value="2004">2004</option>
                                        <option value="2003">2003</option>
                                        <option value="2002">2002</option>
                                        <option value="2001">2001</option>
                                        <option value="2000">2000</option>
                                        <option value="1999">1999</option>
                                        <option value="1998">1998</option>
                                        <option value="1997">1997</option>
                                        <option value="1996">1996</option>
                                        <option value="1995">1995</option>
                                        <option value="1994">1994</option>
                                        <option value="1993">1993</option>
                                        <option value="1992">1992</option>
                                        <option value="1991">1991</option>
                                        <option value="1990">1990</option>
                                        <option value="1989">1989</option>
                                        <option value="1988">1988</option>
                                        <option value="1987">1987</option>
                                        <option value="1986">1986</option>
                                        <option value="1985">1985</option>
                                        <option value="1984">1984</option>
                                        <option value="1983">1983</option>
                                        <option value="1982">1982</option>
                                        <option value="1981">1981</option>
                                        <option value="1980">1980</option>
                                        <option value="1979">1979</option>
                                        <option value="1978">1978</option>
                                        <option value="1977">1977</option>
                                        <option value="1976">1976</option>
                                        <option value="1975">1975</option>
                                        <option value="1974">1974</option>
                                        <option value="1973">1973</option>
                                        <option value="1972">1972</option>
                                        <option value="1971">1971</option>
                                        <option value="1970">1970</option>
                                        <option value="1969">1969</option>
                                        <option value="1968">1968</option>
                                        <option value="1967">1967</option>
                                        <option value="1966">1966</option>
                                        <option value="1965">1965</option>
                                        <option value="1964">1964</option>
                                        <option value="1963">1963</option>
                                        <option value="1962">1962</option>
                                        <option value="1961">1961</option>
                                        <option value="1960">1960</option>
                                        <option value="1959">1959</option>
                                        <option value="1958">1958</option>
                                        <option value="1957">1957</option>
                                        <option value="1956">1956</option>
                                        <option value="1955">1955</option>
                                        <option value="1954">1954</option>
                                        <option value="1953">1953</option>
                                        <option value="1952">1952</option>
                                        <option value="1951">1951</option>
                                        <option value="1950">1950</option>
                                        <option value="1949">1949</option>
                                        <option value="1948">1948</option>
                                        <option value="1947">1947</option>
                                        <option value="1946">1946</option>
                                        <option value="1945">1945</option>
                                        <option value="1944">1944</option>
                                        <option value="1943">1943</option>
                                        <option value="1942">1942</option>
                                        <option value="1941">1941</option>
                                        <option value="1940">1940</option>
                                        <option value="1939">1939</option>
                                        <option value="1938">1938</option>
                                        <option value="1937">1937</option>
                                        <option value="1936">1936</option>
                                        <option value="1935">1935</option>
                                        <option value="1934">1934</option>
                                        <option value="1933">1933</option>
                                        <option value="1932">1932</option>
                                        <option value="1931">1931</option>
                                        <option value="1930">1930</option>
                                        <option value="1929">1929</option>
                                        <option value="1928">1928</option>
                                        <option value="1927">1927</option>
                                        <option value="1926">1926</option>
                                        <option value="1925">1925</option>
                                        <option value="1924">1924</option>
                                        <option value="1923">1923</option>
                                        <option value="1922">1922</option>
                                        <option value="1921">1921</option>
                                        <option value="1920">1920</option>
                                        <option value="1919">1919</option>
                                        <option value="1918">1918</option>
                                        <option value="1917">1917</option>
                                        <option value="1916">1916</option>
                                        <option value="1915">1915</option>
                                        <option value="1914">1914</option>
                                        <option value="1913">1913</option>
                                        <option value="1912">1912</option>
                                        <option value="1911">1911</option>
                                        <option value="1910">1910</option>
                                        <option value="1909">1909</option>
                                        <option value="1908">1908</option>
                                        <option value="1907">1907</option>
                                        <option value="1906">1906</option>
                                        <option value="1905">1905</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s7">
                                <p>*Endereço:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_endereco" required/>
                            </div>
                            <div class="input-field col s2">
                                <p>*Número:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_numero" required/>
                            </div>
                            <div class="input-field col s3">
                                <p>Complemento:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_complemento"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s4">
                                <p>*Bairro:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_bairro" required/>
                            </div>
                            <div class="input-field col s5">
                                <p>*Cidade:</p>
                                <input type="text" class="input-novo-cadastro" name="txt_cidade" required/>
                            </div>
                            <div class="col s3">
                                <p>*Estado:</p>
                                <select class="browser-default select-medium" name="cb_estado" required>
                                    <option value="" disabled selected>Selecione</option>
                                    <option value="1">Acre</option>
                                    <option value="2">Alagoas</option>
                                    <option value="3">Amapá</option>
                                    <option value="4">Amazonas</option>
                                    <option value="5">Bahia</option>
                                    <option value="6">Ceará</option>
                                    <option value="7">Destrito Federal</option>
                                    <option value="8">Espírito Santo</option>
                                    <option value="90">Goiás</option>
                                    <option value="10">Maranhão</option>
                                    <option value="11">Mato Grosso</option>
                                    <option value="12">Mato Grosso do Sul</option>
                                    <option value="13">Minas Gerais</option>
                                    <option value="14">Pará</option>
                                    <option value="15">Paraíba</option>
                                    <option value="16">Paraná</option>
                                    <option value="17">Pernambuco</option>
                                    <option value="18">Piauí</option>
                                    <option value="19">Rio de Janeiro</option>
                                    <option value="20">Rio Grande do Norte</option>
                                    <option value="21">Rio Grande do Sul</option>
                                    <option value="22">Rondônia</option>
                                    <option value="23">Roraima</option>
                                    <option value="24">Santa Catarina</option>
                                    <option value="25">São Paulo</option>
                                    <option value="26">Sergipe</option>
                                    <option value="27">Tocantins</option>
                                </select>
                            </div>
                        </div>
                    </fieldset>
                
                    <fieldset class="col fieldset-p">
                        <div class="row">
                            <div class="col s12"><span>*Campos Obrigatórios.</span></div>
                        </div>
                        <%
                            String data=request.getParameter("txt_email_novo");
                        %>
                        <div class="row">
                            <div class="input-field col s8">
                                <p>*Email:</p>
                                <%if(data!=null){%>
                                <input type="email" class="input-novo-cadastro" name="txt_email" value="<%=data%>" required/><%}else{%>
                                <input type="email" class="input-novo-cadastro" name="txt_email" required/> <%}%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <div class="row">
                                    <p style="margin-left: 10px">*Telefone Primário:</p>
                                    <div class="input-field col s3">
                                        <input type="text" class="input-novo-cadastro" name="txt_tel_primario_ddd" required/>
                                    </div>
                                    <div class="input-field col s9">
                                        <input type="text" class="input-novo-cadastro" name="txt_tel_primario" required/>
                                    </div>
                                </div>
                            </div>
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
                            <div class="input-field col s6">
                                <p>*Senha:</p>
                                <input type="password" class="input-novo-cadastro" name="txt_senha" required/>
                            </div>
                        </div>
                    </fieldset>
                  <button class="btn waves-effect waves-light btn-carrinho-finalizar" type="submit" name="btn_cadastrar">Cadastrar</button>
                </form>
            </div>
            
        </div>
        
        
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript" src="assets/user/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="assets/user/js/user.js"></script>
    </body>
</html>
