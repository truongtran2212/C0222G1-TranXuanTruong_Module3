package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {

    public static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Iphone", 20000));
        productList.add(new Product(2, "Samsung", 10000));
        productList.add(new Product(3, "Xiaomi", 40000));
        productList.add(new Product(4, "Lenovo", 50000));
        productList.add(new Product(5, "Huawei", 60000));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findByName(String nameProduct) {
        return null;
    }

    @Override
    public Product findById(int idProduct) {
        return productList.get(idProduct);
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }
}
