<%@ page import="logic.Customer" %><%--
  Created by IntelliJ IDEA.
  User: ttre16
  Date: 12/26/19
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Jordan Shop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<header id="header">
  <div class="container d-flex justify-content-between align-items-center">
    <div class="logo">
      <a href="index.jsp">
        <img src="img/logo.png" alt="logo">
      </a>

    </div>
    <nav class="header-nav">
      <form action="security" method="get">
      <a href="index.jsp">Главная</a>
      <a href="head/us.jsp">О нас</a>
        <a href="head/cart.jsp">Корзина</a>

        <%
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer!=null && customer.isLogin()){
          out.print("<a href=\"index.jsp\">" + ((Customer) session.getAttribute("customer")).getName() + "</a>");
          out.print("        <button type=\"submit\" name=\"status\" value=\"logOut\">Выход</button>\n");
        }
        else {
          out.print("  <a href=\"head/login.jsp\">Вход</a>\n" +
                  "      <a href=\"head/registration.jsp\">Регистрация</a>");
        }

      %>
      </form>
    </nav>
  </div>
</header>


<main>
  <section class="standart-section sneaker-wrap">
    <div class="container">
      <h3 class="section-title text-center">Кроссовки</h3>
      <div class="row d-flex flex-wrap">
        <div class="col-4">
          <div class="sneaker-item">
            <div>
              <a href="sneakers/jordan34.jsp" class="sneaker-img text-center"><img src="img/jordan34.png" alt="jordan34">
              </a>
              <h6 class="sneaker-title">
                <a href="sneakers/jordan34.jsp">AIR JORDAN XXXIV</a>
              </h6>
              <div class="sneaker-price text-right">
                <span>180$</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <div>
              <a href="sneakers/jordan33.jsp" class="sneaker-img text-center"><img src="img/jordan33.png" alt="jordan33">
              </a>
              <h6 class="sneaker-title">
                <a href="sneakers/jordan33.jsp">AIR JORDAN XXXIII</a>
              </h6>
              <div class="sneaker-price text-right">
                <span>175$</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <div>
              <a href="sneakers/jordan5.jsp" class="sneaker-img text-center"><img src="img/jordan5.png" alt="jordan5">
              </a>
              <h6 class="sneaker-title">
                <a href="sneakers/jordan5.jsp">AIR JORDAN V</a>
              </h6>
              <div class="sneaker-price text-right">
                <span>125$</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <div>
              <a href="sneakers/jordan29.jsp" class="sneaker-img text-center"><img src="img/jordan29.png" alt="jordan29">
              </a>
              <h6 class="sneaker-title">
                <a href="sneakers/jordan29.jsp">AIR JORDAN XX9</a>
              </h6>
              <div class="sneaker-price text-right">
                <span>225$</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <div>
              <a href="sneakers/jordan7.jsp" class="sneaker-img text-center"><img src="img/jordan7.png" alt="jordan7">
              </a>
              <h6 class="sneaker-title">
                <a href="sneakers/jordan7.jsp">AIR JORDAN VII</a>
              </h6>
              <div class="sneaker-price text-right">
                <span>125$</span>
              </div>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <div>
              <a href="sneakers/jordan16.jsp" class="sneaker-img text-center"><img src="img/jordan16.png" alt="jordan16">
              </a>
              <h6 class="sneaker-title">
                <a href="sneakers/jordan16.jsp">AIR JORDAN XVI</a>
              </h6>
              <div class="sneaker-price text-right">
                <span>160$</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <h3 class="section-title text-center">Одежда</h3>
      <div class="row d-flex flex-wrap">
        <div class="col-4">
          <div class="sneaker-item">
            <a href="clothes/grey_hoodie.jsp" class="sneaker-img text-center">
              <img src="img/grey_hoodie.png" alt="grey_hoodie">
            </a>
            <h6 class="sneaker-title">
              <a href="clothes/grey_hoodie.jsp">JORDAN Hoodie</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>60$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="clothes/t-shirt.jsp" class="sneaker-img text-center">
              <img src="img/t-shirt.png" alt="t-shirt">
            </a>
            <h6 class="sneaker-title">
              <a href="clothes/t-shirt.jsp">JORDAN T-Shirt</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>35$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="clothes/shorts.jsp" class="sneaker-img text-center">
              <img src="img/shorts.png" alt="shorts">
            </a>
            <h6 class="sneaker-title">
              <a href="clothes/shorts.jsp">JORDAN Shorts</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>50$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="clothes/t-shirt91.jsp" class="sneaker-img text-center">
              <img src="img/t-shirt91.png" alt="t-shirt91">
            </a>
            <h6 class="sneaker-title">
              <a href="clothes/t-shirt91.jsp">JORDAN T-Shirt 91</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>35$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="clothes/grey_cap.jsp" class="sneaker-img text-center">
              <img src="img/grey_cap.png" alt="grey_cap">
            </a>
            <h6 class="sneaker-title">
              <a href="clothes/grey_cap.jsp">JORDAN Grey Hat</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>32$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="clothes/black_cap.jsp" class="sneaker-img text-center">
              <img src="img/black_cap.png" alt="black_cap">
            </a>
            <h6 class="sneaker-title">
              <a href="clothes/black_cap.jsp">JORDAN Black Hat</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>50$</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <h3 class="section-title text-center">Аксессуары</h3>
      <div class="row d-flex flex-wrap">
        <div class="col-4">
          <div class="sneaker-item">
            <a href="other/black_bag.jsp" class="sneaker-img text-center">
              <img src="img/black_bag.png" alt="black_bag">
            </a>
            <h6 class="sneaker-title">
              <a href="other/black_bag.jsp">JORDAN Bag</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>75$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="other/ball.jsp" class="sneaker-img text-center">
              <img src="img/ball.png" alt="ball">
            </a>
            <h6 class="sneaker-title">
              <a href="other/ball.jsp">JORDAN Ball</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>50$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="other/white_socks.jsp" class="sneaker-img text-center">
              <img src="img/white_socks.png" alt="white_socks">
            </a>
            <h6 class="sneaker-title">
              <a href="other/white_socks.jsp">JORDAN White Socks</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>20$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="other/red_headband.jsp" class="sneaker-img text-center">
              <img src="img/red_headband.png" alt="red_headband">
            </a>
            <h6 class="sneaker-title">
              <a href="other/red_headband.jsp">JORDAN Red Headband</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>10$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="other/black_headband.jsp" class="sneaker-img text-center">
              <img src="img/black_headband.png" alt="black_headband">
            </a>
            <h6 class="sneaker-title">
              <a href="other/black_headband.jsp">JORDAN Black Headband</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>10$</span>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="sneaker-item">
            <a href="other/black_socks.jsp" class="sneaker-img text-center">
              <img src="img/black_socks.png" alt="black-socks">
            </a>
            <h6 class="sneaker-title">
              <a href="other/black_socks.jsp">JORDAN Black Socks</a>
            </h6>
            <div class="sneaker-price text-right">
              <span>22$</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class=""></section>
</main>
<footer>
</footer>
</body>
</html>