/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;



/**
 *
 * @author Mark
 */
public class RoleHelper {
    public enum Role {
        Doctor,
        Staff,
        Patient,
        Finance,
        Unknown
    }
    public static Role getUserRole(String username) {
        return Role.Unknown;
    }
}
