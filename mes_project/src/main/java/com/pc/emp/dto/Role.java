package com.pc.emp.dto;

public enum Role {
	ADMIN, WORKER;

	public static Role fromString(String roleStr) {
		for (Role role : Role.values()) {
			if (role.name().equalsIgnoreCase(roleStr)) {
				return role;
			}
		}
		throw new IllegalArgumentException("Unknown role: " + roleStr);
	}
}
