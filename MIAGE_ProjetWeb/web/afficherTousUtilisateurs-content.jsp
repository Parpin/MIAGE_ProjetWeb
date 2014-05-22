<%--  
    Document   :  
    Created on : 
    Author     : 
--%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
    "http://www.w3.org/TR/html4/loose.dtd">  

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<html>  
    <body>  
        <div class="container-fluid">
            <div class="row">


                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <div class="jumbotron">
                        <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->  
                        <h1>Gestionnaire d'utilisateurs</h1>   
                    </div>
                    <c:if test="${!empty param['message']}">  
                        <div class="alert alert-danger">
                              ${param.message}
                        </div>  
                    </c:if> 

                   <c:if test="${param['action'] == 'listerLesUtilisateurs'}" >  
                        <h2>Liste des utilisateurs</h2>  
                        <br>
                        <table  class="table table-hover">  
                            <!-- La ligne de titre du tableau des comptes -->  
                            <tr>  
                                <td><b>Login</b></td>  
                                <td><b>Nom</b></td>  
                                <td><b>Prénom</b></td>  
                                <td><b>Ville</b></td>  
                                <td></td>   
                            </tr>  

                            <!-- Ici on affiche les lignes, une par utilisateur -->  
                            <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
                            <c:set var="total" value="0"/>  

                            <c:forEach var="u" items="${requestScope['listeDesUsers']}">  
                                <tr>  
                                    <td>${u.login}</td>  
                                    <td>${u.lastname}</td>  
                                    <td>${u.firstname}</td> 
                                    <td>${u.ville}</td> 
                                    <td> 
                                        <form role="form" action="ServletUsers" method="get">
                                            <button type="submit "class="btn btn-default btn-lg">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                            </button>
                                            <input type="hidden" name="login" value=${u.login}>
                                            <input type="hidden" name="nom" value=${u.lastname}>
                                            <input type="hidden" name="prenom" value=${u.firstname}>
                                            <input type="hidden" name="ville" value=${u.ville}>
                                            
                                            <input type="hidden" name="action" value="modifierUtilisateur">  
                                        </form>                                       
                                    </td>                           
                                    <td> 
                                        <form role="form" action="ServletUsers" method="get">
                                            <button type="submit" class="btn btn-default btn-lg">
                                            <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <input type="hidden" name="login" value=${u.login}>
                                            <input type="hidden" name="action" value="supprimerUtilisateur">   
                                        </form>            
                                    </td>
   
                                    <!-- On compte le nombre de users -->  
                                    <c:set var="total" value="${total+1}"/>  
                                </tr>  
                            </c:forEach>  

                            <!-- Affichage du solde total dans la dernière ligne du tableau -->  
                            <tr><td><b>TOTAL</b></td><td></td><td><b>${total}</b></td><td></td><td></td><td></td></tr>  
                        </table>  

                    </c:if>  
                        
     <ul class="pagination">
    <c:set var="totalUtilisateur" value="${requestScope['nombreUtilisateur']}"/>                      
    <c:forEach var="i" begin="1" end="${totalUtilisateur}" step="10">
        <li
            <c:if test="${i== requestScope['offset'] }">
                class="active"
            </c:if>  
            >
            <c:choose>
                <c:when test="${i+10>totalUtilisateur}">
                    <a href="ServletUsers?action=pagination&offset=${i-1}">   ${i} - ${totalUtilisateur}</a>
                </c:when>
                <c:otherwise>
                    <a href="ServletUsers?action=pagination&offset=${i-1}">    ${i} - ${i+9}</a>
                </c:otherwise>
            </c:choose>
        </li>
        
    </c:forEach>  
     </ul>


        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    </body>  
    <!-- Latest compiled and minified JavaScript -->
</html>