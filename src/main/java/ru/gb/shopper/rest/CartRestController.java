package ru.gb.shopper.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;
import ru.gb.shopper.dto.CartDto;
import ru.gb.shopper.model.Cart;
import ru.gb.shopper.service.CartService;
import ru.gb.shopper.service.ProductService;


import java.net.URI;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value = "/rest/carts")
public class CartRestController {

    private final CartService cartService;
    private final ProductService productService;

    public CartRestController(CartService cartService,
                              ProductService productService) {
        this.cartService = cartService;
        this.productService = productService;
    }

    @GetMapping()
    public ResponseEntity<List<CartDto>> getAllCarts() {
        List<Cart> carts = cartService.findAllCarts();
        List<CartDto> result = carts.stream().map(CartDto::new).collect(Collectors.toList());
        return ResponseEntity.ok(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CartDto> getCart(@PathVariable Long id) {
        Optional<Cart> cart = cartService.findById(id);
        if (cart.isPresent()) {
            return ResponseEntity.ok(new CartDto( cart.get() ));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @Secured({"ROLE_ADMIN", "ROLE_SUPERADMIN"})
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteCart(@PathVariable Long id) {
        Optional<Cart> cart = cartService.findById(id);
        if (cart.isPresent()) {
            cartService.delete(cart.get());
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PostMapping(value = "/create")
    public ResponseEntity<CartDto> createNewCart() {
        Cart newCart = new Cart();
        cartService.save(newCart);
        return ResponseEntity.created( URI.create( "carts/" + newCart.getId() ) ).body(new CartDto(newCart));
    }

    @PostMapping(value = "/{id}")
    public ResponseEntity<CartDto> addProductsToCart(@PathVariable Long id,
                                                     @RequestBody Long[] productIds) {
        Optional<Cart> cartOptional = cartService.findById(id);
        if( cartOptional.isPresent() ) {
            Cart cart = cartOptional.get();
            cartService.addProducts(cart, productIds);
            return ResponseEntity.ok(new CartDto( cart ));
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<CartDto> removeProductsFromCart(@PathVariable Long id,
                                                     @RequestBody Long[] productIds) {
        Optional<Cart> cartOptional = cartService.findById(id);
        if( cartOptional.isPresent() ) {
            Cart cart = cartOptional.get();
            cartService.removeProducts(cart, productIds);
            return ResponseEntity.ok(new CartDto( cart ));
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }


}
