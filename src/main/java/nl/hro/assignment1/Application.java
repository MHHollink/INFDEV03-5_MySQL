package nl.hro.assignment1;

import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;
import nl.hro.assignment1.model.Employee;
import nl.hro.assignment1.persistence.Database;
import org.hibernate.Session;

import java.io.IOException;

/**
 * Created by marcel on 23-10-2016.
 */
public class Application extends javafx.application.Application{

    private static Application context;

    public static Application getContext() {
        return context;
    }

    // Public settings :
    public static String mainTitle = "Assignment-1";
    public static Stage mainStage;

    public static void main(String[] args) {
        launch(args);
        Database.getDatabaseInstance();
    }

    private void stashed() {
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

    public void start(Stage stage) throws Exception {
        context = this;

        mainStage = stage;
        Scene scene = new Scene(
                FXMLLoader.load(
                        getClass().getResource(
                                "/view/activity_main.fxml"
                        )
                )
        );

        mainStage.setTitle(mainTitle);
        mainStage.setResizable(false);
        mainStage.setScene(scene);
        mainStage.show();

        mainStage.addEventHandler(KeyEvent.KEY_PRESSED, key -> {
            if (key.getCode() == KeyCode.ESCAPE) {
                mainStage.close();
                System.exit(0);
            }
        });

        mainStage.setOnHiding(event -> {
            System.exit(0);
        });
    }

    public void loadScene(String fileName) {
        try {
            Scene scene = new Scene(
                    FXMLLoader.load(
                            getClass().getResource(
                                    "/view/" + fileName
                            )
                    )
            );

            mainStage.setScene(scene);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void returnToMainStage() {
        loadScene("activity_main.fxml");
    }
}
