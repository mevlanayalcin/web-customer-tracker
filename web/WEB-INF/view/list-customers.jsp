<%--
  Created by IntelliJ IDEA.
  User: Mevlana
  Date: 26.01.2018
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Customers</title>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
        <div id="wrapper">
            <div id="header">
                <h2>CRM - Customer Relationship Manager</h2>
            </div>
        </div>


        <div id="container">

            <div id="content">

                <input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd';return false;" class="add-button"/>

                
                <!--  add our html table here -->

                <table>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>

                    <!-- loop over and print our customers -->
                    <c:forEach var="tempCustomer" items="${customers}">

                        <c:url var="updateLink" value="/customer/showFormForUpdate" >
                            <c:param name="customerId" value="${tempCustomer.id}" />
                        </c:url>

                        <c:url var="deleteLink" value="/customer/delete" >
                            <c:param name="customerId" value="${tempCustomer.id}" />
                        </c:url>

                        <tr>
                            <td> ${tempCustomer.firstName} </td>
                            <td> ${tempCustomer.lastName} </td>
                            <td> ${tempCustomer.email} </td>
                            <td><a href="${updateLink}" >Update</a> |
                                <a href="${deleteLink}" onclick="if( (!confirm('Are you sure you want to delete student ?'))) return false;" >
                                Delete</a> </td>
                        </tr>

                    </c:forEach>

                </table>

            </div>

        </div>
</body>
</html>
