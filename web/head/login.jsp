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
    <title>Login</title>
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
    <form action="security" method="post" class="form-register">
        <h1 title="Форма для регистрации" class="h1-login text-uppercase">Авторизация</h1>
        <div class="group">
            <label> Имя пользователя:
                <input type="text" required name="username" class="input-register">
            </label>
        </div>
        <div class="group">
            <label> Пароль:
                <input type="password" required name="password" class="input-register">
            </label>
        </div>
        <div style="text-align: center;">
            <input class="button-register button-register-default" type="submit" value="Войти">
        </div>
    </form>
</main>
<footer id="footer"></footer>
</body>
</html>
