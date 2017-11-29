
package com.database.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProdutoJ {
    int id; 
    int cdBarra;
    String nome;
    String tipo;
    String marca;
    String desc;
    double vlCusto;
    double vlVenda;
    int qtEstoque;
    int cdGrade;
    
    public static ProdutoJ getProdutoJ(int cdBarra) throws Exception{
        ProdutoJ pj = null;
        String SQL = "SELECT * FROM produto WHERE cd_barras_produto=?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1, cdBarra);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            pj = new ProdutoJ(
                     rs.getInt("cd_produto")
                    ,rs.getInt("cd_barras_produto")
                    ,rs.getString("nm_produto")
                    ,rs.getString("nm_tipo_produto")
                    ,rs.getString("nm_marca_produto")
                    ,rs.getString("ds_produto")
                    ,rs.getDouble("vl_custo_produto")
                    ,rs.getDouble("vl_produto")
                    ,rs.getInt("qt_estoque_produto")
                    ,rs.getInt("cd_grade"));
        }
        rs.close();
        s.close();
        return pj;
    }

    public static void inserirProduto(int cdBarra, String nome, String tipo, String marca, String ds,double valor, int grade) throws Exception{
        String SQL = "INSERT INTO produto VALUES(default,?,?,?,?,?,default,?,default,?)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1,cdBarra);
        s.setString(2,nome);
        s.setString(3, tipo);
        s.setString(4, marca);
        s.setString(5, ds);
        s.setDouble(6, valor);
        s.setInt(7,grade);
        s.execute();
        s.close();
    }
    
    public static void entradaMercadoria(double custo, int estoque, int cdBarra)throws Exception{
        String SQL = "UPDATE entradaProduto SET vl_custo_produto=? ,qt_estoque_produto=? WHERE = cd_barras_produto=?";
    }
    
    public ProdutoJ(int id, int cdBarra, String nome, String tipo, String marca, String desc, double vlCusto, double vlVenda, int qtEstoque, int cdGrade) {
        this.id = id;
        this.cdBarra = cdBarra;
        this.nome = nome;
        this.tipo = tipo;
        this.marca = marca;
        this.desc = desc;
        this.vlCusto = vlCusto;
        this.vlVenda = vlVenda;
        this.qtEstoque = qtEstoque;
        this.cdGrade = cdGrade;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCdBarra() {
        return cdBarra;
    }

    public void setCdBarra(int cdBarra) {
        this.cdBarra = cdBarra;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public double getVlCusto() {
        return vlCusto;
    }

    public void setVlCusto(double vlCusto) {
        this.vlCusto = vlCusto;
    }

    public double getVlVenda() {
        return vlVenda;
    }

    public void setVlVenda(double vlVenda) {
        this.vlVenda = vlVenda;
    }

    public int getQtEstoque() {
        return qtEstoque;
    }

    public void setQtEstoque(int qtEstoque) {
        this.qtEstoque = qtEstoque;
    }

    public int getCdGrade() {
        return cdGrade;
    }

    public void setCdGrade(int cdGrade) {
        this.cdGrade = cdGrade;
    }
    
    
}
