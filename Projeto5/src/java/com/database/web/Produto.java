package com.database.web;
import java.sql.PreparedStatement;


public class Produto {
    private int codbarras;
    private String produto;
    private float valorprod;
    private int qtprod;

    public int getCodbarras() {
        return codbarras;
    }

    public void setCodbarras(int codbarras) {
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
    
    public void insereProduto(){
                     try{   
             String sql = "INSERT INTO produto"
                     +"cd_produto"
                     +"cd_barras_produto"
                     +"nm_produto"
                     +"vl_produto"
                    + "qt_estoque_produto"
                    + "VALUES(default,?,?,?,?)";
             PreparedStatement preparedStatement = Database.getConnection().prepareStatement(sql);
             preparedStatement.setInt(1,codbarras);
             preparedStatement.setFloat(3,valorprod);
             preparedStatement.setInt(4,qtprod);
             preparedStatement.setString(2,produto);
             preparedStatement.execute();
             preparedStatement.close();
             
             }catch(Exception e){
                 
             }
    }
    
}
