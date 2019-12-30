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
    <title>Registration</title>
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
            <a href="${pageContext.request.contextPath}/index.jsp">Главная</a>
            <a href="us.jsp">О нас</a>
            <a href="cart.jsp">Корзина</a>
            <a href="login.jsp">Вход</a>
            <a href="registration.jsp">Регистрация</a>
        </nav>
    </div>
</header>
<main id="main">
    <form action="security" class="form-register" method="post">
        <h1 title="Форма для регистрации" class="h1-register text-uppercase">Регистрация</h1>

        <div class="group">
            <label> Имя пользователя:
                <input type="text" class="input-register" required name="username" pattern="[a-zA-Z0-9]+">
            </label>
        </div>

        <div class="group">
            <label>E-mail:
                <input type="email"  class="input-register" required name="email" >
            </label>
        </div>

        <div class="group">
            <label>Номер телефона:
                <input class="input-register" required name="phone" pattern="\+?\d+">
            </label>
        </div>

        <div class="group">
            <label>Пароль:
                <input type="password" class="input-register" required name="password">
            </label>
        </div>

        <div style="text-align: center;">
            <input class="button-register button-register-default" value="Создать аккаунт" type="submit">
        </div>
    </form>
</main>
<footer id="footer"></footer>
</body>
</html>
