package ru.gb.shopper.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.gb.shopper.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
