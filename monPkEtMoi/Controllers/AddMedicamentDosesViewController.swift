//
//  AddMedicamentDosesViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 22/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddMedicamentDosesViewController: UITableViewController {
    
    var nomMedoc: String? = nil
    var descriptionMedoc: String? = nil
    var newMedicament: Medicament? = nil
    
    var dosesPriseCell: [DoseAjoutTableViewCell] = [DoseAjoutTableViewCell()]
    @IBOutlet weak var removeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func removeDose(_ sender: Any) {
        dosesPriseCell.removeLast()
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: dosesPriseCell.count, section: 0)], with: .automatic)
        tableView.endUpdates()
        if dosesPriseCell.count == 1 {
            removeButton.isHidden = true
            removeButton.isEnabled = false
        }
    }
    // MARK: - Ajouter un champ d'heure
    @IBAction func addDose(_ sender: Any) {
        dosesPriseCell.append(DoseAjoutTableViewCell())
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: dosesPriseCell.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
        removeButton.isHidden = false
        removeButton.isEnabled = true
    }
 
    @IBAction func saveMedicament(_ sender: Any) {
        let doses:[String] = dosesPriseCell.map{(cell) in
            print(cell)
            return cell.doseTF.text!
        }
        do{
            newMedicament = try Medicament.create(withDescription: self.descriptionMedoc, withNom: self.nomMedoc!, withDosage: doses)
            DialogBoxHelper.alert(view: self, WithTitle: "Medicament ajouté", andMessage: "Ajout avec succès", closure: {(action) in
                self.performSegue(withIdentifier: "addMedicament", sender: self)
            })
        } catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    // TODO: Sort le tableau après l'ajout du nouveau médicament
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowMedicamentsViewController
        destinationVC.medicaments.append(self.newMedicament!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dosesPriseCell.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDose", for: indexPath) as! DoseAjoutTableViewCell
        
        dosesPriseCell[indexPath.row] = cell
        return cell
    }
}
