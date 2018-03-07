//
//  AjoutPatientViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AjoutPatientViewController: UITableViewController {

    
    var patients : [Patient] = []
    
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
    
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem){
        let alert = UIAlertController(title: "Nouveau Nom",
                                      message: "Ajouter un nom",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title : "Ajouter",
                                       style: .default)
        {
            [unowned self] action in
            guard let nomTextField = alert.textFields?.first,
                let nomPatient = nomTextField.text else{
                    return
            }
            
            guard let prenomTF = alert.textFields?.first,
                let prenomPatient = prenomTF.text else{
                    return
            }

//            guard let dateNaissanceTF = alert.textFields?.first,
//                let naissPatient = dateNaissanceTF.text else{
//                    return
//            }
//
//            guard let adresseTF = alert.textFields?.first,
//                let adressePatient = adresseTF.text else{
//                    return
//            }
//
//            guard let tempsPreparationTF = alert.textFields?.first,
//                let tempsPatient = tempsPreparationTF.text else{
//                    return
//            }

            self.saveNewPatient(withName: nomPatient, withPrenom : prenomPatient)
            
//            self.saveNewPatient(withName: nomPatient, withPrenom : prenomPatient, withDate : naissPatient, withAdress : adressePatient, withTempsP : tempsPatient)
            
        }
        
        let cancelAction = UIAlertAction(title: "Annuler",
                                         style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
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
            self.patients.append(patient)
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
