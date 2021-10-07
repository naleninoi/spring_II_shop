package ru.gb.shopper.dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.ToString;
import lombok.experimental.FieldDefaults;
import ru.gb.shopper.model.Category;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@ToString
public class CategoryDto {

    String title;

    public CategoryDto(Category category) {
        this.title = category.getTitle();
    }

}
