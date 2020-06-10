package compare;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class User implements Comparable<User> {
    private String name;
    private int age;

    public User(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    public static void main(String[] args) {
        List<User> users = new ArrayList<>();
        users.add(new User("tom", 18));
        users.add(new User("tom", 19));
        users.add(new User("jack", 17));
        users.add(new User("mary", 20));
        // 通过第三方进行比较
//        users.sort(new UserComparetor());
        // 自身可比较
        Collections.sort(users);
        System.out.println(users);
    }

    @Override
    public int compareTo(User o) {
        int age = this.getAge()-o.getAge();
        return age!=0?age:this.getName().length()-o.getName().length();
    }
}
