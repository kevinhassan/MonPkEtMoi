//
//  DoctorSettingsViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 13/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class DoctorSettingsViewController: UITableViewController {

    @IBOutlet weak var modeMedecin: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func changeMode(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePatient") as! HomePatientViewController
            self.present(vc, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
