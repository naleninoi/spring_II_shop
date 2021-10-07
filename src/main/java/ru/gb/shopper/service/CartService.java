package ru.gb.shopper.service;


import ru.gb.shopper.model.Cart;
import ru.gb.shopper.model.Product;
import ru.gb.shopper.model.User;

import java.util.List;
import java.util.Optional;

public interface CartService {

    void save(Cart cart);

    void delete(Cart cart);

    List<Cart> findAllCarts();

    Optional<Cart> findById(Long id);

    Cart findCartByUserOrCreateNew(User user);

    void addProduct(Cart cart, Product product);

    void addProducts(Cart cart, Long[] productIds);

    void removeProducts(Cart cart, Long[] productIds);

}
