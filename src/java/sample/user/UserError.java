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
public class UserError {
    private String userID;
    private String fullName;
    private String roleID;
    private String password;
    private String Confirm;
    private String Birthday;
    private String Address;
    private String Phone;
    private String Email;
    

    public UserError() {
        this.userID = "";
        this.fullName = "";
        this.roleID = "";
        this.password = "";
        this.Confirm = "";
        this.Birthday = "";
        this.Address = "";
        this.Phone = "";
        this.Email = "";
    }

    public UserError(String userID, String fullName, String roleID, String password, String Confirm, String Birthday, String Address, String Phone, String Email) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
        this.Confirm = Confirm;
        this.Birthday = Birthday;
        this.Address = Address;
        this.Phone = Phone;
        this.Email = Email;
    }
    
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return Confirm;
    }

    public void setConfirm(String Confirm) {
        this.Confirm = Confirm;
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
