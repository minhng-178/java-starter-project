/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.AccountDTO;
import entity.CartDTO;
import entity.CategoryDTO;
import entity.ProductsDTO;
import entity.SizeDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DBUtils;

/**
 *
 * @author ACER
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
//==============================================================================
    //ProductsDAO
//==============================================================================

    public List<ProductsDTO> getAllProducts(int page) throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblProducts\n"
                + "ORDER BY product_id\n"
                + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, (page - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductsDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;

    }

    public int getTotalPage() throws SQLException {
        String sql = "SELECT COUNT(*) AS TOTAL FROM tblProducts";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public void deleteProduct(String pid) throws SQLException {
        String sql = "DELETE FROM tblProducts WHERE product_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (pid != null) {
                ps.setString(1, pid);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void insertProduct(String name, String title, String description, String price, String image, String category, int id) throws SQLException {
        String sql = "INSERT INTO tblProducts (product_name, title, description, price, image, category_id, user_id) \n"
                + "VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (name != null && title != null && description != null && price != null && image != null && category != null && id != 0) {
                ps.setString(1, name);
                ps.setString(2, title);
                ps.setString(3, description);
                ps.setString(4, price);
                ps.setString(5, image);
                ps.setString(6, category);
                ps.setInt(7, id);
            }
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateProduct(String name, String title, String description, String price, String image, String category, String pid) throws SQLException {
        String sql = "UPDATE tblProducts \n"
                + "SET \n"
                + "product_name = ?, \n"
                + "title = ?, \n"
                + "description = ?,\n"
                + "price = ?, \n"
                + "image = ?, \n"
                + "category_id = ?\n"
                + "WHERE product_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (name != null && title != null && description != null && price != null && image != null && category != null && pid != null) {
                ps.setString(1, name);
                ps.setString(2, title);
                ps.setString(3, description);
                ps.setString(4, price);
                ps.setString(5, image);
                ps.setString(6, category);
                ps.setString(7, pid);
            }
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<ProductsDTO> getProductByCID(String id, int page) throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblProducts \n"
                + "WHERE category_id = ?\n"
                + "ORDER BY product_id\n"
                + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";

        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setInt(2, (page - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductsDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;

    }

    public ProductsDTO getProductByID(String id) throws SQLException {
        String sql = "SELECT * FROM tblProducts\n"
                + "WHERE product_id = ?";

        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (id != null) {
                ps.setString(1, id);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ProductsDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public List<ProductsDTO> getProductByUserID(int id, int page) throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblProducts WHERE user_id = ?\n"
                + "ORDER BY user_id\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";

        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (id != 0) {
                ps.setInt(1, id);
                ps.setInt(2, (page - 1) * 5);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductsDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;

    }

    public int getTotalPageByUserID(int id) throws SQLException {
        String sql = "SELECT COUNT(*) AS TOTAL FROM tblProducts WHERE user_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public List<ProductsDTO> searchByName(String txt, int page) throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblProducts\n"
                + "WHERE product_name LIKE ?\n"
                + "ORDER BY product_id\n"
                + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";

        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (!txt.equals("")) {
                ps.setString(1, "%" + txt + "%");
                ps.setInt(2, (page - 1) * 12);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductsDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductsDTO> searchBySize(String txt, int page) throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        String sql = "SELECT p.product_id AS product_id,p.product_name AS product_name,p.title AS product_title ,p.image AS product_img, p.price AS product_price, s.size_name AS product_size\n"
                + "FROM tblProducts p\n"
                + "JOIN tblSize s ON p.product_id = s.product_id\n"
                + "WHERE s.size_name LIKE ?\n"
                + "ORDER BY product_id\n"
                + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (!txt.equals("")) {
                ps.setString(1, "%" + txt + "%");
                ps.setInt(2, (page - 1) * 12);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductsDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getTotalProducts() throws SQLException {
        String sql = "SELECT COUNT(*)AS TotalProducts FROM tblProducts";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalProducts");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public int getTotalQuantity() throws SQLException {
        String sql = "SELECT SUM(quantity) AS TotalQuantity FROM tblProducts";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalQuantity");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }
//==============================================================================
    //CategoryDAO
//==============================================================================

    public List<CategoryDTO> getAllCategory() throws SQLException {
        List<CategoryDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblCategory";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CategoryDTO(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
//==============================================================================
    //AccountDAO
//==============================================================================

    public AccountDTO login(String user, String pass) throws SQLException {
        String sql = "SELECT * FROM tblAccount\n"
                + "WHERE user_name = ?\n"
                + "AND password = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (user != null && pass != null) {
                ps.setString(1, user);
                ps.setString(2, pass);
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                return new AccountDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6)
                );
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return null;

    }

    public AccountDTO checkAccountExist(String user) throws SQLException {
        String sql = "SELECT * FROM tblAccount\n"
                + "WHERE user_name = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (user != null) {
                ps.setString(1, user);
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                return new AccountDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return null;

    }

    public void signUp(String user, String pass) throws SQLException {
        String sql = "INSERT INTO tblAccount (user_name, password, is_available, is_sell, is_admin)\n"
                + "VALUES(?, ?, 1, 0, 0)";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (user != null && pass != null) {
                ps.setString(1, user);
                ps.setString(2, pass);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<AccountDTO> getAllSeller(int id, int page) throws SQLException {
        ArrayList<AccountDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblAccount WHERE is_admin <> ?\n"
                + "ORDER BY user_id\n"
                + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, (page - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AccountDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getTotalPageByAdmin(int id) throws SQLException {
        String sql = "SELECT COUNT(*) AS TOTAL FROM tblAccount WHERE is_admin <> ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public AccountDTO getAccountbyUserID(int id) throws SQLException {
        String sql = "SELECT * FROM tblAccount WHERE user_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new AccountDTO(rs.getInt(1),
                        rs.getString(2), rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6));
            }

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public void addAccountbyAdmin(String user, String pass, String avail, String sell, String admin) throws SQLException {
        String sql = "INSERT INTO tblAccount (user_name, password, is_available, is_sell, is_admin)\n"
                + "VALUES(?, ?, ?, ?, ?)";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, avail);
            ps.setString(4, sell);
            ps.setString(5, admin);
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void deleteAccount(int id) throws SQLException {
        String sql = "DELETE FROM tblAccount WHERE user_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateAccount(String user, String pass, int available, int sell, int id) throws SQLException {
        String sql = "UPDATE tblAccount SET\n"
                + "user_name = ?,\n"
                + "password = ?,\n"
                + "is_available = ?,\n"
                + "is_sell = ?\n"
                + "WHERE user_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, available);
            ps.setInt(4, sell);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
    //==============================================================================
    //SizeDAO
    //==============================================================================

    public List<SizeDTO> getProductBySize(String id) throws SQLException {
        List<SizeDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM tblSize WHERE product_id = ?\n"
                + "ORDER BY size_name ASC";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SizeDTO(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public SizeDTO getSizeBySizeId(String id) throws SQLException {
        String sql = "SELECT * FROM tblSize WHERE size_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new SizeDTO(rs.getInt(1), 
                        rs.getInt(2), 
                        rs.getString(3), 
                        rs.getInt(4));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public int getTotalSizeByPid(String pid) throws SQLException {
        String sql = "SELECT SUM(quantity) AS TotalQuantity FROM tblSize WHERE product_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalQuantity");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public int getTotalSizeBySid(String sid) throws SQLException {
        String sql = "SELECT SUM(quantity) AS TotalQuantity FROM tblSize WHERE size_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, sid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalQuantity");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public void deleteSize(String id) throws SQLException {
        String sql = "DELETE FROM tblSize WHERE size_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (id != null) {
                ps.setString(1, id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void addSize(String size, String pid, String quantity) throws SQLException {
        String sql = "INSERT INTO tblSize (size_name, product_id, quantity)\n"
                + "VALUES (?, ?, ?)";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, size);
            ps.setString(2, pid);
            ps.setString(3, quantity);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateSize(String size, String quantity, String sid) throws SQLException {
        String sql = "UPDATE tblSize\n"
                + "SET\n"
                + "size_name = ?,\n"
                + "quantity = ?\n"
                + "WHERE size_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, size);
            ps.setString(2, quantity);
            ps.setString(3, sid);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public boolean isSizeExist(String pid, String size) throws SQLException {
        String sql = "SELECT * FROM tblSize WHERE product_id = ? and size_name = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            ps.setString(2, size);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }
    //==============================================================================
    //CartDAO
    //==============================================================================

    public List<CartDTO> getCartByUser(int uid) throws SQLException {
        List<CartDTO> list = new ArrayList<>();
        String sql = "SELECT c.user_id, p.product_name AS product_name, p.image AS product_img, p.price AS product_price, s.size_name AS product_size, c.quantity AS cart_quantity, p.product_id AS product_id, s.size_id AS size_id\n"
                + "FROM tblProducts p\n"
                + "JOIN tblSize s ON p.product_id = s.product_id\n"
                + "JOIN tblCart c ON p.product_id = c.product_id AND s.size_id = c.size_id\n"
                + "WHERE c.user_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CartDTO(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;

    }

    public void addCart(String pid, String sid, int uid, int quantity) throws SQLException {
        String sql = "MERGE tblCart AS target "
                + "USING (SELECT ?, ?, ?, ?) AS source ( product_id, size_id, user_id, quantity) "
                + "ON (target.user_id = source.user_id AND target.product_id = source.product_id AND target.size_id = source.size_id) "
                + "WHEN MATCHED THEN "
                + "UPDATE SET target.quantity = target.quantity + source.quantity "
                + "WHEN NOT MATCHED THEN "
                + "INSERT (user_id, product_id, size_id, quantity) "
                + "VALUES (source.user_id, source.product_id, source.size_id, source.quantity);";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, pid);
            ps.setString(2, sid);
            ps.setInt(3, uid);
            ps.setInt(4, quantity);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void deleteCart(String uid) throws SQLException {
        String sql = "DELETE FROM tblCart WHERE size_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            if (uid != null) {
                ps.setString(1, uid);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public int getTotalCart(int uid) throws SQLException {
        String sql = "SELECT COUNT(*) AS total FROM tblCart WHERE user_id = ?";
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return 0;
    }

    public static void main(String[] args) throws SQLException {
        DAO dao = new DAO();
        
    }
}
