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
    
    @IBOutlet weak var libelleActivite: UITextField!
    
    @IBOutlet var jours: [UISwitch]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        
    }
    
    @IBAction func addActiviteePrescrite(_ sender: Any) {
        
        
        let inputs:[String: UITextField] = ["dureeActivitee": dureePrescrite, "libelleActivitee": libelleActivite]
        
        var count = 0;
        for item in jours {
            if item.isOn {
                count = count+1
            }
        }
        
        if FormValidatorHelper.validateForm(inputs){
            saveNewActivitePrescrite(withDuree: Int64(dureePrescrite.text!)!, withLibelle: libelleActivite.text!, withCountHebdo: Int64(count))
            DialogBoxHelper.alert(view: self, WithTitle: "Ajouté", andMessage: "L'activité à été ajoutée avec succès", closure: {(action)->() in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "showActivite") as! ShowActivitePrescriteViewController
                self.present(vc, animated: true, completion: nil)})
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    
    // MARK: - Enregistrer les informations de l'activite
    func saveNewActivitePrescrite(withDuree dureePrescrite: Int64, withLibelle libelleActivite: String, withCountHebdo count: Int64) {
        let activitePrescriteDAO = daoF.getActivitePrescriteDAO()
        let newActivitePrescrite: ActivitePrescrite = ActivitePrescrite.create(withDuree: Int16, withLibelle: String, with )
        newActivitePrescrite.dureeActivite = dureePrescrite
        newActivitePrescrite.libelleActivite = libelleActivite
        newActivitePrescrite.repetHebdomadaire = count
        
        do{
            try activitePrescriteDAO.save(activitePrescrite: newActivitePrescrite)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

