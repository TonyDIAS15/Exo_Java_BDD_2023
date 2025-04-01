<%@ page import="classes.Task, java.util.*, java.text.*" %>
<%
    HttpSession session = request.getSession();
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        String dateStr = request.getParameter("date");

        try {
            Date dateEcheance = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
            Task nouvelleTache = new Task(titre, description, dateEcheance);
            tasks.add(nouvelleTache);
        } catch (ParseException e) {
            out.println("<p>Erreur dans la date.</p>");
        }

        response.sendRedirect("lister.jsp");
        return;
    }
%>

<h2>Ajouter une tâche</h2>
<form method="post">
    Titre: <input type="text" name="titre" required><br>
    Description: <textarea name="description" required></textarea><br>
    Date d'échéance: <input type="date" name="date" required><br>
    <input type="submit" value="Ajouter">
</form>
<a href="index.jsp">Retour à l'accueil</a>
