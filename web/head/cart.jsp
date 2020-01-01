<%@ page import="com.ttre16.jordan.logic.Customer" %><%--
  Created by IntelliJ IDEA.
  User: ttre16
  Date: 12/27/19
  Time: 12:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <%session.setAttribute("add", false);%>
</head>
<body>
<header id="header">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/index.jsp">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
            </a>
        </div>
        <nav class="header-nav">
            <form action="security" method="get">
                <a href="${pageContext.request.contextPath}/index.jsp">Главная</a>
                <a href="us.jsp">О нас</a>
                <a href="cart.jsp">Корзина</a>

                <%
                    Customer customer = (Customer) session.getAttribute("customer");
                    if(customer!=null && customer.isLogin()){
                        customer.getCart().load();
                        out.print("<a href=\"/index.jsp\">" + customer.getName() + "</a>\n" +
                                "<button type=\"submit\" name=\"status\" value=\"logOut\">Выход</button>\n");
                    }
                    else
                        out.print("<a href=\"login.jsp\">Вход</a>\n" +
                                "<a href=\"registration.jsp\">Регистрация</a>");
                %>
            </form>
        </nav>
    </div>
</header>
<main id="main">
    <%
        if(customer == null || customer.getCart().getProducts().size() == 0)
           out.print("<p class=\"text1\">В вашей корзине пока ничего нет<p>" +
                     "<p class=\"text2\">Корзина ждет, что ее наполнят. Желаем приятных покупок!</p>");
        else{
           out.print("<center>" +
                     "<table>" +
                     "<caption>" +
                     "<h1 class=\"h1-cart\">Корзина</h1>" +
                     "</caption>" +
                     "<tr>" +
                     "<th colspan=\"2\">Product</th>" +
                     "<th>Price</th>" +
                     "<th></th>" +
                     "</tr>");
           out.print(customer.getCart().printCart());
           out.print("</table>" +
                     "<form action=\"jordan\" method=\"post\">" +
                     "<input name=\"name\" type=\"hidden\" value=\"removeAll\">" +
                     "<input class=\"button-register button-register-default\" value=\"Очистить корзину\" type=\"submit\">" +
                     "</form>" +
                     "</center>");
    }
    %>
</main>
<footer id="footer"></footer>
</body>
</html>
