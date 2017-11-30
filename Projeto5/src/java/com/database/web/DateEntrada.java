package com.database.web;

import java.sql.Timestamp;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author User
 */
public class DateEntrada {
    private Timestamp data;

    public DateEntrada() {
        this.data = new Timestamp(new Date().getTime());
    }
    
    public Timestamp getData() {
        return data;
    }

    public void setData(Timestamp data) {
        this.data = data;
    }
    
    
}
