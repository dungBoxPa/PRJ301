/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Windows 10 TIMT
 */
public class Category {

    private int cate_id;
    private String cate_name;
    private String icon_path;

    public Category() {
    }
    
    public Category(int cate_id) {
        this.cate_id = cate_id;
    }

    public Category(int cate_id, String cate_name) {
        this.cate_id = cate_id;
        this.cate_name = cate_name;
    }

    public Category(int cate_id, String cate_name, String icon_path) {
        this.cate_id = cate_id;
        this.cate_name = cate_name;
        this.icon_path = icon_path;
    }

    public int getCate_id() {
        return cate_id;
    }

    public void setCate_id(int cate_id) {
        this.cate_id = cate_id;
    }

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

    public String getIcon_path() {
        return icon_path;
    }

    public void setIcon_path(String icon_path) {
        this.icon_path = icon_path;
    }

    @Override
    public String toString() {
        return "Category{" + "cate_id=" + cate_id + ", cate_name=" + cate_name + ", icon_path=" + icon_path + '}';
    }
}
