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
import model.Account;
import model.Member;

/**
 *
 * @author Windows 10 TIMT
 */
public class AcountDAO {

    private Connection connection;
    private PreparedStatement ps;
    private ResultSet rs;

    public void updateMember(Member member) {
        String sql = "update Member set email = ?, first_name = ?, last_name = ?, phone_num = ?, address = ? where user_id = ?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, member.getAccount().getUserName());
            ps.setString(2, member.getFirstName());
            ps.setString(3, member.getLastName());
            ps.setString(4, member.getPhoneNumber());
            ps.setString(5, member.getAddress());
            ps.setInt(6, member.getUser_id());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Member login(String username) {
        String sql = "select A.email, \n"
                + "A.password, \n"
                + "A.isAdmin, \n"
                + "B.user_id, \n"
                + "B.first_name, \n"
                + "B.last_name, \n"
                + "B.phone_num, \n"
                + "B.address \n"
                + "from login A inner join Member B on A.email = B.email where A.email=?";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getString(1), rs.getString(2), rs.getBoolean(3));
                return new Member(rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        account);
            }
        } catch (Exception ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void register(Member member) {
        String sql1 = "insert into login values(?,?,2)";
        String sql2 = "insert into Member values(?,?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql1);
            ps.setString(1, member.getAccount().getUserName());
            ps.setString(2, member.getAccount().getPassword());
            ps.executeUpdate();

            ps = connection.prepareStatement(sql2);
            ps.setString(1, member.getAccount().getUserName());
            ps.setString(2, member.getFirstName());
            ps.setString(3, member.getLastName());
            ps.setString(4, member.getPhoneNumber());
            ps.setString(5, member.getAddress());
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        AcountDAO dao = new AcountDAO();
        Member m = dao.login("admin");
        System.out.println(m.toString());
        dao.register(new Member("Maradona", "Diego", "123456", "Agentina", new Account("sa1", "sa1", false)));
    }

}
