package com.database.web;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class Produto {
    private static float codbarras;
    private   String produto;
    private float valorprod;
    private int qtprod;
    
        public static  ArrayList<Produto> getStayList() throws Exception{
        ArrayList<Produto> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM produto"
                + " WHERE codbarras = "+getCodbarras());
        while(rs.next()){
            Produto vs = new Produto(
                    rs.getFloat("cd_barras_produto"),
                    rs.getString("nm_produto"),
                    rs.getFloat("vl_produto"),
                    rs.getInt("qt_estoque_produto")
            );
            list.add(vs);
        }
        rs.close();
        s.close();
        return list;
    }

    public Produto(float codbarras, String produto, float valorprod, int qtprod) {
        this.codbarras = codbarras;
        this.produto = produto;
        this.valorprod = valorprod;
        this.qtprod = qtprod;
    }

    public static float getCodbarras() {
        return codbarras;
    }

    public  void setCodbarras(float codbarras) {
        this.codbarras = codbarras;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public float getValorprod() {
        return valorprod;
    }

    public void setValorprod(float valorprod) {
        this.valorprod = valorprod;
    }

    public int getQtprod() {
        return qtprod;
    }

    public void setQtprod(int qtprod) {
        this.qtprod = qtprod;
    }
    
    public static void insereProduto(float codbarras,String produto,float valorprod, int qtdprod){
                     try{   
             String sql = "INSERT INTO produto"
                     +"cd_produto"
                     +"cd_barras_produto"
                     +"nm_produto"
                     +"vl_produto"
                    + "qt_estoque_produto"
                    + "VALUES(default,?,?,?,?)";
             PreparedStatement preparedStatement = Database.getConnection().prepareStatement(sql);
             preparedStatement.setFloat(1,codbarras);
             preparedStatement.setFloat(3,valorprod);
             preparedStatement.setInt(4,qtdprod);
             preparedStatement.setString(2,produto);
             preparedStatement.execute();
             preparedStatement.close();
             
             }catch(Exception e){
                 
             }
    }
    
}
