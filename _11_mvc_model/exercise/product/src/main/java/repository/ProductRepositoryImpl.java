package repository;

import model.Product;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository {

    public static Map<Integer, Product> productMap = new LinkedHashMap<>();

    static {
        productMap.put(1, new Product(1, "Iphone", 20000));
        productMap.put(2, new Product(2, "Samsung", 10000));
        productMap.put(3, new Product(3, "Xiaomi", 40000));
        productMap.put(4, new Product(4, "Lenovo", 50000));
        productMap.put(5, new Product(5, "Huawei", 60000));
    }

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>(productMap.values());
        return productList;
    }

    @Override
    public List<Product> findByName(String nameProduct) {
        List<Product> productList = new ArrayList<>();
        for (Product item: productMap.values()) {
            if(item.getNameProduct().contains(nameProduct)){
                productList.add(item);
            }
        }
        return  productList;
    }

    @Override
    public Product findById(int idProduct) {
            return productMap.get(idProduct);
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getIdProduct(), product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

}
