//
//  ShowContactProTableViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowContactProTableViewController: UITableViewController {

    
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var prenomLabel: UILabel!
    @IBOutlet weak var specialiteLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    
    var contactPro: ContactPro? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomLabel.text = contactPro?.nomContact
        prenomLabel.text = contactPro?.prenomContact
        mailLabel.text = contactPro?.mailContact
        telLabel.text = contactPro?.telContact
        specialiteLabel.text = contactPro?.etreDuType?.libelleTypeSoignant
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
