//
//  EditSettingsQuestionnaireViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 26/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class EditSettingsQuestionnaireViewController: UITableViewController {
    
    @IBOutlet weak var heureDebutTracker: TimePicker!
    @IBOutlet weak var heureFinTracker: TimePicker!
    @IBOutlet weak var intervalleTracker: UITextField!
    
    var tracker: Tracker? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            tracker = try Patient.getTracker()
            heureDebutTracker.setDate(heure: (tracker?.heureDebut)!)
            heureFinTracker.setDate(heure: (tracker?.heureFin)!)
            intervalleTracker.text = String(describing: tracker!.intervalle)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func editTracker(_ sender: Any) {
        let inputs: [String: UITextField] = ["heureDebut": heureDebutTracker, "heureFin": heureFinTracker, "intervalle": intervalleTracker]
        
        if FormValidatorHelper.validateForm(inputs){
            do{
                try tracker?.edit(withHeureDebut: heureDebutTracker.getDate()!, withHeureFin: heureFinTracker.getDate()!, withIntervalle: Int16(intervalleTracker.text!)!)
                DialogBoxHelper.alert(view: self, WithTitle: "Mise à jours", andMessage: "Modification des informations sur le questionnaire", closure: {(action) in
                        self.performSegue(withIdentifier: "editQuestionnaireSettings", sender: self)
                })
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Edition du questionnaire impossible")
            }
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire invalides")
        }
    }
}
