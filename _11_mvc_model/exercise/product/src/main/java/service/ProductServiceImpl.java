package service;

import model.Product;
import repository.ProductRepositoryImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {

   private ProductRepositoryImpl productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> findByName(String nameProduct) {
        return productRepository.findByName(nameProduct);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public Map<String, String> save(Product product) {
        Map<String, String> map = new HashMap<>();

        if (product.getPriceProduct()<0) {
            map.put("priceProduct", "Giá sản phẩm không được nhỏ hơn 0");
        }

        if (map.isEmpty()){
            productRepository.save(product);
        }

        return map;
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id,product);
    }
}
