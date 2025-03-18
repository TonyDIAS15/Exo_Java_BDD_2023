<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p>Saisir la valeur 3 (pour Exercice 1) : <input type="text" id="inputValeur" name="valeur3">
    <p><input type="submit" value="Afficher">
</form>

<% String valeur1 = request.getParameter("valeur1"); %>
<% String valeur2 = request.getParameter("valeur2"); %>
<% String valeur3 = request.getParameter("valeur3"); %>

<% if (valeur1 != null && valeur2 != null) { %>
    <% int intValeur1 = Integer.parseInt(valeur1); %>
    <% int intValeur2 = Integer.parseInt(valeur2); %>

    <% if (intValeur1 > intValeur2) { %>
        <p>Valeur 1 est supérieure à Valeur 2.</p>
    <% } else if (intValeur1 < intValeur2) { %>
        <p>Valeur 1 est inférieure à Valeur 2.</p>
    <% } else { %>
        <p>Valeur 1 est égale à Valeur 2.</p>
    <% } %>

<h2>Exercice 1 : Comparaison 1</h2>
<% if (valeur3 != null) { %>
    <% int intValeur3 = Integer.parseInt(valeur3); %>
    <% if ((intValeur3 > intValeur1 && intValeur3 < intValeur2) || (intValeur3 > intValeur2 && intValeur3 < intValeur1)) { %>
        <p>Oui, C est compris entre A et B.</p>
    <% } else { %>
        <p>Non, C n'est pas compris entre A et B.</p>
    <% } %>
<% } %>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<% if (valeur1 != null) { %>
    <% if (intValeur1 % 2 == 0) { %>
        <p>Valeur 1 est un nombre pair.</p>
    <% } else { %>
        <p>Valeur 1 est un nombre impair.</p>
    <% } %>
<% } %>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
