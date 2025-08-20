<html>
<head><title>Bill Calculation</title></head>
<body>
<h2>Calculate Bill</h2>

<form method="get" action="BillServlet">
    Account Number: <input type="number" name="accountNumber" required />
    <input type="submit" value="Calculate Bill" />
</form>

<% if (request.getAttribute("error") != null) { %>
<p style="color:red"><%= request.getAttribute("error") %></p>
<% } %>

<% if (request.getAttribute("totalBill") != null) { %>
<p>Bill for Account <%= request.getAttribute("accountNumber") %> is Rs. <%= request.getAttribute("totalBill") %></p>
<% } %>

<a href="CustomerServlet">Back to Customers</a>
</body>
</html>
