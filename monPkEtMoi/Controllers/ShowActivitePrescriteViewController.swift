//
//  ShowActivitePrescriteViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit
import CoreData

class ShowActivitePrescriteViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableShowActivite: UITableView!
    var listeActivite : [ActivitePrescrite] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            listeActivite = try ActivitePrescrite.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToActivitePrescrite(segue: UIStoryboardSegue){
        self.tableShowActivite.reloadData()
    }
    
    // MARK: - Envoyer la posologie à la vue suivante
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableShowActivite.indexPathForSelectedRow{
            let activiteViewController = segue.destination as! ShowActiviteDetailViewController
           activiteViewController.activite = self.listeActivite[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listeActivite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableShowActivite.dequeueReusableCell(withIdentifier: "activiteCell", for: indexPath) as! ActivitePrescriteTableViewCell
        
        cell.libelleActivitePrescrite.text! = self.listeActivite[indexPath.row].libelleActivite!
        
        cell.dureePrescriteLabel.text! = String(self.listeActivite[indexPath.row].dureeActivite) + " min"
        
        cell.dateDebutLabel.setDate(date: self.listeActivite[indexPath.row].dateDebut!)
        
        cell.dateFinLabel.setDate(date: self.listeActivite[indexPath.row].dateFin!)
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
