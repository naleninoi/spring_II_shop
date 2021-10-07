package ru.gb.shopper.dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.ToString;
import lombok.experimental.FieldDefaults;
import ru.gb.shopper.model.Product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@ToString
public class ProductDto {

    Long productId;
    String title;
    String description;
    BigDecimal price;
    List<CategoryDto> categories = new ArrayList<>();

    public ProductDto (Product product) {
        this.productId = product.getId();
        this.title = product.getTitle();
        this.description = product.getDescription();
        this.price = product.getPrice();
        this.categories = product.getCategories().stream()
                .map(CategoryDto::new)
                .collect(Collectors.toList());
    }

}
