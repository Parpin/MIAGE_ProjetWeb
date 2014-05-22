/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.util.Collection;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utilisateurs.gestionnaires.GestionnaireUtilisateurs;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author Steph
 */
@WebServlet(name = "ServletUsers", urlPatterns = {"/ServletUsers"})
public class ServletUsers extends HttpServlet {
    @EJB
    private GestionnaireUtilisateurs gestionnaireUtilisateurs;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
protected void processRequest(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        // Pratique pour décider de l'action à faire  
        String action = request.getParameter("action");  
        String forwardTo = "";  
        String message = "";  
  
        if (action != null) {  
            if (action.equals("pagination")) {  
                request.setAttribute("nombreUtilisateur", gestionnaireUtilisateurs.getNombreUtilisateur());
                request.setAttribute("offset",new Integer(request.getParameter("offset")));
                request.setAttribute("listeDesUsers", gestionnaireUtilisateurs.getListeUtilisateurs(new Integer(request.getParameter("offset"))));
                forwardTo = "afficherTousUtilisateurs.jsp?action=listerLesUtilisateurs";   
                message = "";  
            }
            else if (action.equals("creerUtilisateursDeTest")) {  
                gestionnaireUtilisateurs.creerUtilisateursDeTest();  
                Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();  
                request.setAttribute("listeDesUsers", liste);  
                forwardTo = "creerUtilisateur.jsp?action=todo";  
                message = "Le jeu d'utilisateur a bien été créé!";  
            } else if (action.equals("creerUtilisateur")) {  
                gestionnaireUtilisateurs.creeUtilisateur(request.getParameter("prenom"),request.getParameter("nom"),request.getParameter("login"),request.getParameter("mdp"),request.getParameter("ville")); 
                Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();  
                request.setAttribute("listeDesUsers", liste);  
                forwardTo = "creerUtilisateur.jsp?action=todo";  
                message = "L'utilisateur a bien été créé!"; 
            }
            else if (action.equals("supprimerUtilisateur")) {  
                
                Utilisateur u = gestionnaireUtilisateurs.getUtilisateurByLogin((String)request.getParameter("login"));
                gestionnaireUtilisateurs.remove(u);
                Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();  
                request.setAttribute("listeDesUsers", liste);  
                forwardTo = "index.jsp?action=todo";   
                message = "L'utilisateur a bien été supprimé"; 
            } 
           else if (action.equals("modifierUtilisateur")) {  

                request.setAttribute("login", request.getParameter("login"));
                request.setAttribute("nom", request.getParameter("nom"));
                request.setAttribute("prenom", request.getParameter("prenom"));
                request.setAttribute("ville", request.getParameter("ville"));
                forwardTo = "modifierUtilisateur.jsp?action=todo";   
                message = ""; 
            } 
            else if (action.equals("updateUtilisateur")) {  

                String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
                String ville = request.getParameter("ville");
                String login = request.getParameter("login");
                
                
                gestionnaireUtilisateurs.editUtilisateur(nom, prenom, login,ville);  
                Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();  
                request.setAttribute("listeDesUsers", liste);  
                forwardTo = "modifierUtilisateur.jsp?action=todo";   
                message = "L'utilisateur a bien été modifié."; 
            } 
            else if (action.equals("login")) {  

                if( gestionnaireUtilisateurs.isEmpty())
                    gestionnaireUtilisateurs.creeUtilisateur("admin", "admin", "admin", "admin", "");

                if(gestionnaireUtilisateurs.testLogin(request.getParameter("login"), request.getParameter("mdp"))){
                     HttpSession session = request.getSession(true);    
                     session.setAttribute("isLogged",true);
                     Utilisateur u = gestionnaireUtilisateurs.getUtilisateurByLogin(request.getParameter("login"));
                     session.setAttribute("nomLog",u.getFirstname());
                     session.setAttribute("prenomLog",u.getLastname());
                     forwardTo = "index.jsp?action=todo";   
                     message = "";
                }
                else{
                    forwardTo = "index.jsp?action=todo";   
                    message = "Identifiant ou mot de passe incorect"; 
                }

            } 
            else if (action.equals("deconnexion")) {  

                HttpSession session = request.getSession(true);    
                // Recupere l'age de l'utilisateur 
                session.setAttribute("isLogged",false);
                session.setAttribute("nomLog","");
                session.setAttribute("prenomLog","");
                forwardTo = "index.jsp?action=todo";   
                message = ""; 
            } 
            else if (action.equals("chercherParLogin")) {  
                Utilisateur u = gestionnaireUtilisateurs.getUtilisateurByLogin((String)request.getParameter("login"));

                Collection<Utilisateur> liste = gestionnaireUtilisateurs.getAllUsers();  
                liste.clear();
                if(u!=null){
                    liste.add(u);
                    message= "";
                    request.setAttribute("nombreUtilisateur", 1);
                }
                else{
                    message = "Aucun utilisateur ne correspond a ce login"; 
                    request.setAttribute("nombreUtilisateur", 0);
                }
                
                request.setAttribute("listeDesUsers", liste);  
                forwardTo = "afficherTousUtilisateurs.jsp?action=listerLesUtilisateurs";    
            } else {  
                
                forwardTo = "index.jsp?action=todo";  
                message = "La fonctionnalité pour le paramètre " + action + " est à implémenter !";  
            }  
            
            
        }  
  
        RequestDispatcher dp = request.getRequestDispatcher(forwardTo + "&message=" + message);  
        dp.forward(request, response);  
        // Après un forward, plus rien ne peut être exécuté après !  
    }  

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
