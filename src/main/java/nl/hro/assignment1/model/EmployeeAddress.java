package nl.hro.assignment1.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "employee_lives_at_address")
public class EmployeeAddress implements Serializable {

    @Id
    @ManyToOne(targetEntity = Employee.class)
    @JoinColumn(name = "Employee_bsn", nullable = false)
    private Employee employee;

    @Id
    @ManyToOne(targetEntity = Address.class)
    @JoinColumns({
            @JoinColumn(name = "Address_postal_code", referencedColumnName = "postal_code", nullable = false),
            @JoinColumn(name = "Address_country", referencedColumnName = "country", nullable = false)
    })
    private Address address;

    private boolean isMain;

    public EmployeeAddress() {
    }

    public EmployeeAddress(Employee employee, Address address, boolean isMain) {
        this.employee = employee;
        this.address = address;
        this.isMain = isMain;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public boolean isMain() {
        return isMain;
    }

    public void setMain(boolean main) {
        isMain = main;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof EmployeeAddress)) return false;

        EmployeeAddress that = (EmployeeAddress) o;

        if (!getEmployee().equals(that.getEmployee())) return false;
        return getAddress().equals(that.getAddress());

    }

    @Override
    public int hashCode() {
        int result = getEmployee().hashCode();
        result = 31 * result + getAddress().hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "EmployeeAddress{" +
                "employee=" + employee +
                ", address=" + address +
                ", isMain=" + isMain +
                '}';
    }
}
