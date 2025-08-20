<%@ page import="com.pahanaedu.pahanaedu.model.Customer" %>
<%
    Customer customer = (Customer) request.getAttribute("customer");
    boolean isEdit = (customer != null);
%>
<html>
<head>
    <title><%= isEdit ? "Edit" : "Add New" %> Customer</title>
</head>
<body>
<h2><%= isEdit ? "Edit" : "Add New" %> Customer</h2>

<% if (request.getAttribute("error") != null) { %>
<p style="color:red"><%= request.getAttribute("error") %></p>
<% } %>

<form method="post" action="CustomerServlet">
    <input type="hidden" name="accountNumber" value="<%= isEdit ? customer.getAccountNumber() : "" %>"/>
    Name: <input type="text" name="name" value="<%= isEdit ? customer.getName() : "" %>" required/><br/>
    Address: <input type="text" name="address" value="<%= isEdit ? customer.getAddress() : "" %>"/><br/>
    Telephone: <input type="text" name="telephone" value="<%= isEdit ? customer.getTelephone() : "" %>"/><br/>
    Units Consumed: <input type="number" name="unitsConsumed" min="0" value="<%= isEdit ? customer.getUnitsConsumed() : 0 %>" required/><br/>
    <input type="submit" value="<%= isEdit ? "Update" : "Add" %> Customer"/>
</form>
<a href="CustomerServlet">Back to Customer List</a>
</body>
</html>
