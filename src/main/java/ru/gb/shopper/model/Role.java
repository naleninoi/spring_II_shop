package ru.gb.shopper.model;


import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.gb.shopper.enums.RoleType;

import javax.persistence.*;

@Entity
@Table(name = "roles")

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(name = "role_type")
    @Enumerated(EnumType.STRING)
    RoleType roleType;
}
