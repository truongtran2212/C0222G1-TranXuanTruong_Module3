package repository;

import model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();

    Product findByName(String nameProduct);

    Product findById(int id);

    void save(Product product);

    void delete(int id);

    void update(int id, Product product);
}
