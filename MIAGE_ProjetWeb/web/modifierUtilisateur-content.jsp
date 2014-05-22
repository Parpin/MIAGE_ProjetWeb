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
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>Gestionnaire d'utilisateurs</title>  

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    </head>  
    <body>  
        <div class="container-fluid">
            <div class="row">


                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <div class="jumbotron">
                        <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->  
                        <h1>Gestionnaire d'utilisateurs</h1>    
                    </div>
                    <c:if test="${!empty param['message']}">  
                        <div class="alert alert-success">
                           ${param.message}
                        </div>  
                    </c:if> 
                    <h2>Modifier un utilisateur</h2>  
                    
                    <form role="form" action="ServletUsers" method="get"> 
                        
                            <div class="form-group">
                                <label for="login">Login :</label>
                                
                               <input type="text" class="form-control" id="login" name="login" disabled="disabled" value ="${requestScope['login']}" placeholder="entrer login">
                            </div> 
                            <div class="form-group">
                                <label for="nom">Nom :</label>
                                <input type="text" class="form-control" id="nom" name="nom" value ="${requestScope['nom']}" placeholder="entrer nom">
                            </div>
                            <div class="form-group">
                                <label for="prenom">Prénom :</label>
                                <input type="text" class="form-control" id="prenom" name="prenom" value ="${requestScope['prenom']}" placeholder="entrer prenom">
                            </div>
                            <div class="form-group">
                                <label for="login">Ville :</label>
                                <input type="text" class="form-control" id="ville" name="ville" value ="${requestScope['ville']}" placeholder="entrer ville">
                            </div> 
                            <input type="hidden" name="action" value="updateUtilisateur"/> 
                            <input type="hidden" name="login" value="${requestScope['login']}"/>  
                            <input type="submit" class="btn btn-default" value="Mettre à jour" name="submit"/>  
                        </form>  
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    </body>  
    <!-- Latest compiled and minified JavaScript -->
</html>