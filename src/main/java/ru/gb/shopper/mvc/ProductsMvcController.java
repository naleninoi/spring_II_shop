package ru.gb.shopper.mvc;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.gb.shopper.dto.ProductDto;
import ru.gb.shopper.model.Product;
import ru.gb.shopper.model.User;
import ru.gb.shopper.service.ProductService;
import ru.gb.shopper.service.SecurityService;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "products")
public class ProductsMvcController {

    private final ProductService productService;
    private final SecurityService securityService;

    public ProductsMvcController(ProductService productService, SecurityService securityService) {
        this.productService = productService;
        this.securityService = securityService;
    }

    @GetMapping("")
    public String getProducts(
            @RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
            @RequestParam(name = "size", required = false, defaultValue = "10") Integer pageSize,
            Model model) {
        User currentUser = securityService.getCurrentUser();

        Pageable pageable = PageRequest.of(page - 1, pageSize);
        Page<Product> productsPage = productService.getAllProductsByPages(pageable);
        List<ProductDto> products = productsPage.getContent()
                .stream()
                .map(ProductDto::new)
                .collect(Collectors.toList());
        model.addAttribute("products", products);
        model.addAttribute("totalPages", productsPage.getTotalPages());
        model.addAttribute("currentPage", page);
        model.addAttribute("prevPage", page - 1);
        model.addAttribute("nextPage", page + 1);
        model.addAttribute("userFullName", currentUser.getName() + ' ' + currentUser.getSurname());
        return "products";
    }

}
