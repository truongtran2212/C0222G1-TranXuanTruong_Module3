package service;

import model.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {
    List<Product> findAll();

    List<Product> findByName(String nameProduct);

    Product findById(int id);

    Map<String,String> save(Product product);

    void delete(int id);

    void update(int id, Product product);
}
