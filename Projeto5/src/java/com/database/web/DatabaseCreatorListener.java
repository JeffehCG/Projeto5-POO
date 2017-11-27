package com.database.web;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
public class DatabaseCreatorListener implements ServletContextListener {
    
    public void CriarProduto (Statement s){
        try {
            s.execute("CREATE TABLE produto("
                    + "cd_produto INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)"
                    + ",cd_barras_produto FLOAT(13) NOT NULL"
                    + ",nm_produto VARCHAR(40) NOT NULL"
                    + ",vl_produto DOUBLE NOT NULL"
                    + ",qt_estoque_produto INTEGER NOT NULL)");
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

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            String url = "jdbc:derby:c:/derby/CompraOnline;create=true";
            Connection c = DriverManager.getConnection(url);
            Statement s = c.createStatement();
            System.out.println("Iniciação da criação do BD");
            CriarProduto(s);
            CriarCliente(s);
            CriarFornecedor(s);
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
