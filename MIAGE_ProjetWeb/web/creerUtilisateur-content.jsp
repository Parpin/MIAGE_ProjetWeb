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
                        <h1>Gestionnaire d'utilisateurs</h1>
                    </div>
                    <c:if test="${!empty param['message']}">  
                        <div class="alert alert-success">
                           ${param.message}
                        </div>  
                    </c:if> 

                    <form role="form" action="ServletUsers" method="get">
                            <div class="form-group">
                                <label for="nom">Nom :</label>
                                <input type="text" class="form-control" id="nom" name="nom" placeholder="entrer nom">
                            </div>
                            <div class="form-group">
                                <label for="prenom">Prenom :</label>
                                <input type="text" class="form-control" id="prenom" name="prenom" placeholder="entrer prenom">
                            </div>
                            <div class="form-group">
                                <label for="login">Login :</label>
                                <input type="text" class="form-control" id="login" name="login" placeholder="entrer login">
                            </div>
                            <div class="form-group">
                                <label for="mdp">Mot de passe :</label>
                                <input type="password" class="form-control" id="mdp" name="mdp" placeholder="entrer mot de psse">
                            </div>
                            <div class="form-group">
                                <label for="ville">Ville :</label>
                                <input type="text" class="form-control" id="ville" name="ville" placeholder="entrer ville">
                            </div>

                            <input type="hidden" name="action" value="creerUtilisateur"/>  
                            <input type="submit" value="Créer l'utilisateur" class="btn btn-default" name="submit"/> 
                            
                    </form>
                     <form role="form" action="ServletUsers" method="get">
                         <input type="hidden" name="action" value="creerUtilisateursDeTest"/>  
                        <input type="submit" value="Créer un jeu d'utilisateur" class="btn btn-default" name="submit"/> 
                    </form>                   
                        


    </body>  
    <!-- Latest compiled and minified JavaScript -->
</html>