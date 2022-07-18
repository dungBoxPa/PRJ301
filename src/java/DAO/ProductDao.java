/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Text.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Characteristics;
import model.Event;
import model.Product;

/**
 *
 * @author Windows 10 TIMT
 */
public class ProductDao {

    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;

    public void addNewEvent() {
        String sql = "insert into Product_characteristics values(?)";
    }

    public void delete(int id) {
        String sql = "delete from Product where pro_id = ?";
        String sql1 = "delete from chosen_characteristics where product_id = ?";
        String sql2 = "DBCC CHECKIDENT ('Product', RESEED, ?)";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql1);
            ps.setInt(1, id);
            ps.executeUpdate();

            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            
            ps = connection.prepareStatement(sql2);
            ps.setInt(1, id-1);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(Product p) {
        String sql = "UPDATE Product\n"
                + "   SET quantity = ?\n"
                + "      ,price = ?\n"
                + "      ,discount = ?\n"
                + "      ,screen_size = ?\n"
                + "      ,screen_tech = ?\n"
                + "      ,chip = ?\n"
                + "      ,ram = ?\n"
                + "      ,internal_mem = ?\n"
                + "      ,pin = ?\n"
                + "      ,sim = ?\n"
                + "      ,OS = ?\n"
                + "      ,screen_resol = ?\n"
                + "      ,size = ?\n"
                + "      ,weight = ?\n"
                + "      ,bluetooth = ?\n"
                + " WHERE pro_id = ?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, p.getQuantity());
            ps.setInt(2, p.getPrice());
            ps.setInt(3, p.getDiscount());
            ps.setDouble(4, p.getScreen_size());
            ps.setString(5, p.getScreen_tech());
            ps.setString(6, p.getChip());
            ps.setInt(7, p.getRam());
            ps.setString(8, p.getInternal_mem());
            ps.setString(9, p.getPIN());
            ps.setString(10, p.getSim());
            ps.setString(11, p.getOS());
            ps.setString(12, p.getScr_resol());
            ps.setString(13, p.getSize());
            ps.setInt(14, p.getWeight());
            ps.setString(15, p.getBluetooth());
            ps.setInt(16, p.getPro_id());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuantity(int id, int quantity) {
        String sql = "update Product set quantity = ? where pro_id = ?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insert(Product p) {
        String sql = "insert into Product values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getPro_name());
            ps.setInt(2, p.getQuantity());
            ps.setInt(3, p.getPrice());
            ps.setInt(4, p.getDiscount());
            ps.setString(5, p.getEdition());
            ps.setDouble(6, p.getScreen_size());
            ps.setString(7, p.getScreen_tech());
            ps.setString(8, p.getBackCam());
            ps.setString(9, p.getFrontCam());
            ps.setString(10, p.getChip());
            ps.setInt(11, p.getRam());
            ps.setString(12, p.getInternal_mem());
            ps.setString(13, p.getPIN());
            ps.setString(14, p.getSim());
            ps.setString(15, p.getOS());
            ps.setString(16, p.getScr_resol());
            ps.setString(17, p.getSize());
            ps.setInt(18, p.getWeight());
            ps.setString(19, p.getBluetooth());
            ps.setString(20, p.getImg_path());
            ps.setInt(21, p.getRating_score());
            ps.setInt(22, p.getCategory().getCate_id());
            ps.setInt(23, p.getEvent().getEvent_id());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Product getProductByID(int pro_id) {
        String sql = "select A.pro_id,\n"
                + "A.pro_name,\n"
                + "A.quantity,\n"
                + "A.price,\n"
                + "A.discount,\n"
                + "A.edition,\n"
                + "A.screen_size,\n"
                + "A.screen_tech,\n"
                + "A.back_camera,\n"
                + "A.front_camera,\n"
                + "A.chip,\n"
                + "A.ram, \n"
                + "A.internal_mem,\n"
                + "A.pin,\n"
                + "A.sim,\n"
                + "A.OS,\n"
                + "A.screen_resol,\n"
                + "A.size,\n"
                + "A.weight,\n"
                + "A.bluetooth,\n"
                + "A.img_path,\n"
                + "A.rating_score,\n"
                + "D.cat_id,\n"
                + "D.cat_name,\n"
                + "C.event_id,\n"
                + "C.event_name\n"
                + "from Product A, Event C, Category D "
                + "where A.event_id = C.event_id and D.cat_id=A.cate_id and pro_id=?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, pro_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category category = new Category(rs.getInt("cat_id"), rs.getString("cat_name"));
                Event event = new Event(rs.getInt("event_id"), rs.getString("event_name"));
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getInt(19),
                        rs.getString(20),
                        rs.getString(21),
                        rs.getInt(22),
                        category,
                        event
                );
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Product> getProductByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select A.pro_id,\n"
                + "A.pro_name,\n"
                + "A.quantity,\n"
                + "A.price,\n"
                + "A.discount,\n"
                + "A.edition,\n"
                + "A.screen_size,\n"
                + "A.screen_tech,\n"
                + "A.back_camera,\n"
                + "A.front_camera,\n"
                + "A.chip,\n"
                + "A.ram, \n"
                + "A.internal_mem,\n"
                + "A.pin,\n"
                + "A.sim,\n"
                + "A.OS,\n"
                + "A.screen_resol,\n"
                + "A.size,\n"
                + "A.weight,\n"
                + "A.bluetooth,\n"
                + "A.img_path,\n"
                + "A.rating_score,\n"
                + "D.cat_id,\n"
                + "D.cat_name,\n"
                + "C.event_id,\n"
                + "C.event_name\n"
                + "from Product A, Event C, Category D "
                + "where A.event_id = C.event_id and D.cat_id=A.cate_id";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt("cat_id"), rs.getString("cat_name"));
                Event event = new Event(rs.getInt("event_id"), rs.getString("event_name"));
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getInt(19),
                        rs.getString(20),
                        rs.getString(21),
                        rs.getInt(22),
                        category,
                        event
                ));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Product> getAllProductByCategoryID(int cate_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select A.pro_id,\n"
                + "A.pro_name,\n"
                + "A.quantity,\n"
                + "A.price,\n"
                + "A.discount,\n"
                + "A.edition,\n"
                + "A.screen_size,\n"
                + "A.screen_tech,\n"
                + "A.back_camera,\n"
                + "A.front_camera,\n"
                + "A.chip,\n"
                + "A.ram, \n"
                + "A.internal_mem,\n"
                + "A.pin,\n"
                + "A.sim,\n"
                + "A.OS,\n"
                + "A.screen_resol,\n"
                + "A.size,\n"
                + "A.weight,\n"
                + "A.bluetooth,\n"
                + "A.img_path,\n"
                + "A.rating_score,\n"
                + "D.cat_id,\n"
                + "D.cat_name,\n"
                + "C.event_id,\n"
                + "C.event_name\n"
                + "from Product A, Event C, Category D "
                + "where A.event_id = C.event_id and D.cat_id=A.cate_id and A.cate_id = ?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cate_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt("cat_id"), rs.getString("cat_name"));
                Event event = new Event(rs.getInt("event_id"), rs.getString("event_name"));
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16),
                        rs.getString(17),
                        rs.getString(18),
                        rs.getInt(19),
                        rs.getString(20),
                        rs.getString(21),
                        rs.getInt(22),
                        category,
                        event
                ));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Characteristics> getAllCharacterByProID(int pro_id) {
        List<Characteristics> charList = new ArrayList<>();
        String sql = "select id, detail, product_id from Product_characteristics A, chosen_characteristics B "
                + "where B.character_id = A.id and product_id=?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, pro_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("product_id"));
                charList.add(new Characteristics(rs.getInt(1), rs.getString(2), product));
            }
            return charList;
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public List<Characteristics> getAllCharacteristicses() {
        List<Characteristics> list = new ArrayList<>();
        String sql = "select id, detail from Product_characteristics";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Characteristics(rs.getInt("id"), rs.getString("detail")));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertCharactersToProduct(Characteristics chars) {
        String sql = "insert into chosen_characteristics values(?,?)";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, chars.getId());
            ps.setInt(2, chars.getProduct().getPro_id());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
         String sql = "UPDATE Product\n"
                + "   SET quantity = ?\n"
                + "      ,price = ?\n"
                + "      ,discount = ?\n"
                + "      ,screen_size = ?\n"
                + "      ,screen_tech = ?\n"
                + "      ,chip = ?\n"
                + "      ,ram = ?\n"
                + "      ,internal_mem = ?\n"
                + "      ,pin = ?\n"
                + "      ,sim = ?\n"
                + "      ,OS = ?\n"
                + "      ,screen_resol = ?\n"
                + "      ,size = ?\n"
                + "      ,weight = ?\n"
                + "      ,bluetooth = ?\n"
                + " WHERE pro_id = ?";
         
//         this.pro_id = pro_id;
//        this.quantity = quantity;
//        this.price = price;
//        this.discount = discount;
//        this.screen_size = screen_size;
//        this.screen_tech = screen_tech;
//        this.chip = chip;
//        this.ram = ram;
//        this.internal_mem = internal_mem;
//        this.PIN = PIN;
//        this.sim = sim;
//        this.OS = OS;
//        this.scr_resol = scr_resol;
//        this.size = size;
//        this.weight = weight;
//        this.bluetooth = bluetooth;
        ProductDao dao = new ProductDao();
        dao.update(new Product(2, 20, 1000000, 10, 6.7, "dsagdfdsfg", "zcvzxc", 8, "xcvxcv", "EQRwer", "zcv", "tert", "adgdfsg", "weytrey", 110, "sdasadf"));
//        List<Characteristics> pro = dao.getAllCharacteristicses();
//        for (Characteristics characteristics : pro) {
//            System.out.println(characteristics.toString());
//        }
//        System.out.println(pro.toString());

    }

}
