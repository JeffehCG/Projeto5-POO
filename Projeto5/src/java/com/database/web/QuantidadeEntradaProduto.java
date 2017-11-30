
package com.database.web;

import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class QuantidadeEntradaProduto {
    private int codigoProduto;
    private int cnpj;
    private int qtEntrada;
    private Timestamp dataEntrada;
    private double vlCusto;
    
    public static void EntradaProduto(int cnpj, Timestamp time, int cdProduto, int quantidade, double valor) throws Exception{
        int cont = 0;
        for(int i = 0; i<EntradaProduto.getStayList().size();i++){
            EntradaProduto entrada = EntradaProduto.getStayList().get(i);
            if(entrada.getCnpj() == cnpj && entrada.getDataEntrada() == time){
                cont = 1;
            }
        }
        if (cont == 1){
            String SQL = "INSERT INTO quantidadeEntradaProduto VALUES(?,?,?,?,?)";
            PreparedStatement s = Database.getConnection().prepareStatement(SQL);
            s.setInt(1,cnpj);
            s.setTimestamp(2, time);
            s.setInt(3, cdProduto);
            s.setInt(4, quantidade);
            s.setDouble(5, valor);
            s.execute();
            s.close();
        }else{
            
        }
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
