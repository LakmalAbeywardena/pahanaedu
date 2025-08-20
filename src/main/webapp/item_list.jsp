<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.pahanaedu.model.Item" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("itemList");
%>
<html>
<head><title>Items - Pahana Edu</title></head>
<body>
<h2>Items</h2>
<a href="ItemServlet?action=new">Add New Item</a>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th><th>Name</th><th>Description</th><th>Price</th><th>Actions</th>
    </tr>
    <%
        if (items != null) {
            for (Item item : items) {
    %>
    <tr>
        <td><%= item.getItemId() %></td>
        <td><%= item.getName() %></td>
        <td><%= item.getDescription() %></td>
        <td><%= item.getPrice() %></td>
        <td>
            <a href="ItemServlet?action=edit&id=<%= item.getItemId() %>">Edit</a> |
            <a href="ItemServlet?action=delete&id=<%= item.getItemId() %>" onclick="return confirm('Are you sure?');">Delete</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
<a href="CustomerServlet">Go to Customers</a>
<a href="home">Go to Home</a>
</body>
</html>
