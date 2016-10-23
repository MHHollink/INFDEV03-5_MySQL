package nl.hro.assignment1.controller;

import javafx.event.ActionEvent;
import javafx.scene.control.TextField;
import nl.hro.assignment1.Application;
import nl.hro.assignment1.model.Employee;
import nl.hro.assignment1.persistence.Database;
import org.hibernate.Session;

public class AddEmployeeController {

    public TextField bsn;
    public TextField surname;
    public TextField name;

    public void submit(ActionEvent actionEvent) {
        Employee e = new Employee();

        e.setBsn(Integer.parseInt(bsn.getText()));
        e.setName(name.getText());
        e.setSurname(surname.getText());

        Session session = Database.getDatabaseInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.save(e);
        session.getTransaction().commit();
        session.close();

        Application.getContext().returnToMainStage();
    }

    public void cancel(ActionEvent actionEvent) {
        Application.getContext().returnToMainStage();
    }
}
