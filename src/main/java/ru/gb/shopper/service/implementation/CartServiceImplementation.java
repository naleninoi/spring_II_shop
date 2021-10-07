package ru.gb.shopper.service.implementation;

import org.springframework.stereotype.Service;
import ru.gb.shopper.model.Cart;
import ru.gb.shopper.model.CartPosition;
import ru.gb.shopper.model.Product;
import ru.gb.shopper.model.User;
import ru.gb.shopper.repository.CartPositionRepository;
import ru.gb.shopper.repository.CartRepository;
import ru.gb.shopper.repository.ProductRepository;
import ru.gb.shopper.service.CartService;


import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class CartServiceImplementation implements CartService {

    private final CartRepository cartRepository;
    private final ProductRepository productRepository;
    private final CartPositionRepository cartPositionRepository;

    public CartServiceImplementation(CartRepository cartRepository,
                                     ProductRepository productRepository,
                                     CartPositionRepository cartPositionRepository) {
        this.cartRepository = cartRepository;
        this.productRepository = productRepository;
        this.cartPositionRepository = cartPositionRepository;
    }

    @Override
    public void save(Cart cart) {
        cartRepository.save(cart);
    }

    @Override
    @Transactional
    public void delete(Cart cart) {
        cartRepository.delete(cart);
    }

    @Override
    public List<Cart> findAllCarts() {
        return cartRepository.findAll();
    }

    @Override
    public Optional<Cart> findById(Long id) {
        return cartRepository.findById(id);
    }

    @Override
    public Cart findCartByUserOrCreateNew(User user) {
        Optional<Cart> cartOptional = cartRepository.findByUser(user);
        if (cartOptional.isEmpty()) {
            Cart cart = new Cart();
            cart.setUser(user);
            cartRepository.save(cart);
            return cart;
        }
        return cartOptional.get();
    }

    @Override
    public void addProduct(Cart cart, Product product) {
        boolean isPresentInCart = cart.getCartPositions().stream()
                .anyMatch(cp -> cp.getProduct().equals(product));
        if (isPresentInCart) {
            cart.getCartPositions().stream()
                    .filter( cp -> cp.getProduct().equals(product) )
                    .findFirst()
                    .map( cp-> {
                        int q = cp.getQuantity();
                        cp.setQuantity(++q);
                        return cp;
                    } );
        } else {
            CartPosition cartPosition = CartPosition.create(product);
            cartPosition.setCart(cart);
            cart.getCartPositions().add(cartPosition);
        }
        cartRepository.save(cart);
    }

    @Override
    public void addProducts(Cart cart, Long[] productIds) {
        for (Long productId : productIds) {
            Optional<Product> productOptional = productRepository.findByIdAndIsDeletedIsFalse(productId);
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                boolean isPresentInCart = cart.getCartPositions().stream()
                        .anyMatch(cp -> cp.getProduct().equals(product));
                if (isPresentInCart) {
                    cart.getCartPositions().stream()
                            .filter( cp -> cp.getProduct().equals(product) )
                            .findFirst()
                            .map( cp-> {
                                int q = cp.getQuantity();
                                cp.setQuantity(++q);
                                return cp;
                            } );
                } else {
                    CartPosition cartPosition = CartPosition.create(product);
                    cartPosition.setCart(cart);
                    cart.getCartPositions().add(cartPosition);
                }
            }
        }
        cartRepository.save(cart);
    }

    @Override
    @Transactional
    public void removeProducts(Cart cart, Long[] productIds) {
        for (Long productId : productIds) {
            Optional<Product> productOptional = productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                Optional<CartPosition> cartPosition = cart.getCartPositions().stream()
                        .filter( cp -> cp.getProduct().equals(product) )
                        .findFirst();
                cartPosition.ifPresent( cp -> {
                    cart.getCartPositions().remove(cp);
                    cartPositionRepository.delete(cp);
                } );
            }
        }
    }

}
