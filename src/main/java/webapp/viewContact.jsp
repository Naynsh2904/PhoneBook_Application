<%
    if ((Integer) session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View contacts</title>
    <%@include file="Component/allCall.jsp"%>
</head>
<body>
    <%@include file="Component/navbar.jsp"%>

    <div class="container mt-5 pt-5">
        <table class="table table-success table-striped table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>NAME</th>
                    <th>MOBILE NUMBER</th>
                    <th>EMAIL ID</th>
                    <th>UPDATE / DELETE</th>
                </tr>
            </thead>
            <%
                String url = "jdbc:mysql://localhost:3306/phonebook";
                String dbUser = "root";
                String dbPass = "root";
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    // Establish connection to the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(url, dbUser, dbPass);

                    // Handle Delete Action
                    if (request.getParameter("delete") != null) {
                        int id = Integer.parseInt(request.getParameter("id"));
                        PreparedStatement ps1 = con.prepareStatement("DELETE FROM contacts WHERE id=? ");
                        ps1.setInt(1, id);
                        ps1.executeUpdate();
                        out.print("<script>alert('Contact deleted successfully!')</script>");
                    }

                    // Handle Update Action
                    if (request.getParameter("update") != null) {
                        String name = request.getParameter("name");
                        String phone = request.getParameter("phone");
                        String email = request.getParameter("email");
                        int id = Integer.parseInt(request.getParameter("id"));

                        PreparedStatement ps3 = con.prepareStatement("UPDATE contacts SET name=?, phone=?, email=? WHERE id=?");
                        ps3.setString(1, name);
                        ps3.setString(2, phone);
                        ps3.setString(3, email);
                        ps3.setInt(4, id);
                        ps3.executeUpdate();
                        out.print("<script>alert('Contact updated successfully!')</script>");
                    }

                    // Retrieve contacts for the logged-in user
                    ps = con.prepareStatement("SELECT * FROM contacts WHERE userId=?");
                    ps.setInt(1, userId);
                    rs = ps.executeQuery();

                    // Loop through the result set and display contacts
                    while (rs.next()) {
            %>
                        <tbody class="table-group-divider">
                            <tr>
                                <td><%= rs.getString("name") %></td>
                                <td><%= rs.getString("phone") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td class="">
                                    <button class="btn btn-outline-dark fw-semibold text-center py-1 "
                                            type="button" data-bs-toggle="offcanvas"
                                            data-bs-target="#offcanvasExample<%= rs.getInt("id") %>"
                                            aria-controls="offcanvasExample<%= rs.getInt("id") %>">
                                        UPDATE/DELETE
                                    </button>

                                    <div class="offcanvas offcanvas-start" tabindex="-1"
                                         id="offcanvasExample<%= rs.getInt("id") %>"
                                         aria-labelledby="offcanvasExampleLabel<%= rs.getInt("id") %>">
                                        <div class="offcanvas-header">
                                            <h5 class="offcanvas-title fw-bold"
                                                id="offcanvasExampleLabel<%= rs.getInt("id") %>">
                                                UPDATE / DELETE
                                            </h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                                    aria-label="Close"></button>
                                        </div>

                                        <div class="offcanvas-body">
                                            <form class="form-control py-5 bg-secondary-subtle border-dark"
                                                  action="#" method="get">
                                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
                                                <input class="form-control mb-2" value="<%= rs.getString("name") %>" name="name" type="text" />
                                                <input class="form-control mb-2" value="<%= rs.getString("phone") %>" name="phone" type="tel" />
                                                <input class="form-control mb-2" value="<%= rs.getString("email") %>" name="email" type="email" />

                                                <div class="d-flex justify-content-evenly pt-2">
                                                    <button type="submit" class="btn btn-outline-success " name="update">Update</button>
                                                    <button type="submit" class="btn btn-outline-danger " name="delete">Delete</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();  // Print the error for debugging
                } finally {
                    // Close resources to avoid memory leaks
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
    </div>

    <%@include file="Component/footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</body>
</html>
