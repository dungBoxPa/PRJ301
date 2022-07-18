/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Windows 10 TIMT
 *
 * /*
 * pro_id int identity(1,1) not null PRIMARY KEY, pro_name nvarchar(max) not
 * null, quantity int not null, price money not null, discount float null, size
 * nvarchar(50) null, CPU nvarchar(max) null, screen_size float not null,
 * front_cam nvarchar(50) null, back_cam nvarchar(50) null, ram int not null, OS
 * nvarchar(100) null, chip nvarchar(100) not null, internal_mem nvarchar(100)
 * not null, PIN nvarchar(50) null, weight float null, bluetooth nvarchar(50)
 * null, img_path nvarchar(max) not null, rating_score int not null, subcat_id
 * int not null foreign key references sub_cate(sub_cate), event_id int not null
 * foreign key references Event(event_id)
 */
public class Product{

    private int pro_id;
    private String pro_name;
    private int quantity;
    private int price;
    private int discount;
    private String edition;
    private double screen_size;
    private String screen_tech;
    private String backCam;
    private String frontCam;
    private String chip;
    private int ram;
    private String internal_mem;
    private String PIN;
    private String sim;
    private String OS;
    private String scr_resol;
    private String size;
    private int weight;
    private String bluetooth;
    private String img_path;
    private int rating_score;
    private Category category;
    private Event event;

    public Product() {
    }

    public Product(int pro_id, int quantity, int price, int discount, double screen_size, String screen_tech, String chip, int ram, String internal_mem, String PIN, String sim, String OS, String scr_resol, String size, int weight, String bluetooth) {
        this.pro_id = pro_id;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.screen_size = screen_size;
        this.screen_tech = screen_tech;
        this.chip = chip;
        this.ram = ram;
        this.internal_mem = internal_mem;
        this.PIN = PIN;
        this.sim = sim;
        this.OS = OS;
        this.scr_resol = scr_resol;
        this.size = size;
        this.weight = weight;
        this.bluetooth = bluetooth;
    }
    
    public Product(int pro_id) {
        this.pro_id = pro_id;
    }
    
    public Product(String pro_name, int quantity, int price, int discount, String edition, double screen_size, String screen_tech, String backCam, String frontCam, String chip, int ram, String internal_mem, String PIN, String sim, String OS, String scr_resol, String size, int weight, String bluetooth, String img_path, int rating_score, Category category, Event event) {
        this.pro_name = pro_name;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.edition = edition;
        this.screen_size = screen_size;
        this.screen_tech = screen_tech;
        this.backCam = backCam;
        this.frontCam = frontCam;
        this.chip = chip;
        this.ram = ram;
        this.internal_mem = internal_mem;
        this.PIN = PIN;
        this.sim = sim;
        this.OS = OS;
        this.scr_resol = scr_resol;
        this.size = size;
        this.weight = weight;
        this.bluetooth = bluetooth;
        this.img_path = img_path;
        this.rating_score = rating_score;
        this.category = category;
        this.event = event;
    }

    public Product(int pro_id, String pro_name, int quantity, int price, int discount, String edition, double screen_size, String screen_tech, String backCam, String frontCam, String chip, int ram, String internal_mem, String PIN, String sim, String OS, String scr_resol, String size, int weight, String bluetooth, String img_path, int rating_score, Category category, Event event) {
        this.pro_id = pro_id;
        this.pro_name = pro_name;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.edition = edition;
        this.screen_size = screen_size;
        this.screen_tech = screen_tech;
        this.backCam = backCam;
        this.frontCam = frontCam;
        this.chip = chip;
        this.ram = ram;
        this.internal_mem = internal_mem;
        this.PIN = PIN;
        this.sim = sim;
        this.OS = OS;
        this.scr_resol = scr_resol;
        this.size = size;
        this.weight = weight;
        this.bluetooth = bluetooth;
        this.img_path = img_path;
        this.rating_score = rating_score;
        this.category = category;
        this.event = event;
    }

    public int getPro_id() {
        return pro_id;
    }

    public void setPro_id(int pro_id) {
        this.pro_id = pro_id;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public double getScreen_size() {
        return screen_size;
    }

    public void setScreen_size(double screen_size) {
        this.screen_size = screen_size;
    }

    public String getScreen_tech() {
        return screen_tech;
    }

    public void setScreen_tech(String screen_tech) {
        this.screen_tech = screen_tech;
    }

    public String getBackCam() {
        return backCam;
    }

    public void setBackCam(String backCam) {
        this.backCam = backCam;
    }

    public String getFrontCam() {
        return frontCam;
    }

    public void setFrontCam(String frontCam) {
        this.frontCam = frontCam;
    }

    public String getChip() {
        return chip;
    }

    public void setChip(String chip) {
        this.chip = chip;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public String getInternal_mem() {
        return internal_mem;
    }

    public void setInternal_mem(String internal_mem) {
        this.internal_mem = internal_mem;
    }

    public String getPIN() {
        return PIN;
    }

    public void setPIN(String PIN) {
        this.PIN = PIN;
    }

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public String getScr_resol() {
        return scr_resol;
    }

    public void setScr_resol(String scr_resol) {
        this.scr_resol = scr_resol;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getBluetooth() {
        return bluetooth;
    }

    public void setBluetooth(String bluetooth) {
        this.bluetooth = bluetooth;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }

    public int getRating_score() {
        return rating_score;
    }

    public void setRating_score(int rating_score) {
        this.rating_score = rating_score;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    @Override
    public String toString() {
        return "Product{" + "pro_id=" + pro_id + ", pro_name=" + pro_name + ", quantity=" + quantity + ", price=" + price + ", discount=" + discount + ", edition=" + edition + ", screen_size=" + screen_size + ", screen_tech=" + screen_tech + ", backCam=" + backCam + ", frontCam=" + frontCam + ", chip=" + chip + ", ram=" + ram + ", internal_mem=" + internal_mem + ", PIN=" + PIN + ", sim=" + sim + ", OS=" + OS + ", scr_resol=" + scr_resol + ", size=" + size + ", weight=" + weight + ", bluetooth=" + bluetooth + ", img_path=" + img_path + ", rating_score=" + rating_score + ", category=" + category + ", event=" + event + '}';
    }
}
