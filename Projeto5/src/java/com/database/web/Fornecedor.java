
package com.database.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Fornecedor {
    
    private int cnpj;
    private String razao;

    public fornecedor(int cnpj, String razao) {
        this.cnpj = cnpj;
        this.razao = razao;
    }
            
            public  void insereFornecedor() throws ClassNotFoundException, SQLException{
                
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            String url = "jdbc:derby:c:/derby/CompraOnline;create=true";
            Connection c = DriverManager.getConnection(url);
             String sql = "INSERT INTO fornecedor"
                    + "cd_cnpj_fornecedor,nm_razao_social_fornecedor"
                    + "VALUES(?,?)";
             PreparedStatement preparedStatement = c.prepareStatement(sql);
             preparedStatement.setInt(1,cnpj);
             preparedStatement.setString(2,razao);
             c.close();
            }

    public int getCnpj() {
        return cnpj;
    }

    public void setCnpj(int cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazao() {
        return razao;
    }

    public void setRazao(String razao) {
        this.razao = razao;
    }
}
