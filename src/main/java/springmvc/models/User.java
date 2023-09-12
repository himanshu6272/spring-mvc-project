package springmvc.models;

import javax.validation.GroupSequence;
import javax.validation.Valid;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name = "user")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotEmpty(message = "*Firstname is required")
    @Pattern(regexp = "^[A-Z,a-z]{2,8}$", message = "please fill valid firstname")
    private String firstName;
    @NotEmpty(message = "*Lastname is required")
    @Pattern(regexp = "^[A-Z,a-z]{2,8}$", message = "please fill valid lastname")
    private String lastName;
    @NotEmpty(message = "*Mobile is required")
    @Pattern(regexp = "^[0-9]{1,11}$", message = "please enter valid mobile number")
    private String mobile;
    @NotEmpty(message = "*Email is required")
    @Pattern(regexp = "^[A-Za-z0-9+_.-]+@(.+)$", message = "please enter valid email")
    private String email;
    @NotNull(message = "please select the role")
    private String role;
    @NotEmpty(message = "please select the date")
    private String dob;
    @NotNull(message = "please select the gender")
    private String gender;
//    @Pattern(regexp = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$", message = "please enter valid password")
    private String password;
    @NotNull(message = "please select the security question")
    private String securityQuestion;
    @NotEmpty(message = "please select the security answer")
    private String securityAnswer;
    @Lob
    @Column(columnDefinition = "LONGBLOB")
    @NotNull(message = "please select the image")
    private byte[] image;


    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "user")
    @Valid
    private List<Address> addresses;

    public User() {
    }

    public User(String firstName, String lastName, String mobile, String email, String role, String dob, String gender, String password, String securityQuestion, String securityAnswer, byte[] image, List<Address> addresses) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.mobile = mobile;
        this.email = email;
        this.role = role;
        this.dob = dob;
        this.gender = gender;
        this.password = password;
        this.securityQuestion = securityQuestion;
        this.securityAnswer = securityAnswer;
        this.image = image.clone();
        this.addresses = addresses;
    }

    public User(int id, String firstName, String lastName, String mobile, String email, String role, String dob, String gender, String password, String securityQuestion, String securityAnswer, byte[] image, List<Address> addresses) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.mobile = mobile;
        this.email = email;
        this.role = role;
        this.dob = dob;
        this.gender = gender;
        this.password = password;
        this.securityQuestion = securityQuestion;
        this.securityAnswer = securityAnswer;
        this.image = image.clone();
        this.addresses = addresses;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSecurityQuestion() {
        return securityQuestion;
    }

    public void setSecurityQuestion(String securityQuestion) {
        this.securityQuestion = securityQuestion;
    }

    public String getSecurityAnswer() {
        return securityAnswer;
    }

    public void setSecurityAnswer(String securityAnswer) {
        this.securityAnswer = securityAnswer;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                ", dob='" + dob + '\'' +
                ", gender='" + gender + '\'' +
                ", password='" + password + '\'' +
                ", securityQuestion='" + securityQuestion + '\'' +
                ", securityAnswer='" + securityAnswer + '\'' +
                ", addresses=" + addresses +
                '}';
    }
}
