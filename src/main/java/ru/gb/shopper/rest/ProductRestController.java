package ru.gb.shopper.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.gb.shopper.dto.ProductDto;
import ru.gb.shopper.model.Product;
import ru.gb.shopper.service.ProductService;


import java.math.BigDecimal;
import java.net.URI;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value = "rest/products")
public class ProductRestController {

    private final ProductService productService;

    public ProductRestController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping()
    public ResponseEntity<List<ProductDto>> getAllProducts(
            @RequestParam(required = false, defaultValue = "0") BigDecimal min,
            @RequestParam(required = false) BigDecimal max ) {
        List<Product> products;
        if (min != null & max != null) {
            products = productService.findProductsByPriceInterval(min, max);
        } else if (min != null) {
            products = productService.findProductsByMinPrice(min);
        } else if (max != null) {
            products = productService.findProductsByMaxPrice(max);
        } else {
            products = productService.findAllProducts();
        }
        List<ProductDto> result = products.stream().map(ProductDto::new).collect(Collectors.toList());
        return ResponseEntity.ok(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductDto> getProduct(@PathVariable Long id) {
        Optional<Product> product = productService.findById(id);
        if (product.isPresent()) {
            ProductDto result = new ProductDto( product.get());
            return ResponseEntity.ok( result );
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteProduct(@PathVariable Long id) {
        Optional<Product> product = productService.findById(id);
        if (product.isPresent()) {
            productService.delete(product.get());
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PostMapping()
    public ResponseEntity<ProductDto> createOrUpdateProduct(@RequestBody Product product) {
        Optional <Product> productOptional = productService.findByTitle(product.getTitle());
        if (productOptional.isPresent()) {
            productOptional.get().setPrice(product.getPrice());
            productService.save(productOptional.get());
            ProductDto result = new ProductDto( productOptional.get());
            return ResponseEntity.ok(result);
        } else {
            productService.save(product);
            ProductDto result = new ProductDto( product );
            return ResponseEntity.created( URI.create( "products/" + product.getId() ) ).body(result);
        }
    }

}
