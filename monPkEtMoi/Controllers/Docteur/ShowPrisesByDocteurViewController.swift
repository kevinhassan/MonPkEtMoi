//
//  ShowPrisesByDocteurViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 26/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowPrisesByDocteurViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var medicamentsPrescris:[Medicament] = []
    @IBOutlet weak var tableMedicament: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            medicamentsPrescris = try Posologie.getAllMedicamentPrescritSixMonth()
            print(medicamentsPrescris.count)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicamentsPrescris.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableMedicament.dequeueReusableCell(withIdentifier: "priseRetardPosologie", for: indexPath) as! PosologieTableViewCell
        
        cell.nomMedicament.text = self.medicamentsPrescris[indexPath.row].nomMedicament
        cell.nbrPriseJours.text = String(describing: Prise.countPriseRetard(medicament: self.medicamentsPrescris[indexPath.row]))
        return cell
    }
}
