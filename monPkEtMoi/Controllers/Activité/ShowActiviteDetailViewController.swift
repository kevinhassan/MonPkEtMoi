//
//  ShowActiviteDetailViewController.swift
//  monPkEtMoi
//
//  Created by Yves-alain Agbodjogbe on 23/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowActiviteDetailViewController: UITableViewController {

    
    
    var activite : ActivitePrescrite? = nil
    var posActivite: Int? = nil
    
    @IBOutlet weak var libelleActiviteLabel: UILabel!
    @IBOutlet weak var dateFinLabel: DateLabel!
    @IBOutlet weak var dateDebutLabel: DateLabel!
    @IBOutlet weak var dureePrescriteLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libelleActiviteLabel.text = activite?.libelleActivite
        dateDebutLabel.setDate(date: (activite?.dateDebut!)!)
        dateFinLabel.setDate(date: (activite?.dateFin!)!)
        dureePrescriteLabel.text = activite?.dureeActivite.description
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func removeActivite(_ sender: Any) {
        DialogBoxHelper.alertAsk(view: self, WithTitle: "Supprimer activité", andMessage: "Etes vous sûr de vouloir supprimer l'activité", closureContinue: {(action) in
            do{
                let _ = try ActivitePrescrite.delete(self.activite!)
                self.performSegue(withIdentifier: "returnToActivite", sender: nil)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Suppression impossible")
            }
        }, closureCancel: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "returnToActivite" {
            let destinationVC = segue.destination as! ShowActivitePrescriteViewController
            destinationVC.listeActivite.remove(at: Int(posActivite!))
        }
        if segue.identifier == "goToValidation"{
            
            let validateViewController = segue.destination as! ValidateActiviteViewController
            validateViewController.activite = self.activite!
            validateViewController.posActivite = posActivite

        }
    }
}
