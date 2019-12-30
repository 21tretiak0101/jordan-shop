<%@ page import="logic.Customer" %>
<%--
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
    <title>About Us</title>
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
                <a href="us.jsp">О нас</a>
                <a href="cart.jsp">Корзина</a>

                <%
                    Customer customer = (Customer) session.getAttribute("customer");
                    if(customer!=null && customer.isLogin()){
                        out.print("<a href=\"/index.jsp\">" + ((Customer) session.getAttribute("customer")).getName() + "</a>");
                        out.print("        <button type=\"submit\" name=\"status\" value=\"logOut\">Выход</button>\n");
                    }
                    else {
                        out.print("  <a href=\"login.jsp\">Вход</a>\n" +
                                "      <a href=\"registration.jsp\">Регистрация</a>");
                    }

                %>
            </form>
        </nav>
    </div>
</header>

<main id="main">
    <div>
        <p class="text1">О компании</p>
        <p class="text2">
            Jordan – один из крупнейших интернет-магазинов модной одежды, кроссовок,
            <br>
            аксессуаров, существующий уже 15 лет! Из года в год мы
            <br>
            продолжаем развиваться, расширять географию присутствия и улучшать
            <br>
            качество обслуживания, чтобы радовать Вас каждый день!
        </p>
    </div>
    <div class="contacts">
        <nav class="header-nav">
            <a href="https://www.facebook.com/nike" target="_blank">
                <img src="${pageContext.request.contextPath}/img/facebook.png"
                     alt="facebook">
            </a>
            <a href="https://twitter.com/Nike" target="_blank">
                <img src="${pageContext.request.contextPath}/img/twitter.png"
                     alt="twitter">
            </a>
            <a href="https://www.instagram.com/nike/" target="_blank">
                <img src="${pageContext.request.contextPath}/img/instagram.png" alt="instagram">
            </a>
            <a href="https://www.youtube.com/user/nike" target="_blank">
                <img src="${pageContext.request.contextPath}/img/youtube.png"
                     alt="youtube">
            </a>
        </nav>
    </div>
</main>
</body>
</html>



