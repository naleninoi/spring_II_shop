package ru.gb.shopper.enums;

public enum RoleType {
    ROLE_USER("ROLE_USER"),
    ROLE_MANAGER("ROLE_MANAGER"),
    ROLE_ADMIN("ROLE_ADMIN")
    ;

    private final String roleName;

    RoleType(String roleName) { this.roleName = roleName; }

    @Override
    public String toString() {
        return roleName;
    }
}
