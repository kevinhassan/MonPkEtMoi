//
//  AddContactPersoTableViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddContactPersoTableViewController: UITableViewController {

    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var prenomTF: UITextField!
    @IBOutlet weak var adresseTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    
    var newContactPerso: ContactPerso? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addContactPerso(_ sender: Any) {
        let inputs: [String: UITextField] = ["nom": nomTF,"prenom":prenomTF,"adresse":adresseTF,"mail":mailTF,"tel":telTF]
        if FormValidatorHelper.validateForm(inputs){
            do{
                newContactPerso = try ContactPerso.create(withMail: mailTF.text!, withNom: nomTF.text!, withPrenom: prenomTF.text!, withTel: telTF.text!, withAdresse: adresseTF.text!)
                DialogBoxHelper.alert(view: self, WithTitle: "Ajout du contact", andMessage: "Ajouté avec succès", closure: {(action) in
                    self.performSegue(withIdentifier: "showListContactPerso", sender: self)
                })
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Ajout du contact échoué")
            }
            
        }else{
            DialogBoxHelper.alert(view: self, WithTitle: "Erreur", andMessage: "Données du formulaire invalides", closure: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowContactsPersoViewController
        destinationVC.contactsPerso!.append(newContactPerso!)
    }
}
