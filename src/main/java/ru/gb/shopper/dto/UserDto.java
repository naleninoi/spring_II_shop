package ru.gb.shopper.dto;


import lombok.*;
import lombok.experimental.FieldDefaults;
import ru.gb.shopper.model.User;

import java.util.List;
import java.util.stream.Collectors;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@ToString
public class UserDto {

    Long id;
    String email;
    String name;
    String surname;
    List<String> roles;

    public UserDto(User user) {
        this.id = user.getId();
        this.email = user.getEmail();
        this.name = user.getName();
        this.surname = user.getSurname();
        this.roles = user.getRoles().stream()
                .map(role -> role.getRoleType().toString())
                .collect(Collectors.toList());
    }
}
