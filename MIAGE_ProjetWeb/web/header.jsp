<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>  
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li> CODA Stephen DATIN Yan</li>
        <li> <h2>TP2 WEB</h2></li>
      </ul>
    </div><!-- /.navbar-collapse -->
    
    
    <c:choose>
        <c:when test="${sessionScope.isLogged == true}" > 
            Bienvenue ${sessionScope['nomLog']}   ${sessionScope['prenomLog']}
            <a href="ServletUsers?action=deconnexion">Deconnexion</a>
        </c:when>
        <c:otherwise>
            <form method="GET" name="Form" action="ServletUsers"
                <p>Login : <input type="text" name="login"  /></p>
                <p> Mot de passe : <input type="password" name="mdp" /></p>
                <input type="hidden" name="action" value="login">   
                <input type="submit" name="Valider" value="Valider"/></p>
            </form>
        </c:otherwise>
    </c:choose>
  </div><!-- /.container-fluid -->
</nav>
</div>  