package nl.hro.assignment1.persistence;

import nl.hro.assignment1.model.Employee;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 * Created by marcel on 23-10-2016.
 */
public class Database {

    private static Database databaseInstance; // Singleton instance of the database object

    private final SessionFactory sessionFactory; // Creates the sessions

    public static Database getDatabaseInstance() { // getter of the database object
        if(databaseInstance == null) databaseInstance = new Database();
        return databaseInstance;
    }

    private Database(){ // Private constructor for the singleton
        Configuration configuration = new Configuration().configure(); // Create configuration object, and configure from "/src/hibernate.cfg.xml"

        StandardServiceRegistry standardServiceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build(); //

        this.sessionFactory = configuration // Create the session factory with all the tables
                .addAnnotatedClass(Employee.class) // Each anotated class can be added in a chain
                .buildSessionFactory(standardServiceRegistry); // Build the session factory
    };

    public SessionFactory getSessionFactory() { // Return the Factory object
        return sessionFactory;
    }
}
