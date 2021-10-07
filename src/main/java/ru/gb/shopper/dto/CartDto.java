package ru.gb.shopper.dto;


import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.gb.shopper.model.Cart;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@ToString
public class CartDto {

    Long cartId;
    List<CartPositionDto> cartPositions = new ArrayList<>();

    public CartDto(Cart cart) {
        this.cartId = cart.getId();
        this.cartPositions = cart.getCartPositions()
                .stream()
                .map(CartPositionDto::new)
                .collect(Collectors.toList());
    }

}
