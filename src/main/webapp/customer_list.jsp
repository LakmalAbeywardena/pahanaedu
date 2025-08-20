<%@ page import="java.util.List" %>
<%@ page import="com.pahanaedu.pahanaedu.model.Customer" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customerList");
%>
<html>
<head>
    <title>Customers - Pahana Edu</title>
</head>
<body>
<h2>Customers List</h2>
<a href="CustomerServlet?action=new">Add New Customer</a>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Account Number</th>
        <th>Name</th>
        <th>Address</th>
        <th>Telephone</th>
        <th>Units Consumed</th>
        <th>Actions</th>
    </tr>
    <%
        if (customers != null) {
            for (Customer c : customers) {
    %>
    <tr>
        <td><%= c.getAccountNumber() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getAddress() %></td>
        <td><%= c.getTelephone() %></td>
        <td><%= c.getUnitsConsumed() %></td>
        <td>
            <a href="CustomerServlet?action=edit&id=<%= c.getAccountNumber() %>">Edit</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>
