package com.database.web;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class User {

    private int id;
    private int cpf;
    private String nome;
    private String senha;
    private String email;
    private String sexo;
    private Date nascimento;
    private String cidade;
    private String bairro;
    private String endereco;
    private int numeroEndereco;
    private String complemento;
    private String estado;
    private int telefonePrimario;
    private int telefoneSecundario;

    public User(int id, int cpf, String nome, String senha, String email, String sexo, Date nascimento, String cidade, String bairro, String endereco, int numeroEndereco, String complemento, String estado, int telefonePrimario, int telefoneSecundario) {
        this.id = id;
        this.cpf = cpf;
        this.nome = nome;
        this.senha = senha;
        this.email = email;
        this.sexo = sexo;
        this.nascimento = nascimento;
        this.cidade = cidade;
        this.bairro = bairro;
        this.endereco = endereco;
        this.numeroEndereco = numeroEndereco;
        this.complemento = complemento;
        this.estado = estado;
        this.telefonePrimario = telefonePrimario;
        this.telefoneSecundario = telefoneSecundario;
    }

    public static User getUser(String email, String senha) throws SQLException {
//        Statement s = Database.getConnection().createStatement();
        String SQL = "SELECT * FROM cliente WHERE email=? AND senha=?";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setString(1, email);
        s.setString(2, senha.hashCode()+"");
        ResultSet rs = s.executeQuery();
        User u = null;
        if (rs.next()) {
            u = new User(rs.getInt("id"),
                    rs.getInt("cpf"),
                    rs.getString("nome"),
                    rs.getString("senha"),
                    rs.getString("email"),
                    rs.getString("sexo"),
                    rs.getDate("nascimento"),
                    rs.getString("cidade"),
                    rs.getString("bairro"),
                    rs.getString("endereco"),
                    rs.getInt("numeroEndereco"),
                    rs.getString("complemento"),
                    rs.getString("estado"),
                    rs.getInt("telefonePrimario"),
                    rs.getInt("telefoneSecundario"));
        }
        rs.close();
        s.close();
        return u;
    }
    //Registra os parametros dentro do banco de dados da tabela cliente
    public static void inserirUser(int cpf, String nome, String senha, String email, String sexo, 
            Date nascimento, String cidade, String bairro, String endereco, int numeroendereco, 
            String complemento, String estado, int telefonePrimario, int telefoneSecundario) throws Exception{
        String SQL = "INSERT INTO cliente VALUES(default,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
        s.setInt(1, cpf);
        s.setString(2, nome);
        s.setString(3, senha);
        s.setString(4, email);
        s.setString(5, String.valueOf(sexo));
        s.setDate(6, nascimento);
        s.setString(7, cidade);
        s.setString(8, bairro);
        s.setString(9, endereco);
        s.setInt(10, numeroendereco);
        s.setString(11, complemento);
        s.setString(12, estado);
        s.setInt(13, telefonePrimario);
        s.setInt(14, telefoneSecundario);
        s.execute();
        s.close();
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCpf() {
        return cpf;
    }

    public void setCpf(int cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Date getNascimento() {
        return nascimento;
    }

    public void setNascimento(Date nascimento) {
        this.nascimento = nascimento;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getNumeroEndereco() {
        return numeroEndereco;
    }

    public void setNumeroEndereco(int numeroEndereco) {
        this.numeroEndereco = numeroEndereco;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getTelefonePrimario() {
        return telefonePrimario;
    }

    public void setTelefonePrimario(int telefonePrimario) {
        this.telefonePrimario = telefonePrimario;
    }

    public int getTelefoneSecundario() {
        return telefoneSecundario;
    }

    public void setTelefoneSecundario(int telefoneSecundario) {
        this.telefoneSecundario = telefoneSecundario;
    }    
    
}
