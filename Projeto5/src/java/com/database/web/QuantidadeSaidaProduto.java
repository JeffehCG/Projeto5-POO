package com.database.web;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import javafx.scene.shape.Arc;

public class QuantidadeSaidaProduto {
    private int codigoProduto;
    private int cpf;
    private int qtSaida;
    private Timestamp dataSaida;
    private double vlVenda;
    
    private static ArrayList<QuantidadeSaidaProduto> Saida;
    public static ArrayList<QuantidadeSaidaProduto> setSaidaProdutos(int cdProduto, int qtProduto, double vlProduto) throws Exception{
        if (Saida == null){
        Saida = new ArrayList<>();}
        QuantidadeSaidaProduto Sai = new QuantidadeSaidaProduto(cdProduto, qtProduto, vlProduto);
        Saida.add(Sai);
        return Saida;
    }
    public static ArrayList<QuantidadeSaidaProduto> getSaida(){
        if (Saida == null){
            Saida = new ArrayList<>();}
        return Saida;
        }
    
        public static void SaidaProduto(int cpf, Timestamp time, int cdProduto, int quantidade, double valor) throws Exception{
            String SQL = "INSERT INTO quantidadeSaidaProduto VALUES(?,?,?,?,?)";
            PreparedStatement s = Database.getConnection().prepareStatement(SQL);
            s.setInt(1,cpf);
            s.setTimestamp(2, time);
            s.setInt(3, cdProduto);
            s.setInt(4, quantidade);
            s.setDouble(5, valor);
            s.execute();
            s.close();

}
        public static double VlTotalVenda(int qt, double saida){
        double vlTotal = qt * saida ;
        return vlTotal;
    }

    public QuantidadeSaidaProduto(int codigoProduto, int qtSaida, double vlVenda) {
        this.codigoProduto = codigoProduto;
        this.qtSaida = qtSaida;
        this.vlVenda = vlVenda;
    }
    
    public QuantidadeSaidaProduto(int codigoProduto, int cpf, int qtSaida, Timestamp dataSaida, double vlVenda) {
        this.codigoProduto = codigoProduto;
        this.cpf = cpf;
        this.qtSaida = qtSaida;
        this.dataSaida = dataSaida;
        this.vlVenda = vlVenda;
    }
    
    

    public int getCodigoProduto() {
        return codigoProduto;
    }

    public void setCodigoProduto(int codigoProduto) {
        this.codigoProduto = codigoProduto;
    }

    public int getCpf() {
        return cpf;
    }

    public void setCpf(int cpf) {
        this.cpf = cpf;
    }

    public int getQtSaida() {
        return qtSaida;
    }

    public void setQtSaida(int qtSaida) {
        this.qtSaida = qtSaida;
    }

    public Timestamp getDataSaida() {
        return dataSaida;
    }

    public void setDataSaida(Timestamp dataSaida) {
        this.dataSaida = dataSaida;
    }

    public double getVlVenda() {
        return vlVenda;
    }

    public void setVlVenda(double vlVenda) {
        this.vlVenda = vlVenda;
    }
    
    
}