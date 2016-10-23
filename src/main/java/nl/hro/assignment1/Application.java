package nl.hro.assignment1;

import nl.hro.assignment1.model.Employee;
import nl.hro.assignment1.persistence.Database;
import org.hibernate.Session;

/**
 * Created by marcel on 23-10-2016.
 */
public class Application {

    public static void main(String[] args) {
        Session session = Database.getDatabaseInstance().getSessionFactory().openSession(); // Open a session with the database

        session.beginTransaction(); // Start a new transaction

        Employee newEmployee = new Employee(); // Create the object of your desire

        newEmployee.setName("Marcel"); // Set all the fields that are not nullable
        newEmployee.setSurname("Hollink"); // Set all the fields that are not nullable
        newEmployee.setBsn(1234567980); // Set also those field you want to have filled in...
        // ect...

        session.save(newEmployee); // Save the object to the transaction

        session.getTransaction().commit(); // Commit the transaction to the database

        session.close(); // Close the used session for this transaction (not needed, but recommended)
    }
}
