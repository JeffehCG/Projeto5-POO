
package com.database.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProdutoJ {
    private int id; 
    private int cdBarra;
    private String nome;
    private String tipo;
    private String marca;
    private String desc;
    private double vlCusto;
    private double vlVenda;
    private int qtEstoque;
    private int cdGrade;
    
    //Metodo para pesquisar produto pelo codigo de barras
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
    
    //Metodo para listar Produtos do banco 
    public static ArrayList<ProdutoJ> getStayList() throws Exception{
        ArrayList<ProdutoJ> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM produto");
        while(rs.next()){
            ProdutoJ pj = new ProdutoJ(
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
            list.add(pj);
        }
        rs.close();
        s.close();
        return list;
    }
    
    //Metodo para inserir produto
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
    
    //Metodo alterar custo e quantidade de estoque na entrada(compra)
    public static void inserirCustoEEstoque (int cdBarras, double custo,int qtEstoque)throws Exception{
        ProdutoJ o = getProdutoJ(cdBarras);
        int EstAtual = qtEstoque + o.qtEstoque;
        String SQL = "UPDATE produto SET vl_custo_produto = ? , qt_estoque_produto = ? WHERE cd_barras_produto = ? " ;
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setDouble(1, custo);
        s.setInt(2, EstAtual);
        s.setInt(3, cdBarras);
        s.execute();
        s.close();
    }
    
    //Metodo para alterar estoque de produto na saida(venda)
    public static void saidaEstoque(int cdBarras, int qtSaida)throws Exception{
        ProdutoJ o = getProdutoJ(cdBarras);
        int estAtual = o.qtEstoque - qtSaida;
        String SQL = "UPDATE produto SET qt_estoque_produto = ? WHERE cd_barras_produto = ?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1, estAtual);
        s.setInt(2, cdBarras);
        s.execute();
        s.close();
    }
    
    //Metodo para excluir produto
    public static void excluirProduto(int cdBarras)throws Exception{
        String SQL = "DELETE FROM produto WHERE cd_barras_produto = ?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1, cdBarras);
        s.execute();
        s.close();
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
