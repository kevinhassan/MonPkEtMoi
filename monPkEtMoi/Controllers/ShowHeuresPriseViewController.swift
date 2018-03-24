//
//  ShowHeuresPriseViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 24/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowHeuresPriseViewController: UITableViewController {

    var medicament: Medicament? = nil
    var prises:[Prise]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let posologie: Posologie = (try Posologie.get(withMedicament: medicament!))!
            
            prises = try Prise.getAllPrisesPosologieToday(posologie: posologie)
        }catch{
            DialogBoxHelper.alert(view: self, errorMessage: "Erreur dans la récupération des prises du médicament")
        }
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
        return (prises?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priseCell", for: indexPath) as! PriseTableViewCell

        cell.heurePrise.setDate(heure: prises![indexPath.row].heurePrise!)

        return cell
    }
}
