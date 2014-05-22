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
                    
                    <h2>Afficher les details d'un utilisateur</h2>  
        
                    <form role="form" action="ServletUsers" method="get"> 
                            <div class="form-group">
                                <label for="login">Login :</label>
                                <input type="text" class="form-control" id="login" name="login" placeholder="entrer login">
                            </div>
                            <input type="hidden" name="action" value="chercherParLogin"/>  
                            <input type="submit" class="btn btn-default" value="Chercher" name="submit"/>  
                        </form> 
                    </ul>  

                    <!-- Fin du menu -->  
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    </body>  
    <!-- Latest compiled and minified JavaScript -->
</html>