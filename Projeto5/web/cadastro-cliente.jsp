<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                            <div class="input-field col s4">
                                <p>*Seu Nome:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_nome" required/>
                            </div>
                            <div class="input-field col s4">
                                <p>*Sobrenome:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_sobrenome" required/>
                            </div>
                            <div class="input-field col s4">
                                <p>*CPF:</p>
                                <input class="input-novo-cadastro" type="text" name="txt_cpf" required/>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom:10px;">
                            <div class="col s5 radio-pos">
                                <p>*Sexo:</p>
                                <input type="radio" class="with-gap input-novo-cadastro" name="rb_sexo" value="1" id="masc" required><label for="masc" class="radio-label">Masculino</label>
                                <input type="radio" class="with-gap input-novo-cadastro" name="rb_sexo" value="2" id="fem" required><label for="fem" class="radio-label">Feminino</label>
                            </div>
                            <div class="col s7">
                                <p>*Data de Nascimento:</p>
                                <div class="row">
                                    <select class="browser-default select-small col s3" name="cb_dia" required>
                                        <option value="" disabled selected>Dia</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
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
                                        <option value="1">Jan</option>
                                        <option value="2">Fev</option>
                                        <option value="3">Mar</option>
                                        <option value="4">Abr</option>
                                        <option value="5">Mai</option>
                                        <option value="6">Jun</option>
                                        <option value="7">Jul</option>
                                        <option value="8">Ago</option>
                                        <option value="9">Set</option>
                                        <option value="10">Out</option>
                                        <option value="11">Nov</option>
                                        <option value="12">Dez</option>
                                    </select>
                                    <select class="browser-default select-small col s3" name="cb_ano" required>
                                        <option value="" disabled selected>Ano</option>
                                        <option value="1">2016</option>
                                        <option value="2">2015</option>
                                        <option value="3">2014</option>
                                        <option value="4">2013</option>
                                        <option value="5">2012</option>
                                        <option value="6">2011</option>
                                        <option value="7">2010</option>
                                        <option value="8">2009</option>
                                        <option value="9">2008</option>
                                        <option value="10">2007</option>
                                        <option value="11">2006</option>
                                        <option value="12">2005</option>
                                        <option value="13">2004</option>
                                        <option value="14">2003</option>
                                        <option value="15">2002</option>
                                        <option value="16">2001</option>
                                        <option value="17">2000</option>
                                        <option value="18">1999</option>
                                        <option value="19">1998</option>
                                        <option value="20">1997</option>
                                        <option value="21">1996</option>
                                        <option value="22">1995</option>
                                        <option value="23">1994</option>
                                        <option value="24">1993</option>
                                        <option value="25">1992</option>
                                        <option value="26">1991</option>
                                        <option value="27">1990</option>
                                        <option value="28">1989</option>
                                        <option value="29">1988</option>
                                        <option value="30">1987</option>
                                        <option value="31">1986</option>
                                        <option value="32">1985</option>
                                        <option value="33">1984</option>
                                        <option value="34">1983</option>
                                        <option value="35">1982</option>
                                        <option value="36">1981</option>
                                        <option value="37">1980</option>
                                        <option value="38">1979</option>
                                        <option value="39">1978</option>
                                        <option value="40">1977</option>
                                        <option value="41">1976</option>
                                        <option value="42">1975</option>
                                        <option value="43">1974</option>
                                        <option value="44">1973</option>
                                        <option value="45">1972</option>
                                        <option value="46">1971</option>
                                        <option value="47">1970</option>
                                        <option value="48">1969</option>
                                        <option value="49">1968</option>
                                        <option value="50">1967</option>
                                        <option value="51">1966</option>
                                        <option value="52">1965</option>
                                        <option value="53">1964</option>
                                        <option value="54">1963</option>
                                        <option value="55">1962</option>
                                        <option value="56">1961</option>
                                        <option value="57">1960</option>
                                        <option value="58">1959</option>
                                        <option value="59">1958</option>
                                        <option value="60">1957</option>
                                        <option value="61">1956</option>
                                        <option value="62">1955</option>
                                        <option value="63">1954</option>
                                        <option value="64">1953</option>
                                        <option value="65">1952</option>
                                        <option value="66">1951</option>
                                        <option value="67">1950</option>
                                        <option value="68">1949</option>
                                        <option value="69">1948</option>
                                        <option value="70">1947</option>
                                        <option value="71">1946</option>
                                        <option value="72">1945</option>
                                        <option value="73">1944</option>
                                        <option value="74">1943</option>
                                        <option value="75">1942</option>
                                        <option value="76">1941</option>
                                        <option value="77">1940</option>
                                        <option value="78">1939</option>
                                        <option value="79">1938</option>
                                        <option value="80">1937</option>
                                        <option value="81">1936</option>
                                        <option value="82">1935</option>
                                        <option value="83">1934</option>
                                        <option value="84">1933</option>
                                        <option value="85">1932</option>
                                        <option value="86">1931</option>
                                        <option value="87">1930</option>
                                        <option value="88">1929</option>
                                        <option value="89">1928</option>
                                        <option value="90">1927</option>
                                        <option value="91">1926</option>
                                        <option value="92">1925</option>
                                        <option value="93">1924</option>
                                        <option value="94">1923</option>
                                        <option value="95">1922</option>
                                        <option value="96">1921</option>
                                        <option value="97">1920</option>
                                        <option value="98">1919</option>
                                        <option value="99">1918</option>
                                        <option value="100">1917</option>
                                        <option value="101">1916</option>
                                        <option value="102">1915</option>
                                        <option value="103">1914</option>
                                        <option value="104">1913</option>
                                        <option value="105">1912</option>
                                        <option value="106">1911</option>
                                        <option value="107">1910</option>
                                        <option value="108">1909</option>
                                        <option value="109">1908</option>
                                        <option value="110">1907</option>
                                        <option value="111">1906</option>
                                        <option value="112">1905</option>
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
                                <input type="email" class="input-novo-cadastro" name="txt_email" required/>
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
