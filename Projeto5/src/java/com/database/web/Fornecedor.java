package com.database.web;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.UIManager;


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
    
    public static Fornecedor pesquisarCnpj(int cnpj) throws Exception{
        Fornecedor f = null;
        String SQL = "SELECT * FROM fornecedor WHERE cd_cnpj_fornecedor = ?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1, cnpj);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            f = new Fornecedor(
                    rs.getInt("cd_cnpj_fornecedor")
                    ,rs.getString("nm_razao_social_fornecedor")
                            );
        }
            rs.close();
            s.close();
            return f ;
        
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

    public static void inserirFornecedor(float cnpj, String razao) throws Exception {
        String sql = "INSERT into fornecedor VALUES(default,?,?)";
        PreparedStatement st = Database.getConnection().prepareStatement(sql);
        st.setFloat(1, cnpj);
        st.setString(2, razao);
        st.execute();
        st.close();

    }
    
    public static void atualizaFornecedor(float cnpj, String razao) throws Exception {
        String sql = "UPDATE fornecedor SET cd_cnpj_fornecedor =? AND nm_razao_social_fornecedor =? WHERE cnpj = ?";
        PreparedStatement preparedStatement = Database.getConnection().prepareStatement(sql);
        preparedStatement.setFloat(1, cnpj);
        preparedStatement.setString(2, razao);

    }

}
