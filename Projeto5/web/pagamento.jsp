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
        <%-- Boleto é apenas pra encher linguiça também, se não der pra fazer deixa. Não esquece do select pra mostrar info sobre o pedido ali no
        canto. --%>
        <div class="container margin-pagamento ">
            <div class="row">
                <div class="col s8">
                    <div class="div-conteudo">
                        <p>PAGAMENTO</p>
                    </div>
                    <div class="div-conteudo-margin-top">
                        <form>
                            <p style="font-size: 14px;">CARTÃO DE CRÉDITO</p>
                            <label class="label-pagamento">Bandeira:</label>
                            <select class="browser-default select-pagamento" name="cb_bandeira">
                                <option value="" disabled selected>Selecione</option>
                                <option value="1">Visa</option>
                                <option value="2">Master Card</option>
                                <option value="3">Diners</option>
                                <option value="4">American Express</option>
                                <option value="5">Hipercard</option>
                                <option value="6">Elo</option>
                            </select>
                            <label class="label-pagamento">Número do Cartão:</label>
                            <input type="text" class="browser-default" style="margin-left: 15px;">
                            <label class="label-pagamento">Nome do Titular:</label>
                            <input type="text" class="browser-default" style="margin-left: 15px;">
                            <label class="label-pagamento">Código de Segurança:</label>
                            <input type="text" class="browser-default" style="margin-left: 15px;">
                            <label class="label-pagamento">Data de Validade:</label>
                            <div class="row">
                                <select class="browser-default select-pagamento col s1" name="cb_mes" style="margin-left: 25px; margin-right: 10px;">
                                    <option value="" disabled selected>Mês</option>
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
                                </select>
                                <select class="browser-default select-pagamento col s1" name="cb_ano">
                                    <option value="" disabled selected>Ano</option>
                                    <option value="1">17</option>
                                    <option value="2">18</option>
                                    <option value="3">19</option>
                                    <option value="4">20</option>
                                    <option value="5">21</option>
                                    <option value="6">22</option>
                                    <option value="7">23</option>
                                    <option value="8">24</option>
                                    <option value="9">25</option>
                                    <option value="10">26</option>
                                    <option value="11">27</option>
                                    <option value="12">28</option>
                                    <option value="13">29</option>
                                    <option value="14">30</option>
                                    <option value="15">31</option>
                                    <option value="16">32</option>
                                    <option value="17">33</option>
                                    <option value="18">34</option>
                                    <option value="19">35</option>
                                    <option value="20">36</option>
                                    <option value="21">37</option>
                                    <option value="22">38</option>
                                    <option value="23">39</option>
                                    <option value="24">40</option>
                                    <option value="25">41</option>
                                    <option value="26">42</option>
                                    <option value="27">43</option>
                                    <option value="28">44</option>
                                    <option value="29">45</option>
                                    <option value="30">46</option>
                                    <option value="31">47</option>
                                </select>
                                <div class="col s10"></div>
                            </div>
                            <button class="btn waves-effect waves-light btn-pagamento" type="submit" name="btn-cartao">Finalizar</button>
                        </form>
                    </div>
                    <div class="div-conteudo-margin-top">
                        <p style="font-size: 14px;">BOLETO BANCÁRIO</p>
                        <span class="info-cliente">Você poderá visualizar ou imprimir após a finalização do pedido. A data de vencimento é de 2 dias corridos após a conclusão do pedido. Após esta data, ele perderá a validade.</span>
                        <button style="margin-top: 40px;" class="btn waves-effect waves-light btn-pagamento" type="submit" name="btn-boleto">Finalizar</button>
                    </div>
                </div>
                <div class="col s4">
                    <div class="div-conteudo">
                        <p>RESUMO DO PEDIDO</p>
                    </div>
                    <div class="div-conteudo-margin-top">
                        <p style="font-size: 14px;">ENDEREÇO DE ENTREGA</p>
                        <span class="info-cliente">Rua Endereço Cadastrado no Banco, Número, Complemento</span>
                        <span class="info-cliente">Bairro: Bairro</span>
                        <span class="info-cliente">Cidade: Cidade</span>
                        <span class="info-cliente">Estado: Estado</span>
                    </div>
                    <div class="div-conteudo-margin-top" style="padding-bottom: 0">
                        <div class="row">
                            <div class="col s6">
                                <p style="font-size: 15px;margin:0">FRETE</p>
                            </div>
                            <div class="col s6">
                                <p style="font-size: 15px;text-align:right;margin:0">R$ 17,90</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s6">
                                <p style="font-size: 17px;margin:0">TOTAL</p>
                            </div>
                            <div class="col s6">
                                <p style="font-size: 17px;text-align:right;margin:0">R$ 5017,90</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript" src="assets/user/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="assets/materialize/js/materialize.min.js"></script>
        <script type="text/javascript" src="assets/user/js/user.js"></script>
    </body>
</html>

