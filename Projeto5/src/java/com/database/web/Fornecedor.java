package com.database.web;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class Fornecedor {
    private static float cnpj;
    private String razao;

    public Fornecedor(float cnpj,String razao) {
        this.cnpj = cnpj;
        this.razao = razao;
    }
    
    public static  ArrayList<Fornecedor> getStayList() throws Exception{
        ArrayList<Fornecedor> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM fornecedor"
                + " WHERE cnpj = "+getCnpj());
        while(rs.next()){
            Fornecedor vs = new Fornecedor(
                    rs.getFloat("cd_cnpj_fornecedor"),
                    rs.getString("nm_razao_social_fornecedor")
            );
            list.add(vs);
        }
        rs.close();
        s.close();
        return list;
    }

    public static float getCnpj() {
        return cnpj;
    }

    public void setCnpj(float cnpj) {
        this.cnpj = cnpj;
    }

    public String getRazao() {
        return razao;
    }

    public void setRazao(String razao) {
        this.razao = razao;
    }

    public static void insereFornecedor(float cnpj, String razao) {
        try{
            String sql = "INSERT into fornecedor"
                + "cd_fornecedor"
                + "cd_cnpj_fornecedor"
                + "nm_razao_social_fornecedor"
                 +"VALUES(default,?,?)";
             PreparedStatement preparedStatement = Database.getConnection().prepareStatement(sql);
        preparedStatement.setFloat(1,cnpj);
        preparedStatement.setString(2,razao);
    }catch(Exception e){
        
    }    
}
    
    public static void atualizaFornecedor(float cnpj, String razao) {
        try{
            String sql = "UPDATE fornecedor SET cd_cnpj_fornecedor =? AND nm_razao_social_fornecedor =? WHERE cnpj = ?";
        PreparedStatement preparedStatement = Database.getConnection().prepareStatement(sql);
        preparedStatement.setFloat(1,cnpj);
        preparedStatement.setString(2,razao); 
        }catch(Exception e){
            
        }
        
    }
    
}
