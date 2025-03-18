<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "cnam";
    String password = "cnam";

    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, password);

    // Exercice 1 : Films entre 2000 et 2015
    String sql1 = "SELECT idFilm, titre, annee FROM Film WHERE annee >= 2000 AND annee <= 2015";
    PreparedStatement pstmt1 = conn.prepareStatement(sql1);
    ResultSet rs1 = pstmt1.executeQuery();

    out.println("<h2>Exercice 1 : Films entre 2000 et 2015</h2>");
    while (rs1.next()) {
        out.println("id : " + rs1.getString("idFilm") + ", titre : " + rs1.getString("titre") + ", année : " + rs1.getString("annee") + "</br>");
    }
    rs1.close();
    pstmt1.close();

    // Exercice 2 : Année de recherche
    String anneeRecherche = request.getParameter("anneeRecherche");
    if (anneeRecherche != null) {
        String sql2 = "SELECT idFilm, titre, annee FROM Film WHERE annee = ?";
        PreparedStatement pstmt2 = conn.prepareStatement(sql2);
        pstmt2.setString(1, anneeRecherche);
        ResultSet rs2 = pstmt2.executeQuery();

        out.println("<h2>Exercice 2 : Films de l'année " + anneeRecherche + "</h2>");
        while (rs2.next()) {
            out.println("id : " + rs2.getString("idFilm") + ", titre : " + rs2.getString("titre") + ", année : " + rs2.getString("annee") + "</br>");
        }
        rs2.close();
        pstmt2.close();
    } %>

    <form action="#" method="post">
        <h2>Recherche par année</h2>
        <label>Année : <input type="text" name="anneeRecherche"></label>
        <input type="submit" value="Rechercher">
    </form>

    <% // Exercice 3 : Modification du titre du film
    String filmId = request.getParameter("filmId");
    String nouveauTitre = request.getParameter("nouveauTitre");

    if (filmId != null && nouveauTitre != null) {
        String sql3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
        PreparedStatement pstmt3 = conn.prepareStatement(sql3);
        pstmt3.setString(1, nouveauTitre);
        pstmt3.setString(2, filmId);
        pstmt3.executeUpdate();
        out.println("<p>Le titre du film avec l'ID " + filmId + " a été modifié avec succès.</p>");
        pstmt3.close();
    } %>

    <form action="#" method="post">
        <h2>Modification du titre du film</h2>
        <label>ID du film : <input type="text" name="filmId"></label>
        <label>Nouveau titre : <input type="text" name="nouveauTitre"></label>
        <input type="submit" value="Modifier">
    </form>

    <% // Exercice 4 : Insertion d'un nouveau film
    String nouveauFilmTitre = request.getParameter("nouveauFilmTitre");
    String nouveauFilmAnnee = request.getParameter("nouveauFilmAnnee");

    if (nouveauFilmTitre != null && nouveauFilmAnnee != null) {
        String sql4 = "INSERT INTO Film (titre, annee) VALUES (?, ?)";
        PreparedStatement pstmt4 = conn.prepareStatement(sql4);
        pstmt4.setString(1, nouveauFilmTitre);
        pstmt4.setString(2, nouveauFilmAnnee);
        pstmt4.executeUpdate();
        out.println("<p>Le film \"" + nouveauFilmTitre + "\" a été ajouté avec succès.</p>");
        pstmt4.close();
    } %>

    <form action="#" method="post">
        <h2>Ajout d'un nouveau film</h2>
        <label>Titre du film : <input type="text" name="nouveauFilmTitre"></label>
        <label>Année du film : <input type="text" name="nouveauFilmAnnee"></label>
        <input type="submit" value="Ajouter">
    </form>

    <% conn.close(); %>

<hr>
<h3>Projet Bibliothèque</h3>
<p>Votre projet consiste à concevoir et développer une application de gestion de bibliothèque moderne qui simplifie le processus de prêt et de retour de livres.</p>
<ul>
<li>L’enregistrement et la suppression de livres.</li>
<li>La recherche de livres disponibles.</li>
<li>L'emprunt possible d'un livre par un utilisateur.</li>
<li>La gestion des utilisateurs.</li>
<li>La gestion des stocks.</li>
</ul>
<p>Votre travail est de créer votre code afin de répondre aux besoins définis ci-dessus. L'application exploitera le langage JSP (JAVA) pour interagir avec la base de données MariaDB.</p>
<p>L’application pourra être enrichie avec des fonctionnalités supplémentaires telles que des recommandations de livres, des notifications pour les retours en retard, ou encore des rapports statistiques sur l'utilisation des livres pour améliorer l'expérience utilisateur et la gestion de la bibliothèque.</p>
</body>
</html>
