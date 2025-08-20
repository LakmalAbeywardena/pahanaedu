<%@ page import="com.pahanaedu.pahanaedu.model.Item" %>
<%
    Item item = (Item) request.getAttribute("item");
    boolean isEdit = (item != null);
%>
<html>
<head><title><%= isEdit ? "Edit" : "Add New" %> Item</title></head>
<body>
<h2><%= isEdit ? "Edit" : "Add New" %> Item</h2>

<% if (request.getAttribute("error") != null) { %>
<p style="color:red"><%= request.getAttribute("error") %></p>
<% } %>

<form method="post" action="ItemServlet">
    <input type="hidden" name="itemId" value="<%= isEdit ? item.getItemId() : "" %>" />
    Name: <input type="text" name="name" value="<%= isEdit ? item.getName() : "" %>" required /><br/>
    Description: <input type="text" name="description" value="<%= isEdit ? item.getDescription() : "" %>" /><br/>
    Price: <input type="text" name="price" value="<%= isEdit ? item.getPrice() : "" %>" required /><br/>
    <input type="submit" value="<%= isEdit ? "Update" : "Add" %> Item" />
</form>

<a href="ItemServlet">Back to Items List</a>
</body>
</html>
