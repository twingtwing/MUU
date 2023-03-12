package co.makeu.up;

import java.lang.reflect.Field;

import co.makeu.up.users.service.UsersVO;

public class ReflectTestTemp {
	public static void main(String[] args) throws IllegalArgumentException, IllegalAccessException {
		UsersVO users = new UsersVO();
		Field[] fields = users.getClass().getDeclaredFields();
		System.out.println(fields[0].getName());
		System.out.println(fields[0].get("id"));
	}
}
