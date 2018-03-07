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
    @IBOutlet weak var tempsPreparationTF: UITableViewCell!
    @IBOutlet weak var mailTF: NSLayoutConstraint!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var Boutonenregistrer: UIBarButtonItem!
    
    
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
        guard let nom = nomTextField.text else{
                    return
        }
        guard let prenom = prenomTF.text else{
                    return
        }
            
        self.saveNewPatient(withName: nom, withPrenom : prenom)
        
        let alert = UIAlertController(title: "Bienvenue",
                                      message: "Le compte a été créé avec succès !",
                                      preferredStyle: .actionSheet)
        
        let continuerAction = UIAlertAction(title: "Continuer",
                                         style: .default)
        
        
        alert.addAction(continuerAction)
        present(alert,animated: true)
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
