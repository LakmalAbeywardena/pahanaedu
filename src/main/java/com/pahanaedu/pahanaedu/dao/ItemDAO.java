package com.pahanaedu.pahanaedu.dao;

import com.pahanaedu.pahanaedu.model.Item;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {
    private Connection conn;

    public ItemDAO() throws SQLException, ClassNotFoundException {
        conn = DBConnection.getInstance().getConnection();
    }

    public boolean addItem(Item item) throws SQLException {
        String sql = "INSERT INTO items (name, description, price) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, item.getName());
        ps.setString(2, item.getDescription());
        ps.setDouble(3, item.getPrice());
        return ps.executeUpdate() > 0;
    }

    public boolean updateItem(Item item) throws SQLException {
        String sql = "UPDATE items SET name=?, description=?, price=? WHERE item_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, item.getName());
        ps.setString(2, item.getDescription());
        ps.setDouble(3, item.getPrice());
        ps.setInt(4, item.getItemId());
        return ps.executeUpdate() > 0;
    }

    public Item getItemById(int id) throws SQLException {
        String sql = "SELECT * FROM items WHERE item_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Item(
                    rs.getInt("item_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price")
            );
        }
        return null;
    }

    public List<Item> getAllItems() throws SQLException {
        List<Item> items = new ArrayList<>();
        String sql = "SELECT * FROM items";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            items.add(new Item(
                    rs.getInt("item_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price")
            ));
        }
        return items;
    }

    public boolean deleteItem(int id) throws SQLException {
        String sql = "DELETE FROM items WHERE item_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        return ps.executeUpdate() > 0;
    }
}
