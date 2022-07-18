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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Event;

/**
 *
 * @author Windows 10 TIMT
 */
public class CategoryDao {

    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;

    public void insertnewEvent(Event ev) {
        String sql = "insert into Event values(?)";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, ev.getEvent_name());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Event> getAllEvent() {
        List<Event> list = new ArrayList<>();
        String sql = "select * from Event";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Event(rs.getInt(1), rs.getString(2)));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Event checkEvent(int id) {
        String sql_stm = "select * from Event where event_id = ?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql_stm);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Event(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Category existedCategory(int id) {
        String sql_stm = "select * from Category where cat_id = ?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql_stm);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> catList = new ArrayList<>();
        String sql_stm = "select * from Category";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql_stm);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category cat = new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
                catList.add(cat);
            }
            return catList;
        } catch (Exception ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int countProductByCateId(int id) {
        String sql = "select distinct A.cat_name, count(B.pro_name) as countProduct "
                + "from Category A inner join Product B on A.cat_id = B.cate_id "
                + "where A.cat_id = ? "
                + "group by A.cat_id,A.cat_name";

        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(2);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public static void main(String[] args) {
        CategoryDao dao = new CategoryDao();
        System.out.println(dao.countProductByCateId(1));

    }
}
