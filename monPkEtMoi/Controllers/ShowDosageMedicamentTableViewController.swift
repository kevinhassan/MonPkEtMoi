//
//  ShowDosageMedicamentTableViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowDosageMedicamentTableViewController: UITableViewController {

    var medicament:Medicament? = nil
    var dosages: [String]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        dosages = medicament?.dosageMedicament
    }
    // TODO: - Mettre à jours le médicament et revenir en arrière
    @IBAction func saveMedicament(_ sender: Any) {
        do{
            try medicament?.edit(withDescription: nil, withNom: nil, withDosage: dosages)
            DialogBoxHelper.alert(view: self, WithTitle: "Ajouté", andMessage: "Dosage ajouté", closure: {(action) in
                self.navigationController?.popViewController(animated: true)
            })
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    @IBAction func addDosage(_ sender: Any) {
        let alertController = UIAlertController(title: "Ajout du dosage", message: "Entrer le dosage", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Ajouter", style: .default) { (_) in
            let dosage = alertController.textFields?[0].text
            self.dosages?.append(dosage!)
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: (self.dosages?.count)!-1, section: 0)], with: .automatic)
            self.tableView.endUpdates()
        }
        
        let cancelAction = UIAlertAction(title: "Annuler", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Entrer le dosage"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (dosages?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doseCell", for: indexPath) as! DoseTableViewCell

        cell.doseLabel.text = "Dose"
        cell.doseValue.text = dosages?[indexPath.row]
        return cell
    }

}
