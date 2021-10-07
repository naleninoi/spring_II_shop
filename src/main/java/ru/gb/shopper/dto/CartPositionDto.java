package ru.gb.shopper.dto;


import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.gb.shopper.model.CartPosition;

import java.math.BigDecimal;


@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@ToString
public class CartPositionDto {

    Long productId;
    String productTitle;
    int productQuantity;
    BigDecimal cost;

    public CartPositionDto(CartPosition cartPosition) {
        this.productId = cartPosition.getProduct().getId();
        this.productTitle = cartPosition.getProduct().getTitle();
        this.productQuantity = cartPosition.getQuantity();
        this.cost = cartPosition.getProduct().getPrice().multiply(BigDecimal.valueOf(this.productQuantity));
    }

}
