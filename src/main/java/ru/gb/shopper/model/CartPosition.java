package ru.gb.shopper.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import javax.persistence.*;

@Entity
@Table(name = "cart_positions")

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@ToString
@NoArgsConstructor
public class CartPosition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "cart_id")
    Cart cart;

    @ManyToOne
    @JoinColumn(name = "product_id")
    Product product;

    @Column(name = "quantity")
    int quantity;

    public static CartPosition create(Product product) {
        CartPosition cartPosition = new CartPosition();
        cartPosition.setProduct(product);
        cartPosition.setQuantity(1);
        return cartPosition;
    }
}
