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
    <title>Jordan VII</title>
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
    <div class="separate-page">
        <h1>AIR JORDAN VII OG
            BLACK / LIGHT
            GRAPHITE — BORDEAUX
        </h1>
        <img src="${pageContext.request.contextPath}/img/jordan7.png" alt="jordan7" align="left">
        <p>125$</p>
        <ul>
            <li>
                <strong>Style Code:</strong>
                130014 — 000
            </li>
            <li>
                <strong>Original Release:</strong>
                1992
            </li>
            <li>
                <strong>Designer:</strong>
                Tinker Hatfield
            </li>
            <li>
                <strong>Collection:</strong>
                DNA Archive
            </li>
        </ul>
    </div>
    <form action="jordan" method="post">
        <% session.setAttribute("add", true);%>
        <input type="hidden" name="name" value="jordan7">
        <input type="submit" class="button-register button-register-default" value="Добавить в корзину">
    </form>

</main>
<footer id="footer"></footer>
</body>
</html>




