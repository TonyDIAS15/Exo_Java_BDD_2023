<%@ page import="classes.Task, java.util.*" %>
<%
    HttpSession session = request.getSession();
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }

    String supprimerIndex = request.getParameter("supprimer");
    if (supprimerIndex != null) {
        tasks.remove(Integer.parseInt(supprimerIndex));
        response.sendRedirect("lister.jsp");
        return;
    }

    String terminerIndex = request.getParameter("terminer");
    if (terminerIndex != null) {
        tasks.get(Integer.parseInt(terminerIndex)).setTerminee(true);
        response.sendRedirect("lister.jsp");
        return;
    }
%>

<h2>Liste des tâches</h2>
<% if (tasks.isEmpty()) { %>
    <p>Aucune tâche enregistrée.</p>
<% } else { %>
    <ul>
    <% for (int i = 0; i < tasks.size(); i++) {
        Task t = tasks.get(i);
    %>
        <li>
            <strong><%= t.getTitre() %></strong> - 
            <%= t.getDescription() %> (Échéance: <%= t.getDateEcheanceFormattee() %>)
            <% if (t.isTerminee()) { %> Terminée <% } else { %>
                <a href="lister.jsp?terminer=<%=i%>">Marquer comme terminée</a>
            <% } %> |
            <a href="lister.jsp?supprimer=<%=i%>">Supprimer</a>
        </li>
    <% } %>
    </ul>
<% } %>

<a href="index.jsp">Retour à l'accueil</a>
