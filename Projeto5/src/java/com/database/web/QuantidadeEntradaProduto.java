
package com.database.web;

import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import javafx.scene.shape.Arc;

public class QuantidadeEntradaProduto {
    private int codigoProduto;
    private int cnpj;
    private int qtEntrada;
    private Timestamp dataEntrada;
    private double vlCusto;
    
    //Array para guardar produtos selecionados antes de gravar no banco 
    private static ArrayList<QuantidadeEntradaProduto> Entrada;
    public static ArrayList<QuantidadeEntradaProduto> setEntradaProdutos(int cdProduto, int qtProduto, double vlProduto) throws Exception{
        if (Entrada == null){
        Entrada = new ArrayList<>();}
        QuantidadeEntradaProduto Ent = new QuantidadeEntradaProduto(cdProduto, qtProduto, vlProduto);
        Entrada.add(Ent);
        return Entrada;
    }
    //Metodo para pegar dados do array, alterar, apagar etc...
    public static ArrayList<QuantidadeEntradaProduto> getEntrada(){
        if (Entrada == null){
            Entrada = new ArrayList<>();}
        return Entrada;
        }
    
    //Metodo para entrada de produtos no banco
    public static void EntradaProduto(int cnpj, Timestamp time, int cdProduto, int quantidade, double valor) throws Exception{
            String SQL = "INSERT INTO quantidadeEntradaProduto VALUES(?,?,?,?,?)";
            PreparedStatement s = Database.getConnection().prepareStatement(SQL);
            s.setInt(1,cnpj);
            s.setTimestamp(2, time);
            s.setInt(3, cdProduto);
            s.setInt(4, quantidade);
            s.setDouble(5, valor);
            s.execute();
            s.close();

}
    //Metodo para calcular o custo total de determinado produto tendo como base seu custo e quantidade de entrada
    public static double VlTotalCusto(int qt, double cust){
        double vlTotal = qt * cust ;
        return vlTotal;
    }
    public QuantidadeEntradaProduto(int codigoProduto, int qtEntrada, double vlCusto) {
        this.codigoProduto = codigoProduto;
        this.qtEntrada = qtEntrada;
        this.vlCusto = vlCusto;
    }
    

    public QuantidadeEntradaProduto(int codigoProduto, int cnpj, int qtEntrada, Timestamp dataEntrada, double vlCusto) {
        this.codigoProduto = codigoProduto;
        this.cnpj = cnpj;
        this.qtEntrada = qtEntrada;
        this.dataEntrada = dataEntrada;
        this.vlCusto = vlCusto;
    }
    

    public int getCodigoProduto() {
        return codigoProduto;
    }

    public void setCodigoProduto(int codigoProduto) {
        this.codigoProduto = codigoProduto;
    }

    public int getQtEntrada() {
        return qtEntrada;
    }

    public void setQtEntrada(int qtEntrada) {
        this.qtEntrada = qtEntrada;
    }

    public double getVlCusto() {
        return vlCusto;
    }

    public void setVlCusto(double vlCusto) {
        this.vlCusto = vlCusto;
    }

    public int getCnpj() {
        return cnpj;
    }

    public void setCnpj(int cnpj) {
        this.cnpj = cnpj;
    }

    public Timestamp getDataEntrada() {
        return dataEntrada;
    }

    public void setDataEntrada(Timestamp dataEntrada) {
        this.dataEntrada = dataEntrada;
    }
    
    
}
