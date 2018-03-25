//
//  SettingsViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 13/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class PatientSettingsViewController: UITableViewController {

    @IBOutlet weak var modeMedecin: UITableViewCell!
    
    @IBAction func changeMode(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeDoctor") as! HomeDoctorViewController
        self.present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

