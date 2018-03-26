//
//  ShowContactPersoTableViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowContactPersoTableViewController: UITableViewController {

    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var prenomLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!

    var contactPerso: ContactPerso? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomLabel.text = contactPerso?.nomContact
        prenomLabel.text = contactPerso?.prenomContact
        adresseLabel.text = contactPerso?.adresseContact
        mailLabel.text = contactPerso?.mailContact
        telLabel.text = contactPerso?.telContact
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
