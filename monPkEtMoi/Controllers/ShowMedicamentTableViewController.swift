//
//  ShowMedicamentTableViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowMedicamentTableViewController: UITableViewController {

    @IBOutlet weak var nomMedicament: UILabel!
    @IBOutlet weak var descriptionTF: UITextField!
    
    var medicament:Medicament? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = medicament?.nomMedicament
        self.nomMedicament.text = self.medicament?.nomMedicament
        self.descriptionTF.text = self.medicament?.descriptionMedicament
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDetails(){
        performSegue(withIdentifier: "showDoses", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowDosageMedicamentTableViewController
        destinationVC.medicament = self.medicament
    }

}
