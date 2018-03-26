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
    var posActivite: Int? = nil
    
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
    
    
    
    // MARK: - Envoyer l'activite à la vue suivante
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableShowActivite.indexPathForSelectedRow{
            let activiteARViewController = segue.destination as! ShowActiviteARViewController
           activiteARViewController.activite = self.listeActivite[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listeActivite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableShowActivite.dequeueReusableCell(withIdentifier: "activiteCell", for: indexPath) as! ActivitePrescriteTableViewCell
        
        cell.libelleActivitePrescrite.text! = "Nom activité : " + self.listeActivite[indexPath.row].libelleActivite!
        
        cell.dureePrescriteLabel.text! = String(self.listeActivite[indexPath.row].dureeActivite) + " min"
        
        return cell
    }
    
    @IBAction func unwindFromAddActivite(segue: UIStoryboardSegue){
        tableShowActivite.reloadData()
    }
    
    

}
