//
//  AddMedicamentViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 22/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddMedicamentViewController: UITableViewController {
    

    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    
    var medicament: Medicament? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addDoses(_ sender: Any) {
        performSegue(withIdentifier: "addDoses", sender: self)
    }
    
    @IBAction func saveMedicament(_ sender: Any) {
        let inputs:[String: UITextField] = ["nom": nomTF]
        if FormValidatorHelper.validateForm(inputs){
            self.performSegue(withIdentifier: "addDoses", sender: self)
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Formulaire invalide")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addDoses"){
            let destinationVC = segue.destination as! AddMedicamentDosesViewController
            destinationVC.nomMedoc = self.nomTF.text
            destinationVC.descriptionMedoc = self.descriptionTF.text
        }
    }
}
