package compare;

import java.util.Comparator;

public class UserComparetor implements Comparator<User> {
    @Override
    public int compare(User o1, User o2) {
        int age = o1.getAge()-o2.getAge();
        return age!=0?age:o1.getName().length()-o2.getName().length();
    }
}
