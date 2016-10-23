package nl.hro.assignment1.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "headquarters")
public class Headquarter {

    @Id
    @Column(name = "name", unique = true, nullable = false)
    private String name;

    @Column(name = "rooms", length = 11)
    private int rooms;

    @Column(name = "rent")
    private double rent;

    @Column(name = "Address_country")
    private String addressCountry;

    @Column(name = "Address_postal_code")
    private String addressPostalCode;

    @Column(name = "Project_id")
    private int projectID;

    public Headquarter() {
    }

    public Headquarter(String name, int rooms, double rent, String addressCountry, String addressPostalCode, int projectID) {
        this.name = name;
        this.rooms = rooms;
        this.rent = rent;
        this.addressCountry = addressCountry;
        this.addressPostalCode = addressPostalCode;
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

    public String getAddressCountry() {
        return addressCountry;
    }

    public void setAddressCountry(String addressCountry) {
        this.addressCountry = addressCountry;
    }

    public String getAddressPostalCode() {
        return addressPostalCode;
    }

    public void setAddressPostalCode(String addressPostalCode) {
        this.addressPostalCode = addressPostalCode;
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
                ", addressCountry='" + addressCountry + '\'' +
                ", addressPostalCode='" + addressPostalCode + '\'' +
                ", projectID=" + projectID +
                '}';
    }
}
