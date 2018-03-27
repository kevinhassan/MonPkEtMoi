//
//  addPriseHeuresViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddPriseHeuresViewController: UITableViewController {

    var heuresPriseCell: [HeurePriseTableViewCell] = [HeurePriseTableViewCell()]
    @IBOutlet weak var removeButton: UIButton!
    
    var posologie: Posologie? = nil
    var nb: Int16? = nil
    var dosage: String? = nil
    var dateD: NSDate? = nil
    var dateF: NSDate? = nil
    var medoc: Medicament? = nil
    
     // MARK: - Supprimer un champ d'heure si il y'en a plus d'un
    @IBAction func removeHeure(_ sender: Any) {
        heuresPriseCell.removeLast()
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: heuresPriseCell.count, section: 0)], with: .automatic)
        tableView.endUpdates()
        if heuresPriseCell.count == 1 {
            removeButton.isHidden = true
            removeButton.isEnabled = false
        }
    }
     // MARK: - Ajouter un champ d'heure
    @IBAction func addHeure(_ sender: Any) {
        heuresPriseCell.append(HeurePriseTableViewCell())
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: heuresPriseCell.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
        removeButton.isHidden = false
        removeButton.isEnabled = true
    }
    //MARK: - Sauvegarder la posologie si le formulaire est valide
    //TODO: Vérifier que le formulaire n'est pas vide pour les heures de prises
    @IBAction func savePosologie(_ sender: Any) {
        let nbHeure: Int = self.heuresPriseCell.count
        let heuresPriseCell:[HeurePriseTableViewCell] = self.heuresPriseCell.filter{(cell) in
            if let _ = cell.heurePriseTF.getDate(){
                return true
            }
            return false
        }
        if nbHeure == heuresPriseCell.count{
            let heures:[NSDate] = self.heuresPriseCell.map{(cell) in
                return cell.heurePriseTF.getDate()!
            }
            do{
                posologie = try Posologie.create(withNbMedicament: nb!, withDosage: dosage!, withDateDebut: dateD!, withDateFin: dateF!, withHeures: heures, withMedicament: medoc!)
                generatePrises()
                DialogBoxHelper.alert(view: self, WithTitle: "Posologie ajoutée", andMessage: "Ajout avec succès", closure: {(action) in
                 self.performSegue(withIdentifier: "unwindFromAddHeuresPrise", sender: self)
                 })
            } catch let error as NSError{
                DialogBoxHelper.alert(view: self, error: error)
            }
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Formulaire invalide")
        }

    }
    
    func generatePrises(){
        //var counter: Double
        //do{
            //let dates: [NSDate] = (try posologie?.generatePrises())!
            // génération des notifs pour les prises
            //for date in dates{
//                counter = DateHelper.substractDateInSeconds(heure1: date,heure2: NSDate())
//                NotificationHelper.init(type: .Prise).setTime(timeInterval: TimeInterval(Int64(counter)))
            //}
        //}catch{
            //DialogBoxHelper.alert(view: self, errorMessage: "Erreur lors de la création des prises")
        //Ò}
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
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
        return heuresPriseCell.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! HeurePriseTableViewCell
        
        cell.heurePriseLabel.text = "Heure de prise"
        heuresPriseCell[indexPath.row] = cell
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! HomePriseViewController
        destinationVC.medicamentsPrescrit.append(medoc!)
    }
}


