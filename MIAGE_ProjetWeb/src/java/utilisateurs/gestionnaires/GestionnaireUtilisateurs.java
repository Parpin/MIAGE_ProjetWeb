package utilisateurs.gestionnaires;  
  
import java.util.Collection;  
import java.util.List;
import javax.ejb.Stateless;  
import javax.persistence.EntityManager;  
import javax.persistence.PersistenceContext;  
import javax.persistence.Query;  
import utilisateurs.modeles.Utilisateur;  
  
@Stateless  
public class GestionnaireUtilisateurs {  
    // Ici injection de code : on n'initialise pas. L'entity manager sera créé  
    // à partir du contenu de persistence.xml  
    @PersistenceContext  
    private EntityManager em;  
  
    public void creerUtilisateursDeTest() {  
        creeUtilisateur("John", "Lennon", "jlennon","mdp","Nice");  
        creeUtilisateur("Paul", "Mac Cartney", "pmc","mdp","Nice");  
        creeUtilisateur("Ringo", "Starr", "rstarr","mdp","Nice");  
        creeUtilisateur("Georges", "Harisson", "georgesH","mdp","Nice");  
        creeUtilisateur("Yan", "Datin", "ydatin","187848","Nice");  
        creeUtilisateur("Steven", "Siddi", "ssiddi","84874","Nice");  
        creeUtilisateur("Christian", "Pavinich", "cpavi","mdpmdp","Nice");  
        creeUtilisateur("Stephen", "Coda", "scoda","root","Drap");
        creeUtilisateur("Jade", "Coda", "jcoda","mdp","Antibes");  
        creeUtilisateur("Didier", "Coda", "dcoda","mdp","Nice");  
        creeUtilisateur("Xavier", "Nego", "xnego","mdp","Nice");  
        creeUtilisateur("Leo", "Vallee", "lval","mdp","Marseille");
        creeUtilisateur("Jacques", "Vallee", "jval","mdp","Lille");  
        creeUtilisateur("Jean", "Bon", "jamb","jambon","Lyon");  
        creeUtilisateur("Anne", "Orac", "anor","ifrjfr","Oraison");  
        creeUtilisateur("Marc", "Dupont", "mdup","mdpmdp","Nantes");
        creeUtilisateur("Laurie", "Camous", "lcam","mdpmdpmdp","Nantes");  
        creeUtilisateur("Lisa", "Crouz", "lcrouz","iijfe","Lille");  
        creeUtilisateur("Antoine", "Jacinto", "ajacint","jfdijefije","Lyon");  
        creeUtilisateur("Gaetan", "Ardisson", "gardi","ijfijef","Dijon");
    }  
  
    public int getNombreUtilisateur(){
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");  
        return q.getResultList().size();
    }
    public Utilisateur creeUtilisateur(String nom, String prenom, String login, String mdp, String ville) {  
        Utilisateur u = new Utilisateur(nom, prenom, login, mdp, ville);  
        em.persist(u);  
        return u;  
    }  
    public <T> void remove(T o) { 
        if(o == null)
            return;
        em.remove(em.merge(o));
    }
    public Collection<Utilisateur> getAllUsers() {  
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");  
        return q.getResultList();  
    }  
    public boolean isEmpty() {  
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");  
        return q.getResultList().size()==0;
    } 
    public Utilisateur getUtilisateurByLogin(String login) {
        Query q = em.createQuery("select u from Utilisateur u where u.login=:param");
        q.setParameter("param", login);
        if (q.getResultList().size() != 0)
            return (Utilisateur)q.getSingleResult();
        else
            return null;
    }
    public boolean testLogin(String login, String mdp) {
        Query q = em.createQuery("select u from Utilisateur u where u.login=:param  and u.mdp = :param2");
        q.setParameter("param", login);
        q.setParameter("param2", mdp);
        if (q.getResultList().size() == 0)
            return false;
        else
            return true;
    }
    
    public void editUtilisateur(String nom, String prenom, String login, String ville) {
        Query q = em.createQuery("select u from Utilisateur u where u.login = :login");
        q.setParameter("login", login);
        List<Utilisateur> users = q.getResultList();
        Utilisateur user = users.get(0); 
        user.setFirstname(prenom);
        user.setLastname(nom);
        user.setVille(ville);
        em.merge(user);
    }
    public Collection<Utilisateur> getCount() {
          Query q = em.createQuery("select count(u) from Utilisateur u");  
          return q.getResultList();
  }
    public Collection<Utilisateur> getListeUtilisateurs(int offset) {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");

        q.setFirstResult(offset);
        q.setMaxResults(10);        
        return q.getResultList();
    }
    
    // Add business logic below. (Right-click in editor and choose  
    // "Insert Code > Add Business Method")  
}  