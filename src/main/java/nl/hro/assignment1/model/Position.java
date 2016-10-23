package nl.hro.assignment1.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "positions")
public class Position implements Serializable {

    @Id
    @Column(name = "name", unique = true, nullable = false)
    public String name;

    @Column(name = "description")
    public String description;

    @Column(name = "fee_per_hour")
    private double fee;

    public Position() {
    }

    public Position(String name, String description, double fee) {
        this.name = name;
        this.description = description;
        this.fee = fee;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Position)) return false;

        Position position = (Position) o;

        return getName().equals(position.getName());

    }

    @Override
    public int hashCode() {
        return getName().hashCode();
    }

    @Override
    public String toString() {
        return "Position{" +
                "name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", fee=" + fee +
                '}';
    }
}
