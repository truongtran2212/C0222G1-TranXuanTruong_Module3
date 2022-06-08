package service.person.customer.impl;

import model.person.customer.Customer;
import repository.person.customer.CustomerRepository;
import repository.person.customer.impl.CustomerRepositoryImpl;
import service.person.customer.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {

    CustomerRepository customerRepository = new CustomerRepositoryImpl();
    private static final String CUSTOMER_ID = "^KH-[0-9]{4}$";
    private static final String ID_CARD = "^[0-9]{9}|[0-9]{12}$";
    private static final String PHONE = "^(090[0-9]{7})|(091[0-9]{7})|(\\(84\\)\\+90[0-9]{7})|(\\(84\\)\\+91[0-9]{7})$";
    private static final String EMAIL = "^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public Map<String, String> create(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> map = new LinkedHashMap<>();


        String idCustomer = request.getParameter("idCustomer");
        if (!idCustomer.matches(CUSTOMER_ID)) {
            map.put("idCustomer", "Sai dinh dang, Mã Khách hàng có định dạng là KH-XXXX (X là số từ 0-9)");
        }if(idCustomer.equals("")){
            map.put("idCustomer", "Không dược bỏ trống");
        }

        String customerName = request.getParameter("customerName");

        if(customerName.equals("")){
            map.put("customerName", "Không dược bỏ trống");
        }


        String birthday = request.getParameter("birthday");

        if(birthday.equals("")){
            map.put("birthday", "Không dược bỏ trống");
        }

        int gender = 0;
        try {
            gender = Integer.parseInt(request.getParameter("gender"));
            if (gender < 0 || gender > 1) {
                map.put("gender", "Chỉ được nhập số 0 hoặc 1 ");
            }
        } catch (NumberFormatException o) {
            map.put("gender", "Không được nhập chữ hoặc để trống hoặc nhập chữ");
        }


        String idCard = request.getParameter("idCard");

        if (!idCard.matches(ID_CARD)) {
            map.put("idCard", "Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9)");
        }
        if(idCard.equals("")){
            map.put("idCard", "Không dược bỏ trống");
        }



        String phone = request.getParameter("phone");
        if (!phone.matches(PHONE)) {
            map.put("phone", "Sai dinh dang,Số điện thoại phải đúng định dạng 090xxxxxxx " +
                    "hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx (X là số 0-9)");
        } if(idCard.equals("")){
            map.put("phone", "Không dược bỏ trống");
        }


        String email = request.getParameter("email");
        if(!email.matches(EMAIL)){
            map.put("email","Định dạng đúng là inputsomething@gmail.com");
        }if(idCard.equals("")){
            map.put("email", "Không dược bỏ trống");
        }

        String address = request.getParameter("address");
        if(idCard.equals("")){
            map.put("address", "Không dược bỏ trống");
        }


        int customerTypeId = 0;

        try {
            customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
            if (customerTypeId < 1 || customerTypeId > 5) {
                map.put("customerTypeId", "Chỉ được nhập từ 1 đến 5");
            }
        } catch (NumberFormatException o) {
            map.put("customerTypeId", "Không được nhập chữ hoặc để trống");
        }

        if (map.isEmpty()) {
            Customer customer = new Customer(idCustomer, customerName, birthday, gender, idCard, phone, email, address, customerTypeId);
            customerRepository.create(customer);
        }

        return map;
    }

    @Override
    public Customer findById(String idCustomer) {
        return customerRepository.findById(idCustomer);
    }

    @Override
    public void delete(String idCustomer) {
        customerRepository.delete(idCustomer);
    }

    @Override
    public void update(String idCustomer, Customer customer) {


        customerRepository.update(idCustomer, customer);
    }

    @Override
    public List<Customer> search(String customerSearch, String id) {
        return customerRepository.search(customerSearch, id);
    }


}
