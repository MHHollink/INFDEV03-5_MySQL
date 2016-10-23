package nl.hro.assignment1.model;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "employee_has_degrees")
public class EmployeeDegree implements Serializable {

    @Id
    @ManyToOne(targetEntity = Employee.class)
    @JoinColumn(name = "Employee_bsn", nullable = false)
    private Employee employee;

    @Id
    @OneToOne(targetEntity = Degree.class)
    @JoinColumn(name = "Degrees_course", nullable = false)
    private Degree degree;

    public EmployeeDegree() {
    }

    public EmployeeDegree(Employee employee, Degree degree) {
        this.employee = employee;
        this.degree = degree;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Degree getDegree() {
        return degree;
    }

    public void setDegree(Degree degree) {
        this.degree = degree;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof EmployeeDegree)) return false;

        EmployeeDegree that = (EmployeeDegree) o;

        if (!getEmployee().equals(that.getEmployee())) return false;
        return getDegree().equals(that.getDegree());

    }

    @Override
    public int hashCode() {
        int result = getEmployee().hashCode();
        result = 31 * result + getDegree().hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "EmployeeDegree{" +
                "employee=" + employee +
                ", degree=" + degree +
                '}';
    }
}
