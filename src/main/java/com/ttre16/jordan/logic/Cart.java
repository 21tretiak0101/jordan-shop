package logic;

import java.sql.*;
import java.util.ArrayList;

public class Cart {
    private ArrayList<Product> products;
    private String customer_name;

    public ArrayList<Product> getProducts() {
        return products;
    }

    public String getCustomerName() {
        return customer_name;
    }

    public void setCustomerName(String customer_name) {
        this.customer_name = customer_name;
    }

    private Connection connectionSetup() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/shop";
        String user = "ttre16";
        String password = "";
        return DriverManager.getConnection(url, user, password);
    }

    public void load(){
        String sql =
                "SELECT p.id, p.name, p.description, pp.url, p.price " +
                        "FROM product p " +
                        "LEFT JOIN product_photo pp " +
                        "ON pp.product_id = p.id " +
                        "LEFT JOIN cart_product cp " +
                        "ON cp.product_id = p.id " +
                        "LEFT JOIN cart c " +
                        "ON cp.cart_id = c.id " +
                        "LEFT JOIN customer ct " +
                        "ON c.customer_id = ct.id " +
                        "WHERE ct.name = '%s'";
        sql = String.format(sql , customer_name);
        try(Statement statement = connectionSetup().createStatement()){
            ResultSet resultSet = statement.executeQuery(sql);
            products = new ArrayList<>();
            while (resultSet.next()){
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setUrl(resultSet.getString("url"));
                product.setPrice(resultSet.getInt("price"));
                products.add(product);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void removeProduct(String product_name){
        String sql =
                "DELETE FROM cart_product " +
                        "WHERE ctid IN " +
                        "(SELECT ctid FROM cart_product " +
                        "WHERE cart_id = " +
                        "(SELECT id FROM cart WHERE customer_id = " +
                        "(SELECT id FROM customer WHERE name = ?)) " +
                        "AND product_id =" +
                        "(SELECT id FROM product WHERE name = ?) limit 1)";

        try(PreparedStatement statement = connectionSetup().prepareStatement(sql)){
            statement.setString(1, customer_name);
            statement.setString(2, product_name);
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void addProduct(String product_name){
        String sql =
                "INSERT INTO cart_product(product_id, cart_id) " +
                        "VALUES (" +
                        "(SELECT id FROM product WHERE name = ?), " +
                        "(SELECT id FROM cart WHERE customer_id = " +
                        "(SELECT id FROM customer WHERE name = ?)))";
        try(PreparedStatement statement = connectionSetup().prepareStatement(sql)){
            statement.setString(1, product_name);
            statement.setString(2, customer_name);
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void createCart(Customer customer) {
        String sql =
                "INSERT INTO cart (customer_id) " +
                        "VALUES (?)";
        try (PreparedStatement statement = connectionSetup().prepareStatement(sql)) {
            statement.setInt(1, customer.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getUrl(){
        String sql = "SELECT * FROM product_photo";
        try(Statement statement = connectionSetup().createStatement()){
            ResultSet set = statement.executeQuery(sql);
            if(set.next()) return set.getString("url");
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public String printCart(){
        StringBuilder builder = new StringBuilder();
        products = this.getProducts();
        for (Product product: products) {
            builder.append("<tr><td><img src=\"/")
                    .append(product.getUrl())
                    .append("\"alt=\"")
                    .append(product.getName())
                    .append("\"></td>")
                    .append("<td><a href=\"/")
                    .append(product.getProductSection())
                    .append("/")
                    .append(product.getName())
                    .append(".jsp\">")
                    .append(product.getDescription())
                    .append("</a></td>")
                    .append("<td>")
                    .append(product.getPrice())
                    .append("$</td>")
                    .append("<td><form action=\"jordan\" method=\"post\">")
                    .append("<input class=\"input-delete\" name=\"delete\" value=\"&times; Удалить\" type=\"submit\">")
                    .append("<input type=\"hidden\" name=\"name\" value=\"")
                    .append(product.getName())
                    .append("\"></form></td></tr>");
        }
        return builder.toString();
    }

    public void removeAll(){
        String sql = "DELETE " +
                "FROM cart_product " +
                "WHERE cart_id = " +
                "(SELECT id FROM cart WHERE customer_id = " +
                "(SELECT id FROM customer WHERE name = ?))";
        try(PreparedStatement statement = connectionSetup().prepareStatement(sql)){
            statement.setString(1, customer_name);
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

}
