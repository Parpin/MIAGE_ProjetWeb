 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
     <c:choose>
        <c:when test="${sessionScope.isLogged == true}" > 
            <div class="bs-sidebar affix">
                <ul class="nav bs-sidenav">
                        <ul class="nav">
                            <li class="active"><a href="creerUtilisateur.jsp">Créer un utilisateur</a></li>
                            
                            
                            
                            <li><a href="ServletUsers?action=pagination&offset=0">Afficher tous les utilisateurs</a></li>
                            <li><a href="rechercherUtilisateur.jsp">Rechercher un utilisateur</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </c:when>
        <c:otherwise>          
        </c:otherwise>
    </c:choose>
