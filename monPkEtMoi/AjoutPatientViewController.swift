//
//  AjoutPatientViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit
import CoreData
class AjoutPatientViewController: UITableViewController {

    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet weak var prenomTF: UITextField!
    @IBOutlet weak var dateNaissanceTF: UITextField!
    @IBOutlet weak var adresseTF: UITextField!
    @IBOutlet weak var tempsPreparationTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    
    /// Vérifier que le formulaire est valide
    func validateForm(_ inputs: [String: UITextField])-> Bool {
        // Filtrer les valeurs optionnelles (textField vide)
        let res = inputs.filter{(key, input) in !(input.text?.isEmpty ?? true)}
        // Si même taille alors pas de valeurs vides
        return res.count == (inputs.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    @IBAction func addPatient(_ sender: UIBarButtonItem)
    {
        let inputs:[String: UITextField] = ["nom": nomTextField,"prenom": prenomTF, "dateNaissance": dateNaissanceTF,"adresse": adresseTF, "tempsPreparation": tempsPreparationTF,"mail": mailTF,"tel": telTF]

        if validateForm(inputs){
            DialogBoxHelper.alert(view: self, WithTitle: "Bienvenue", andMessage: "Votre compte a été enregistré avec succès")
        }else{
            // Afficher une pop up d'erreur 
        }
    }
    
    
    func saveNewPatient(withName nom: String, withPrenom prenom: String){
//    func saveNewPatient(withName nom: String, withPrenom prenom: String, withDate date: Date, withAdress adresse : String, withTempsP tempsP : Date){
    
        //first get context into application delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            self.alerteError(errorMsg : "Could not save person", userinfo: "Unknow reason")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        //Create a person managedObject
        let patient = Patient(context : context)
        //then modify its name
        patient.nom = nom
        patient.prenom = prenom
//        patient.dateNaissance = date
//        patient.adresse = adresse
//        patient.tempsPreparation = tempsP
        
        do{
            try context.save()
        }catch let error as NSError{
            self.alerteError(errorMsg: "\(error)", userinfo: "\(error.userInfo)")
            return
        }
    }
    
    
    func alerteError(errorMsg error : String, userinfo user : String = "") {
        let alert = UIAlertController(title: error,
                                      message: user,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok",
                                         style: .default)
        
        
        alert.addAction(cancelAction)
        present(alert,animated: true)
        
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
