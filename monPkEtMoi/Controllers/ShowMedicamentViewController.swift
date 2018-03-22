//
//  ShowMedicamentViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowMedicamentViewController: UITableViewController {

    @IBOutlet weak var nomMedicament: UILabel!
    @IBOutlet weak var descriptionTF: UITextField!
    
    var medicament:Medicament? = nil
    var posMedoc: Int? = nil
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
    @IBAction func removeMedicament(_ sender: Any) {
        DialogBoxHelper.alertAsk(view: self, WithTitle: "Supprimer un médicament", andMessage: "Etes vous sûr de vouloir supprimer ce médicament", closureContinue: {(action) in
            do{
                try self.medicament!.delete()
                DialogBoxHelper.alert(view: self, WithTitle: "Suppression du médicament", andMessage: "Suppression avec succès", closure: {(action) in
                    self.performSegue(withIdentifier: "removeMedicament", sender: self)
                })
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Suppression impossible")
            }
        }, closureCancel: nil)

    }
    
    @IBAction func saveMedicament(_ sender: Any) {
        do{
            try medicament?.edit(withDescription: self.descriptionTF.text, withNom: nil, withDosage: nil)
            DialogBoxHelper.alert(view: self, WithTitle: "Modification du médicament", andMessage: "Modification réussie", closure: {(action) in
                self.performSegue(withIdentifier: "addMedicament", sender: self)
            })
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDoses"){
            let destinationVC = segue.destination as! ShowDosageMedicamentViewController
            destinationVC.medicament = self.medicament
        }
        if(segue.identifier == "removeMedicament"){
            let destinationVC = segue.destination as! ShowMedicamentsViewController
            destinationVC.medicaments.remove(at: posMedoc!)
        }
    }
}
