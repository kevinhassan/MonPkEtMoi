//
//  HomePriseViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class HomePriseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var medicamentsPrescrit: [Medicament] = []
    var posMedoc: Int = 0
    
    @IBOutlet weak var tableMedicamentPrescrit: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        do{
            medicamentsPrescrit = try Posologie.getAllMedicamentPrescrit()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindFromAddHeuresPrise(segue: UIStoryboardSegue){
        tableMedicamentPrescrit.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medicamentsPrescrit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableMedicamentPrescrit.dequeueReusableCell(withIdentifier: "posologieCell", for: indexPath) as! PosologieTableViewCell
        cell.nomMedicament.text = self.medicamentsPrescrit[indexPath.row].nomMedicament!
        cell.nbrPriseJours.text = "\(Prise.countPriseJourMedicament(medicament: (self.medicamentsPrescrit[indexPath.row]))) prises"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        posMedoc = indexPath.row
        performSegue(withIdentifier: "showHeuresPrise", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHeuresPrise"{
            let destinationVC = segue.destination as! ShowHeuresPriseViewController
            destinationVC.medicament = self.medicamentsPrescrit[posMedoc]
        }
    }
}
