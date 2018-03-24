//
//  AddActivitePrescriteViewController.swift
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
    
    var listeNSDATE : [NSDate] = []
    
    
    @IBOutlet weak var typeActivite: UITextField!
    
    @IBOutlet var jours: [UISwitch]!
    
    var newActivite: ActivitePrescrite? = nil
    var newActiviteAR: [ActiviteRealisee]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /// Ajouter les activités à réaliser après l'ajout de l'activité prescrite en faisant un tableau de jours concernés
    @IBAction func addActiviteePrescrite(_ sender: Any) {
        
       
        let inputs:[String: UITextField] = ["dureeActivitee": dureePrescrite, "typeActivite": typeActivite, "dateDebut": dateDebut, "dateFin": dateFin]
        
        var joursActivite:[Int] = jours.map{(jour: UISwitch) in
            if jour.isOn {
                return 1
            }
            return 0
        }
                
        if FormValidatorHelper.validateForm(inputs ) && (self.dateDebut.getDate()! as Date) < (self.dateFin.getDate()! as Date){
            saveNewActivitePrescrite(withDuree: Int16(dureePrescrite.text!)!, withDateD: dateDebut.getDate()!, withDateF: dateFin.getDate()!,withType: typeActivite.text!)
            
            
            DialogBoxHelper.alert(view: self, WithTitle: "Ajouté", andMessage: "L'activité a été ajoutée avec succès", closure: {(action)->() in
                self.performSegue(withIdentifier: "showActivitePrescrite", sender: self)
            })
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    
    // MARK: - Enregistrer les informations de l'activite
    func saveNewActivitePrescrite(withDuree: Int16, withDateD: NSDate,withDateF: NSDate, withType: String) {
        do{
            newActivite = try ActivitePrescrite.create(withDuree: withDuree, withDateD: withDateD, withDateF: withDateF, withType: withType)
            
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowActivitePrescriteViewController
        destinationVC.listeActivite.append(newActivite!)
    }
    
}

