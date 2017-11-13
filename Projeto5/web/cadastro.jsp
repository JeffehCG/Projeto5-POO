
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form>           
            <fieldset>
            <legend>
                Cadastro Fornecedor
            </legend>

                <label for="cnpj">Informe o CNPJ:</label>
                <input type="number" name="cnpj" required>
                <label for="cnpj">Informe a razão social:</label>
                <input type="text" name="razao" required>
            </fieldset>
        </form>

    </body>
</html>
