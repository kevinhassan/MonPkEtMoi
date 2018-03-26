//
//  EditContactProTableViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 26/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class EditContactProTableViewController: UITableViewController {

    var contactPro: ContactPro? = nil
    
    @IBOutlet weak var nomContact: UITextField!
    @IBOutlet weak var prenomContact: UITextField!
    @IBOutlet weak var mailContact: UITextField!
    @IBOutlet weak var specialiteContact: UITextField!
    @IBOutlet weak var telContact: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomContact.text = contactPro?.nomContact
        prenomContact.text = contactPro?.prenomContact
        mailContact.text = contactPro?.mailContact
        specialiteContact.text = contactPro?.etreDuType?.libelleTypeSoignant
        telContact.text = contactPro?.telContact
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
