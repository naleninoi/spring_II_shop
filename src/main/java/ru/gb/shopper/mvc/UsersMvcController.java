package ru.gb.shopper.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.gb.shopper.dto.UserDto;
import ru.gb.shopper.model.User;
import ru.gb.shopper.service.UserService;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "users")
public class UsersMvcController {

    private final UserService userService;

    public UsersMvcController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping()
    public String getAllUsers(Model model) {
        List<User> users = userService.findAllUsers();
        List<UserDto> result = users.stream().map(UserDto::new).collect(Collectors.toList());
        model.addAttribute("users", result);
        return "users";
    }
}
