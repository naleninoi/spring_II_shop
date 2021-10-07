package ru.gb.shopper.service.implementation;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import ru.gb.shopper.model.User;
import ru.gb.shopper.repository.UserRepository;
import ru.gb.shopper.service.SecurityService;

@Service
public class SecurityServiceImplementation implements SecurityService {

    private final UserRepository userRepository;

    public SecurityServiceImplementation(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            String currentUsername = authentication.getName();
            return userRepository.findByEmail(currentUsername).orElse(null);
        }
        return null;
    }
}
