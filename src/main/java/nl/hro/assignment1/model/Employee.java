package nl.hro.assignment1.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "employee")
public class Employee implements Serializable {

    @Id
    @Column(name = "bsn", unique = true, nullable = false)
    private int bsn;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "Headquarters_name")
    private String headquartersName;

    public Employee() {
    }

    public Employee(int bsn, String name, String surname, String headquartersName) {
        this.bsn = bsn;
        this.name = name;
        this.surname = surname;
        this.headquartersName = headquartersName;
    }

    public int getBsn() {
        return bsn;
    }

    public void setBsn(int bsn) {
        this.bsn = bsn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getHeadquartersName() {
        return headquartersName;
    }

    public void setHeadquartersName(String headquartersName) {
        this.headquartersName = headquartersName;
    }
}