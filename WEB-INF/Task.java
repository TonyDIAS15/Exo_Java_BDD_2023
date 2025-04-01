package classes;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Task implements Serializable {
    private String titre;
    private String description;
    private Date dateEcheance;
    private boolean terminee;

    public Task(String titre, String description, Date dateEcheance) {
        this.titre = titre;
        this.description = description;
        this.dateEcheance = dateEcheance;
        this.terminee = false;
    }

    public String getTitre() { return titre; }
    public String getDescription() { return description; }
    public Date getDateEcheance() { return dateEcheance; }
    public boolean isTerminee() { return terminee; }

    public void setTerminee(boolean terminee) { this.terminee = terminee; }

    public String getDateEcheanceFormattee() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(dateEcheance);
    }
}
