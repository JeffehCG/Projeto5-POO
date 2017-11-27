
package com.database.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class Fornecedor {
    
    private int cnpj;
    private String razao;
    public static  ArrayList<Fornecedor> getStayList() throws Exception{
        ArrayList<Fornecedor> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM fornecedor"
                + " WHERE end_stay IS NULL");
        while(rs.next()){
            Fornecedor vs = new Fornecedor(
                    rs.getInt("cd_cnpj_fornecedor"),
                    rs.getString("nm_razao_social_fornecedor")
            );
            list.add(vs);
        }
        rs.close();
        s.close();
        return list;
    }

    public Fornecedor(int cnpj, String razao) {
        this.cnpj = cnpj;
        this.razao = razao;
    }

            
            public  static void insereFornecedor(int cnpj, String razao) throws ClassNotFoundException, SQLException{  
             String sql = "INSERT INTO fornecedor"
                    + "cd_cnpj_fornecedor,nm_razao_social_fornecedor"
                    + "VALUES(default,?,?)";
             PreparedStatement s = Database.getConnection().prepareStatement(sql);
             s.setInt(1,cnpj);
             s.setString(2,razao);
             s.execute();
             s.close();
             
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
