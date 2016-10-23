package nl.hro.assignment1.model;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "employee_has_position_in_project")
public class EmployeePositionProject implements Serializable {

    @Id
    @ManyToOne(targetEntity = Employee.class)
    @JoinColumn(name = "Employee_bsn", nullable = false)
    private Employee employee;

    @Id
    @ManyToOne(targetEntity = Position.class)
    @JoinColumn(name = "Position_name", nullable = false)
    private Position position;

    @Id
    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "Project_id", nullable = false)
    private Project project;

}
