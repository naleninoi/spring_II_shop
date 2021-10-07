package ru.gb.shopper.mvc;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.gb.shopper.dto.CartDto;
import ru.gb.shopper.dto.CartPositionDto;
import ru.gb.shopper.dto.ProductDto;
import ru.gb.shopper.model.Cart;
import ru.gb.shopper.model.Product;
import ru.gb.shopper.model.User;
import ru.gb.shopper.service.CartService;
import ru.gb.shopper.service.ProductService;
import ru.gb.shopper.service.SecurityService;
import ru.gb.shopper.service.UserService;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "cart")
public class CartMvcController {

    private final ProductService productService;
    private final SecurityService securityService;
    private final CartService cartService;

    public CartMvcController(ProductService productService,
                             SecurityService securityService,
                             CartService cartService) {
        this.productService = productService;
        this.securityService = securityService;
        this.cartService = cartService;
    }

    @GetMapping("")
    public String getCart(Model model) {
        User currentUser = securityService.getCurrentUser();
        Cart cart = cartService.findCartByUserOrCreateNew(currentUser);
        List<CartPositionDto> positions = cart.getCartPositions()
                .stream()
                .map(CartPositionDto::new)
                .collect(Collectors.toList());
        model.addAttribute("positions", positions);
        model.addAttribute("userFullName", currentUser.getName() + ' ' + currentUser.getSurname());
        return "cart";
    }

    @GetMapping(value = "/add/{id}")
    public String addProductToCart(@PathVariable Long id) {
        User currentUser = securityService.getCurrentUser();
        Cart cart = cartService.findCartByUserOrCreateNew(currentUser);
        Optional<Product> productOptional = productService.findById(id);
        productOptional.ifPresent(
                product -> cartService.addProduct(cart, product) );
        return "redirect:/products";
    }



}
