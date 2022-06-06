package model.person.customer;

public class Customer {
    private String idCustomer;
    private String customerName;
    private String birthday;
    private int gender;
    private String idCard;
    private String phone;
    private String email;
    private String address;
    private int customerTypeId;
    private int status;

    public Customer(String idCustomer,
                    String customerName,
                    String birthday,
                    int gender,
                    String idCard,
                    String phone,
                    String email,
                    String address,
                    int customerTypeId,
                    int status) {
        this.idCustomer = idCustomer;
        this.customerName = customerName;
        this.birthday = birthday;
        this.gender = gender;
        this.idCard = idCard;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.customerTypeId = customerTypeId;
        this.status = status;
    }

    public Customer(String idCustomer,
                    String customerName,
                    String birthday,
                    int gender,
                    String idCard,
                    String phone,
                    String email,
                    String address,
                    int customerTypeId) {
        this.idCustomer = idCustomer;
        this.customerName = customerName;
        this.birthday = birthday;
        this.gender = gender;
        this.idCard = idCard;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.customerTypeId = customerTypeId;
    }

    public Customer(String customerName,
                    String birthday,
                    int gender,
                    String idCard,
                    String phone,
                    String email,
                    String address,
                    int customerTypeId,
                    int status) {
        this.customerName = customerName;
        this.birthday = birthday;
        this.gender = gender;
        this.idCard = idCard;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.customerTypeId = customerTypeId;
        this.status = status;
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(int customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
