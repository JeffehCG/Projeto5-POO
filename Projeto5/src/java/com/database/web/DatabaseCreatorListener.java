package com.database.web;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
public class DatabaseCreatorListener implements ServletContextListener {
    
        public void CriarGradeTributaria (Statement s){
        try {
            s.execute("CREATE TABLE grade("
                    + "cd_grade INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) PRIMARY KEY"
                    + ",ds_grade VARCHAR(100) NOT NULL"
                    + ",cd_icms_entrada INTEGER NOT NULL DEFAULT 0"
                    + ",cd_icms_saida INTEGER NOT NULL DEFAULT 0"
                    + ",cd_reducao_icms NUMERIC NOT NULL DEFAULT 0.0)");
            System.out.println("Criado a tabela grade"); 
        } catch (Exception ex) {
            System.out.println("Erro ao criar grade"+ex.getMessage());
        }
    }
    
     public void CriarProduto (Statement s){
        try {
            s.execute("CREATE TABLE produto("
                    +"cd_produto INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
                    +",cd_barras_produto FLOAT(13) NOT NULL PRIMARY KEY"
                    +",nm_produto VARCHAR(40) NOT NULL"
                    +",nm_tipo_produto VARCHAR(15) NOT NULL"
                    +",nm_marca_produto VARCHAR(15) NOT NULL"
                    +",ds_produto VARCHAR(100)"
                    +",vl_custo_produto NUMERIC(10,2) DEFAULT 0.0"
                    +",vl_produto NUMERIC(10,2) NOT NULL"
                    +",qt_estoque_produto INTEGER"
                    +",cd_grade INTEGER NOT NULL"
                    +",CONSTRAINT fk_grade FOREIGN KEY (cd_grade) REFERENCES grade (cd_grade))");
            System.out.println("Criada a tabela produto");
        } catch (Exception ex) {
            System.out.println("Erro ao criar produto" + ex.getMessage());
        }
    }
     
    public void CriarFornecedor (Statement s) {
        try {
            s.execute("CREATE TABLE fornecedor ("
                    + "cd_fornecedor INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
                    + ",cd_cnpj_fornecedor FLOAT(14) NOT NULL PRIMARY KEY"
                    + ",nm_razao_social_fornecedor VARCHAR(50) NOT NULL)");
            System.out.println("Criada a tabela Fornecedor");
        } catch (Exception ex) {
            System.out.println("Erro ao criar fornecedor"+ex.getMessage());
        }
    }
    
    public void EntradaProduto(Statement s){
        try {
            s.execute("CREATE TABLE entradaProduto("
                     +"cd_cnpj_fornecedor FLOAT(14) NOT NULL"
                     +",dt_entrada timestamp NOT NULL"
                     +",vl_total_entrada NUMERIC(10,2) DEFAULT 0.0"
                     + ",CONSTRAINT pk_entradaProduto PRIMARY KEY (cd_cnpj_fornecedor,dt_entrada)"
                     + ",CONSTRAINT fk_EntradaFornec FOREIGN KEY (cd_cnpj_fornecedor) REFERENCES fornecedor (cd_cnpj_fornecedor))");
        } catch (Exception e) {
        }
    }
     
    public void QuantidadeEntradaProduto(Statement s){
        try {
            s.execute("CREATE TABLE quantidadeEntradaProduto("
                    +"cd_cnpj_fornecedor FLOAT(14) NOT NULL"
                    +",dt_entrada timestamp NOT NULL"
                    +",cd_barras_produto FLOAT(13)NOT NULL"
                    +",qt_produto INTEGER NOT NULL"
                    +",vl_custo NUMERIC(10,2)NOT NULL"
                    +",CONSTRAINT pk_quantidadeEntrada PRIMARY KEY (cd_cnpj_fornecedor,dt_entrada,cd_barras_produto)"
                    +",CONSTRAINT fk_ProdutoEntrada FOREIGN KEY (cd_barras_produto) REFERENCES produto (cd_barras_produto)"
                    +",CONSTRAINT fk_ProdutoEntrada2 FOREIGN KEY (cd_cnpj_fornecedor,dt_entrada) REFERENCES entradaProduto (cd_cnpj_fornecedor,dt_entrada))"
            
            ); 
        } catch (Exception e) {
        }
    }
    
