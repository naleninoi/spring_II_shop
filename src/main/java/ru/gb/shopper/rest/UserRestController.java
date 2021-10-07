package ru.gb.shopper.rest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.gb.shopper.dto.UserDto;
import ru.gb.shopper.model.User;
import ru.gb.shopper.service.UserService;


import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value = "rest/users")
public class UserRestController {

    private final UserService userService;

    public UserRestController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping()
    public ResponseEntity<List<UserDto>> getAllUsers() {
        List<User> users = userService.findAllUsers();
        List<UserDto> result = users.stream().map(UserDto::new).collect(Collectors.toList());
        return ResponseEntity.ok(result);
    }
}
