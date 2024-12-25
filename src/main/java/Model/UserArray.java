package Model;


import lombok.Getter;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UserArray
{
    @Getter
    private static List<User> users = new ArrayList<>();

    public static boolean isUser(String username, String password)
    {
        return users.stream().anyMatch(u -> u.getUsername().equals(username) && u.getPassword().equals(password));
    }

    public static User getUser(String username, String password)
    {
        return users.stream()
                .filter(user -> user.getUsername().equals(username) && user.getPassword().equals(password))
                .findAny()
                .orElse(null);
    }

    public static User getUser(String id)
    {
        return users.stream()
                .filter(user -> user.getId().equals(id))
                .findAny()
                .orElse(null);
    }
}
