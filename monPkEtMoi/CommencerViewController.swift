//
//  CommencerViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class CommencerViewController: UIViewController, UITableViewDelegate{
    
    var patients : [Patient] = []
    
    
    @IBAction func addAction(_ sener: Any){
        let alert = UIAlertController(title: "Nouveau Nom",
                                      message: "Ajouter un nom",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title : "Ajouter",
                                       style: .default)
        
        {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else{
                    return
            }
            self.saveNewPatient(withName: nameToSave)
    
        }
        
        let cancelAction = UIAlertAction(title: "Annuler",
                                         style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,animated: true)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            self.alerteError(errorMsg : "Could not save person", userinfo: "Unknow reason")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        // creer une requête associée à l'entité patient
                
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func saveNewPatient(withName nom: String){
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
