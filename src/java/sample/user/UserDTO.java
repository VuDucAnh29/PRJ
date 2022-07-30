/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author Admin
 */
public class UserDTO {
    private String UserID;
    private String FullName;
    private String RoleID;
    private String Password;
    private String Birthday;
    private String Address;
    private String Phone;
    private String Email;

    public UserDTO() {
        this.UserID = "";
        this.FullName = "";
        this.RoleID = "";
        this.Password = "";
        this.Birthday = "";
        this.Address = "";
        this.Phone = "";
        this.Email = "";
    }

    public UserDTO(String UserID, String FullName, String RoleID, String Password) {
        this.UserID = UserID;
        this.FullName = FullName;
        this.RoleID = RoleID;
        this.Password = Password;
    }

    public UserDTO(String UserID, String FullName, String RoleID, String Password, String Birthday, String Address, String Phone, String Email) {
        this.UserID = UserID;
        this.FullName = FullName;
        this.RoleID = RoleID;
        this.Password = Password;
        this.Birthday = Birthday;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getRoleID() {
        return RoleID;
    }

    public void setRoleID(String RoleID) {
        this.RoleID = RoleID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getBirthday() {
        return Birthday;
    }

    public void setBirthday(String Birthday) {
        this.Birthday = Birthday;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    
    
    
}
