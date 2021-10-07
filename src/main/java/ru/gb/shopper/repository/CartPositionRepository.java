package ru.gb.shopper.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.gb.shopper.model.CartPosition;

@Repository
public interface CartPositionRepository extends CrudRepository<CartPosition, Long> {
}
