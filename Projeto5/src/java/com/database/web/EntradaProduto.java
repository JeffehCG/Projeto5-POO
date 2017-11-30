
package com.database.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class EntradaProduto {
   private int codigoEntrada;
   private Date dataEntrada;
   private double vlTotal;
   
   public static ArrayList<EntradaProduto> getStayList() throws Exception{
        ArrayList<EntradaProduto> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM entradaProduto");
        while(rs.next()){
            EntradaProduto ep = new EntradaProduto(
                     rs.getInt("cd_entrada")
                    ,rs.getTimestamp("dt_entrada")
                    ,rs.getDouble("vl_total_entrada"));
            list.add(ep);
        }
        rs.close();
        s.close();
        return list;
    }

    public void InserirEntradaProduto() throws Exception{
        String SQL = "INSERT INTO entradaProduto VALUES(default,?,default)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setTimestamp(1, new Timestamp(new Date().getTime()));
        s.execute();
        s.close();
    }
   
    public EntradaProduto(int codigoEntrada, Date dataEntrada, double vlTotal) {
        this.codigoEntrada = codigoEntrada;
        this.dataEntrada = dataEntrada;
        this.vlTotal = vlTotal;
    }

   
   
    public int getCodigoEntrada() {
        return codigoEntrada;
    }

    public void setCodigoEntrada(int codigoEntrada) {
        this.codigoEntrada = codigoEntrada;
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
   
   
}
