<%@ page import="logic.Customer" %><%--
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
    <title>Shorts</title>
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

                    if(customer!=null && customer.isLogin()){
                        out.print("<a href=\"/index.jsp\">" + ((Customer) session.getAttribute("customer")).getName() + "</a>");
                        out.print("        <button type=\"submit\" name=\"status\" value=\"logOut\">Выход</button>\n");
                    }
                    else {
                        out.print("  <a href=\"/head/login.jsp\">Вход</a>\n" +
                                "      <a href=\"/head/registration.jsp\">Регистрация</a>");
                    }

                %>
            </form>
        </nav>
    </div>
</header>
<main id="main">
    <div class="clothes-page">
        <h1>Jordan Jumpman Classics Shorts</h1>
        <div id="left">
            <img src="${pageContext.request.contextPath}/img/shorts.png" alt="shorts">
        </div>
        <div id="right">
            <p>50$</p>
            <ul>
                <li>
                    <strong>Style Code:</strong>
                    CK2854-010
                </li>
                <li>
                    <strong>Fabric:</strong>
                    62% cotton 38% polyester. Pocket Bags: 100% cotton.
                </li>
                <li>
                    <strong>Shown:</strong>
                    Black/Gym Red/White
                </li>
                <li>
                    <strong>Collection:</strong>
                    Jordan Brand
                </li>
            </ul>
            <form action="jordan" method="post">
                <input type="hidden" name="name" value="shorts">
                <input type="submit" class="button-login button-login-default" value="Добавить в корзину">
            </form>
        </div>
    </div>
</main>
</body>
</html>