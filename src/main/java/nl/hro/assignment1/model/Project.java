package nl.hro.assignment1.model;

/**
 * Created by marcel on 23-10-2016.
 */
public class Project {

    private int id;

    private double budget;

    private int allocatedHours;

    public Project() {
    }

    public Project(int id, double budget, int allocatedHours) {
        this.id = id;
        this.budget = budget;
        this.allocatedHours = allocatedHours;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    public int getAllocatedHours() {
        return allocatedHours;
    }

    public void setAllocatedHours(int allocatedHours) {
        this.allocatedHours = allocatedHours;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Project)) return false;

        Project project = (Project) o;

        return id == project.id;

    }

    @Override
    public int hashCode() {
        return id;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", budget=" + budget +
                ", allocatedHours=" + allocatedHours +
                '}';
    }
}
