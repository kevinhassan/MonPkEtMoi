//
//  EditContactPersoTableViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 26/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class EditContactPersoTableViewController: UITableViewController {

    var contactPerso: ContactPerso? = nil

    @IBOutlet weak var nomContact: UITextField!
    @IBOutlet weak var prenomContact: UITextField!
    @IBOutlet weak var telContact: UITextField!
    @IBOutlet weak var mailContact: UITextField!
    @IBOutlet weak var adresseContact: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nomContact.text = contactPerso?.nomContact
        self.prenomContact.text = contactPerso?.prenomContact
        self.telContact.text = contactPerso?.telContact
        self.mailContact.text = contactPerso?.mailContact
        self.adresseContact.text = contactPerso?.adresseContact
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editContactPerso(_ sender: Any) {
        let inputs: [String:UITextField] = ["nom": nomContact, "prenom": prenomContact,"mail": mailContact, "adresse": adresseContact, "tel": telContact]
        if FormValidatorHelper.validateForm(inputs){
            do{
                try contactPerso?.edit(withMail: mailContact.text!, withNom: nomContact.text!, withPrenom: prenomContact.text!, withTel: telContact.text!, withAdresse: adresseContact.text!)
                DialogBoxHelper.alert(view: self, WithTitle: "Edition du contact", andMessage: "La mise à jours du contact est effectuée", closure: {(action) in
                    self.performSegue(withIdentifier: "editContactPerso", sender: self)
                })
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Erreur lors de l'ajout du contact professionnel")
            }
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Formulaire invalide")
        }
    }
}
