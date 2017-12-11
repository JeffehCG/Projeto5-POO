package com.database.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class SaidaProduto {
    private int cpf;
    private Timestamp dataSaida;
    private double vlTotal;
    
        //Array para exibição das saidas de produto
       public static ArrayList<SaidaProduto> getStayList() throws Exception{
        ArrayList<SaidaProduto> list = new ArrayList<>();
        Statement s = Database.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM saidaProduto");
        while(rs.next()){
            SaidaProduto o = new SaidaProduto(
                        rs.getInt("cd_cpf_cliente")
                        ,rs.getTimestamp("dt_saida")
                        ,rs.getDouble("vl_total_saida"));
            list.add(o);
        }
        rs.close();
        s.close();
        return list;
    }
       //Metodo para inserir a saida de produtos 
        public static Timestamp InserirSaidaProduto(int cpf) throws Exception{
        Timestamp dataSaida = new Timestamp(new Date().getTime());
        String SQL = "INSERT INTO saidaProduto VALUES(?,?,default)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1, cpf);
        s.setTimestamp(2,dataSaida);
        s.execute();
        s.close();
        return dataSaida;
    }
        //Metodo para inserir valor total da venda
        public static void InserirVlTotal(double vlTotSaida,int cpf, Timestamp dtSaida)throws Exception{
        String SQL = "UPDATE saidaProduto SET vl_total_saida = ? WHERE cd_cpf_cliente = ? AND dt_saida = ?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setDouble(1, vlTotSaida);
        s.setInt(2, cpf);
        s.setTimestamp(3, dtSaida);
        s.execute();
        s.close();
    }

    public SaidaProduto(int cpf, Timestamp dataSaida, double vlTotal) {
        this.cpf = cpf;
        this.dataSaida = dataSaida;
        this.vlTotal = vlTotal;
    }

       
       
    public int getCpf() {
        return cpf;
    }

    public void setCpf(int cpf) {
        this.cpf = cpf;
    }

    public Timestamp getDataSaida() {
        return dataSaida;
    }

    public void setDataSaida(Timestamp dataSaida) {
        this.dataSaida = dataSaida;
    }

    public double getVlTotal() {
        return vlTotal;
    }

    public void setVlTotal(double vlTotal) {
        this.vlTotal = vlTotal;
    }
    
    
    
}
