package nl.hro.assignment1.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.io.Serializable;
import java.lang.annotation.Target;

@Entity
@Table(name = "headquarters")
public class Headquarter implements Serializable {

    @Id
    @Column(name = "name", unique = true, nullable = false)
    private String name;

    @Column(name = "rooms", length = 11)
    private int rooms;

    @Column(name = "rent")
    private double rent;

    @OneToOne(targetEntity = Address.class)
    @JoinColumns({
            @JoinColumn(name = "Address_postal_code", referencedColumnName = "postal_code"),
            @JoinColumn(name = "Address_country", referencedColumnName = "country")
    })
    private Address address;

    @OneToOne(targetEntity = Project.class)
    @JoinColumn(name = "Project_id")
    private int projectID;

    public Headquarter() {
    }

    public Headquarter(String name, int rooms, double rent, Address address, int projectID) {
        this.name = name;
        this.rooms = rooms;
        this.rent = rent;
        this.address = address;
        this.projectID = projectID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public double getRent() {
        return rent;
    }

    public void setRent(double rent) {
        this.rent = rent;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public int getProjectID() {
        return projectID;
    }

    public void setProjectID(int projectID) {
        this.projectID = projectID;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Headquarter)) return false;

        Headquarter that = (Headquarter) o;

        return getName().equals(that.getName());

    }

    @Override
    public int hashCode() {
        return getName().hashCode();
    }

    @Override
    public String toString() {
        return "Headquarter{" +
                "name='" + name + '\'' +
                ", rooms=" + rooms +
                ", rent=" + rent +
                ", address=" + address +
                ", projectID=" + projectID +
                '}';
    }
}
