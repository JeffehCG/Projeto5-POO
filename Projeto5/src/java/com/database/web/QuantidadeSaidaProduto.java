package com.database.web;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import javafx.scene.shape.Arc;

public class QuantidadeSaidaProduto {
    private int codigoProduto;
    private int cpf;
    private int qtSaida;
    private Timestamp dataSaida;
    private double vlVenda;
    
    //Array para guardar produtos selecionados antes de gravar no banco 
    private static ArrayList<QuantidadeSaidaProduto> Saida;
    public static ArrayList<QuantidadeSaidaProduto> setSaidaProdutos(int cdProduto, int qtProduto, double vlProduto) throws Exception{
        if (Saida == null){
        Saida = new ArrayList<>();}
        QuantidadeSaidaProduto Sai = new QuantidadeSaidaProduto(cdProduto, qtProduto, vlProduto);
        Saida.add(Sai);
        return Saida;
    }
    //Metodo para pegar dados do array, alterar, apagar etc...
    public static ArrayList<QuantidadeSaidaProduto> getSaida(){
        if (Saida == null){
            Saida = new ArrayList<>();}
        return Saida;
        }
        //Metodo para saida de produtos no banco 
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
        //Metodo para calcular a venda total de determinado produto tendo como base seu custo e quantidade de entrada
        public static double VlTotalVenda(int qt, double saida){
        double vlTotal = qt * saida ;
        return vlTotal;
    }
       
        //Metodo para listar Produtos do banco  pelo codigo de barras
    public static ArrayList<QuantidadeSaidaProduto> getProdutoCdBarras(int cdBarras) throws Exception{
        ArrayList<QuantidadeSaidaProduto> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM quantidadeSaidaProduto WHERE cd_barras_produto = "+cdBarras+"");
        while(rs.next()){
            QuantidadeSaidaProduto qs = new QuantidadeSaidaProduto(
                     rs.getInt("cd_barras_produto")
                    ,rs.getInt("cd_cpf_cliente")
                    ,rs.getInt("qt_produto")
                    ,rs.getTimestamp("dt_saida")
                    ,rs.getDouble("vl_venda"));
            list.add(qs);
        }
        rs.close();
        s.close();
        return list;
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
