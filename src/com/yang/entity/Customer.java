package com.yang.entity;

public class Customer {
    private int id;
    private String username;
    private String pass;
    private String tel;

    public Customer() {
    }

    public Customer(String username, String pass, String tel) {
        this.username = username;
        this.pass = pass;
        this.tel = tel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", pass='" + pass + '\'' +
                ", tel='" + tel + '\'' +
                '}';
    }
}
