<%@ page import="com.ttre16.jordan.logic.Customer" %><%--
  Created by IntelliJ IDEA.
  User: ttre16
  Date: 12/27/19
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jordan 33</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
                <a href="${pageContext.request.contextPath}/head/us.jsp">О нас</a>
                <a href="${pageContext.request.contextPath}/head/cart.jsp">Корзина</a>
                <%
                    Customer customer = (Customer) session.getAttribute("customer");
                    if(customer!=null && customer.isLogin())
                        out.print("<a href=\"/index.jsp\">" + customer.getName() + "</a>\n" +
                                "<button type=\"submit\" name=\"status\" value=\"logOut\">Выход</button>");
                    else
                        out.print("<a href=\"/head/login.jsp\">Вход</a>\n" +
                                "<a href=\"/head/registration.jsp\">Регистрация</a>");
                %>
            </form>
        </nav>
    </div>
</header>
<main id="main">
    <div class="separate-page">
        <h1>AIR JORDAN XXXIII
            BLACK / DARK SMOKE
            GREY — SAIL
        </h1>
        <img src="${pageContext.request.contextPath}/img/jordan33.png" alt="jordan33" align="left">
        <p>175$</p>
        <ul>
            <li>
                <strong>Style Code:</strong>
                BV5072-001
            </li>
            <li>
                <strong>Original Release:</strong>
                October 2018
            </li>
            <li>
                <strong>Designer:</strong>
                Tate Kuerbis
            </li>
            <li>
                <strong>Collection:</strong>
                Jordan Brand
            </li>
        </ul>
    </div>
    <form action="jordan" method="post">
        <% session.setAttribute("add", true);%>
        <input type="hidden" name="name" value="jordan33">
        <input type="submit" class="button-register button-register-default" value="Добавить в корзину">
    </form>
</main>
<footer id="footer"></footer>
</body>
</html>




