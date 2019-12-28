<%@ page import="logic.Customer" %><%--
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
            <a href="${pageContext.request.contextPath}/index.jsp">Главная</a>
            <a href="us.jsp">О нас</a>
            <a href="login.jsp">Вход</a>
            <a href="registration.jsp">Регистрация</a>
            <a href="cart.jsp">Корзина</a>
        </nav>
    </div>
</header>
<main id="main">
    <center>
        <table>
            <caption>
                <h1 class="h1-cart">Корзина</h1>
            </caption>
            <tr>
                <th colspan="2">Product</th>
                <th>Price</th>
                <th></th>
            </tr>
            <%
                Customer customer = (Customer) request.getSession().getAttribute("customer");
                customer.getCart().load();
                out.print(customer.getCart().printCart());
            %>
        </table>
        <form action="jordan" method="post">
           <input name="name" type="hidden" value="removeAll">
           <input class="button-register button-register-default" value="Очистить корзину" type="submit">
        </form>
    </center>
</main>

<footer id="footer"></footer>

</body>
</html>
