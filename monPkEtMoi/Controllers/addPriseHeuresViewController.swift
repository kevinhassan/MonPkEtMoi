//
//  addPriseHeuresViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class addPriseHeuresViewController: UITableViewController {

    var heuresPriseCell: [HeurePriseTableViewCell] = [HeurePriseTableViewCell()]
    @IBOutlet weak var removeButton: UIButton!
    
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
    @IBAction func addHeure(_ sender: Any) {
        heuresPriseCell.append(HeurePriseTableViewCell())
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: heuresPriseCell.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
        removeButton.isHidden = false
        removeButton.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        // Cacher le bouton de suppression
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
        return cell
    }
}


