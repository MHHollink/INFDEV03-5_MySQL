package nl.hro.assignment1.controller;

import com.sun.javafx.collections.ObservableListWrapper;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import nl.hro.assignment1.Application;
import nl.hro.assignment1.model.Employee;
import nl.hro.assignment1.persistence.Database;
import org.hibernate.Session;

import java.util.stream.Collectors;

public class DeleteEmployeeController {

    public ChoiceBox bsn;

    @FXML
    public void initialize() {
        Session session =  Database.getDatabaseInstance().getSessionFactory().openSession();
        session.beginTransaction();

        String hql = "select a from " + Employee.class.getSimpleName() + " a";


        ObservableList<Integer> list = new ObservableListWrapper<>(
                session.createQuery(hql, Employee.class).list().stream().map(Employee::getBsn).collect(Collectors.toList())
        );
        bsn.setItems(list);

        session.close();
    }

    public void submit(ActionEvent actionEvent) {

        Session session = Database.getDatabaseInstance().getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(new Employee(((int) bsn.getValue()), null, null, null));
        session.getTransaction().commit();
        session.close();

        Application.getContext().returnToMainStage();
    }

    public void cancel(ActionEvent actionEvent) {
        Application.getContext().returnToMainStage();
    }
}