    public void CriarCliente (Statement s) {
        try {
            s.execute("CREATE TABLE cliente("
                    + "cd_cliente INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
                    + ",cd_cpf_cliente FLOAT(11) NOT NULL PRIMARY KEY"
                    + ",nm_cliente VARCHAR(40) NOT NULL"
                    + ",cd_senha_cliente VARCHAR(30) NOT NULL"
                    + ",nm_email VARCHAR(360) NOT NULL"
                    + ",ic_sexo CHAR(1) NOT NULL"
                    + ",dt_nascimento DATE NOT NULL"
                    + ",nm_cidade VARCHAR(360) NOT NULL"
                    + ",nm_bairro VARCHAR(360) NOT NULL"
                    + ",nm_endereco VARCHAR(360) NOT NULL"
                    + ",cd_numero_endereco INTEGER"
                    + ",nm_complemento_endereco VARCHAR(40)"
                    + ",nm_estado VARCHAR(40) NOT NULL"
                    + ",cd_telefone_primario INTEGER NOT NULL"
                    + ",cd_telefone_secundario INTEGER)");
            System.out.println("Criada a tabela Cliente)");
        } catch (Exception ex) {
            System.out.println("Erro ao criar cliente"+ex.getMessage());
        }
  
    }
    
    public void SaidaProduto(Statement s){
        try {
            s.execute("CREATE TABLE saidaProduto("
                    + "cd_cpf_cliente FLOAT(11) NOT NULL"
                    + ",dt_saida timestamp NOT NULL"
                    + ",vl_total_saida NUMERIC(10,2) DEFAULT 0.0"
                    + ",CONSTRAINT pk_saidaProduto PRIMARY KEY (cd_cpf_cliente,dt_saida)"
                    + ",CONSTRAINT fk_saidaCPF FOREIGN KEY (cd_cpf_cliente) REFERENCES cliente (cd_cpf_cliente))");
        } catch (Exception e) {
        }
    }
    
        public void QuantidadeSaidaProduto(Statement s){
        try {
            s.execute("CREATE TABLE quantidadeSaidaProduto("
                    +"cd_cpf_cliente FLOAT(14) NOT NULL"
                    +",dt_saida timestamp NOT NULL"
                    +",cd_barras_produto FLOAT(13)NOT NULL"
                    +",qt_produto INTEGER NOT NULL"
                    +",vl_venda NUMERIC(10,2)NOT NULL"
                    +",CONSTRAINT pk_quantidadeSaida PRIMARY KEY (cd_cpf_cliente,dt_saida,cd_barras_produto)"
                    +",CONSTRAINT fk_ProdutoSaida FOREIGN KEY (cd_barras_produto) REFERENCES produto (cd_barras_produto)"
                    +",CONSTRAINT fk_ProdutoSaida2 FOREIGN KEY (cd_cpf_cliente,dt_saida) REFERENCES saidaProduto (cd_cpf_cliente,dt_saida))"
            
            ); 
        } catch (Exception e) {
        }
    }
    
    public void InserirGrade (Statement s){
        try {
            s.execute("INSERT INTO grade VALUES(default,'Isento',0,0,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 25% Saida 25%',25,25,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 25% Saida 18%',25,18,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 25% Saida 12%',25,12,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 25% Saida 7%',25,7,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 18% Saida 25%',18,25,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 18% Saida 18%',18,18,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 18% Saida 12%',18,12,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 18% Saida 7%',18,7,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 12% Saida 25%',12,25,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 12% Saida 18%',12,18,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 12% Saida 12%',12,12,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 12% Saida 7%',12,7,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 7% Saida 25%',7,25,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 7% Saida 18%',7,18,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 7% Saida 12%',7,12,0.0)");
            s.execute("INSERT INTO grade VALUES(default,'Entrada 7% Saida 7%',7,7,0.0)");
        } catch (Exception ex) {
            System.out.println("Erro ao inserir dados na grade "+ex.getMessage());
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            String url = "jdbc:derby:c:/derby/CompraOnline;create=true";
            Connection c = DriverManager.getConnection(url);
            Statement s = c.createStatement();
            System.out.println("Iniciação da criação do BD");
            CriarGradeTributaria(s);
            CriarProduto(s);
            CriarCliente(s);
            CriarFornecedor(s);
            EntradaProduto(s);
            QuantidadeEntradaProduto(s);
            SaidaProduto(s);
            QuantidadeSaidaProduto(s);
            InserirGrade(s);
            s.close();
            c.close();
            DriverManager.getConnection("jdbc:derby:c:/derby/CompraOnline;shutdown=true");
        } catch (Exception ex) {
            System.out.println("Erro: "+ex.getMessage());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
