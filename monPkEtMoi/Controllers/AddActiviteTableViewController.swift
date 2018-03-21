//
//  AddActiviteTableViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddActivitePrescriteViewController: UITableViewController {
    
    
    @IBOutlet weak var dureePrescrite: CountDownPicker!
    @IBOutlet weak var dateDebut: DatePicker!
    @IBOutlet weak var dateFin: DatePicker!
    
    @IBOutlet weak var typeActivite: UITextField!
    
    @IBOutlet var jours: [UISwitch]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        
    }
    
    /// Ajouter les activités à réaliser après l'ajout de l'activité prescrite en faisant un tableau de jours concernés
    @IBAction func addActiviteePrescrite(_ sender: Any) {
        
        
        let inputs:[String: UITextField] = ["dureeActivitee": dureePrescrite, "typeActivite": typeActivite, "dateDebut": dateDebut, "dateFin": dateFin]
        
        var count = 0;
        for item in jours {
            if item.isOn {
                count = count+1
            }
        }
        
        if FormValidatorHelper.validateForm(inputs){
            DialogBoxHelper.alert(view: self, WithTitle: "Ajouté", andMessage: "L'activité à été ajoutée avec succès", closure: {(action)->() in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "showActivite") as! ShowActivitePrescriteViewController
                self.present(vc, animated: true, completion: nil)})
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    
    // MARK: - Enregistrer les informations de l'activite
    func saveNewActivitePrescrite(withDuree dureePrescrite: Int64) {    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

