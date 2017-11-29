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
    
    public void CriarCliente (Statement s) {
        try {
            s.execute("CREATE TABLE cliente("
                    + "cd_cliente INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
                    + ",cd_cpf_cliente FLOAT(11) NOT NULL"
                    + ",nm_cliente VARCHAR(40) NOT NULL)");
            System.out.println("Criada a tabela Cliente)");
        } catch (Exception ex) {
            System.out.println("Erro ao criar cliente"+ex.getMessage());
        }
  
    }
    
    public void CriarFornecedor (Statement s) {
        try {
            s.execute("CREATE TABLE fornecedor ("
                    + "cd_fornecedor INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
                    + ",cd_cnpj_fornecedor FLOAT(14) NOT NULL"
                    + ",nm_razao_social_fornecedor VARCHAR(50) NOT NULL)");
            System.out.println("Criada a tabela Fornecedor");
        } catch (Exception ex) {
            System.out.println("Erro ao criar fornecedor"+ex.getMessage());
        }
    }
    
    public void InserirGrade (Statement s){
        try {
            s.execute("INSERT INTO grade VALUES(default,'Isento',0,0,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 25% Saida 25%',25,25,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 25% Saida 18%',25,18,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 25% Saida 12%',25,12,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 25% Saida 7%',25,7,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 18% Saida 25%',18,25,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 18% Saida 18%',18,18,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 18% Saida 12%',18,12,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 18% Saida 7%',18,7,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 12% Saida 25%',12,25,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 12% Saida 18%',12,18,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 12% Saida 12%',12,12,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 12% Saida 7%',12,7,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 7% Saida 25%',7,25,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 7% Saida 18%',7,18,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 7% Saida 12%',7,12,0.0);"
                    + "INSERT INTO grade VALUES(default,'Entrada 7% Saida 7%',7,7,0.0);");
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
