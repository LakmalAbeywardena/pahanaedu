package com.pahanaedu.pahanaedu.servlet;

import com.pahanaedu.pahanaedu.dao.ItemDAO;
import com.pahanaedu.pahanaedu.model.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ItemServlet", value = "/ItemServlet")
public class ItemServlet extends HttpServlet {

    private ItemDAO itemDAO;

    @Override
    public void init() throws ServletException {
        try {
            itemDAO = new ItemDAO();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if (action == null) action = "list";

            switch (action) {
                case "new":
                    req.getRequestDispatcher("item_form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int id = Integer.parseInt(req.getParameter("id"));
                    Item item = itemDAO.getItemById(id);
                    req.setAttribute("item", item);
                    req.getRequestDispatcher("item_form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int deleteId = Integer.parseInt(req.getParameter("id"));
                    itemDAO.deleteItem(deleteId);
                    resp.sendRedirect("ItemServlet");
                    break;
                default:
                    List<Item> list = itemDAO.getAllItems();
                    req.setAttribute("itemList", list);
                    req.getRequestDispatcher("item_list.jsp").forward(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idStr = req.getParameter("itemId");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");

        String errorMsg = null;

        if (name == null || name.trim().isEmpty()) {
            errorMsg = "Name is required";
        } else if (priceStr == null || !priceStr.matches("\\d+(\\.\\d{1,2})?")) {
            errorMsg = "Price must be a valid number";
        }

        if (errorMsg != null) {
            req.setAttribute("error", errorMsg);
            req.getRequestDispatcher("item_form.jsp").forward(req, resp);
            return;
        }

        double price = Double.parseDouble(priceStr);

        try {
            if (idStr == null || idStr.isEmpty()) {
                // new item
                Item item = new Item();
                item.setName(name);
                item.setDescription(description);
                item.setPrice(price);
                itemDAO.addItem(item);
            } else {
                // update
                int id = Integer.parseInt(idStr);
                Item item = new Item(id, name, description, price);
                itemDAO.updateItem(item);
            }
            resp.sendRedirect("ItemServlet");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
