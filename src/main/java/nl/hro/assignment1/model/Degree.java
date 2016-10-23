package nl.hro.assignment1.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "degrees")
public class Degree implements Serializable {

    @Id
    @Column(name = "course", unique = true, nullable = false)
    private String course;

    @Column(name = "school")
    private String school;

    @Column(name = "level")
    private String level;

    public Degree() {
    }

    public Degree(String course, String school, String level) {
        this.course = course;
        this.school = school;
        this.level = level;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Degree)) return false;

        Degree degree = (Degree) o;

        return getCourse().equals(degree.getCourse());

    }

    @Override
    public int hashCode() {
        return getCourse().hashCode();
    }

    @Override
    public String toString() {
        return "Degree{" +
                "course='" + course + '\'' +
                ", school='" + school + '\'' +
                ", level='" + level + '\'' +
                '}';
    }
}
