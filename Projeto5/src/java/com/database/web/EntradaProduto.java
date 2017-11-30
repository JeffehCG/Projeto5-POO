
package com.database.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class EntradaProduto {
   private int cnpj;
   private Date dataEntrada;
   private double vlTotal;
   
   public static ArrayList<EntradaProduto> getStayList() throws Exception{
        ArrayList<EntradaProduto> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM entradaProduto");
        while(rs.next()){
            EntradaProduto ep = new EntradaProduto(
                     rs.getInt("cd_cnpj_fornecedor")
                    ,rs.getTimestamp("dt_entrada")
                    ,rs.getDouble("vl_total_entrada"));
            list.add(ep);
        }
        rs.close();
        s.close();
        return list;
    }

    public static Timestamp InserirEntradaProduto(int cnpj,Timestamp dataEntrada) throws Exception{
        Timestamp dtr = new Timestamp(new Date().getTime());
        String SQL = "INSERT INTO entradaProduto VALUES(?,?,default)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1, cnpj);
        s.setTimestamp(2,dtr);
        s.execute();
        s.close();
        return dtr;
    }
   
    public EntradaProduto(int cnpj, Date dataEntrada, double vlTotal) {
        this.cnpj = cnpj;
        this.dataEntrada = dataEntrada;
        this.vlTotal = vlTotal;
    }

    public Date getDataEntrada() {
        return dataEntrada;
    }

    public void setDataEntrada(Date dataEntrada) {
        this.dataEntrada = dataEntrada;
    }

    public double getVlTotal() {
        return vlTotal;
    }

    public void setVlTotal(double vlTotal) {
        this.vlTotal = vlTotal;
    }

    public int getCnpj() {
        return cnpj;
    }

    public void setCnpj(int cnpj) {
        this.cnpj = cnpj;
    }
   
   
}
