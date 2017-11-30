
package com.database.web;

import java.sql.PreparedStatement;

public class QuantidadeEntradaProduto {
    private int codigoProduto;
    private int codigoEntrada;
    private int qtEntrada;
    private double vlCusto;
    
    public void EntradaProduto(int cdEntrada,int cdProduto, int quantidade, double valor) throws Exception{
        int cont = 0;
        for(int i = 0; i<EntradaProduto.getStayList().size();i++){
            EntradaProduto entrada = EntradaProduto.getStayList().get(i);
            if(entrada.getCodigoEntrada() == cdEntrada){
                cont = 1;
            }
        }
        if (cont == 1){
            String SQL = "INSERT INTO quantidadeEntradaProduto VALUES(?,?,?,?)";
            PreparedStatement s = Database.getConnection().prepareStatement(SQL);
            s.setInt(1,cdEntrada);
            s.setInt(2, cdProduto);
            s.setInt(3, quantidade);
            s.setDouble(4, valor);
            s.execute();
            s.close();
        }else{
            
        }
}

    public QuantidadeEntradaProduto(int codigoProduto, int codigoEntrada, int qtEntrada, double vlCusto) {
        this.codigoProduto = codigoProduto;
        this.codigoEntrada = codigoEntrada;
        this.qtEntrada = qtEntrada;
        this.vlCusto = vlCusto;
    }
    

    public int getCodigoProduto() {
        return codigoProduto;
    }

    public void setCodigoProduto(int codigoProduto) {
        this.codigoProduto = codigoProduto;
    }

    public int getCodigoEntrada() {
        return codigoEntrada;
    }

    public void setCodigoEntrada(int codigoEntrada) {
        this.codigoEntrada = codigoEntrada;
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
    
    
}
