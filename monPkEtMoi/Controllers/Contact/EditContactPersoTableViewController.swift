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
        performSegue(withIdentifier: "editContactPerso", sender: self)
    }
}
