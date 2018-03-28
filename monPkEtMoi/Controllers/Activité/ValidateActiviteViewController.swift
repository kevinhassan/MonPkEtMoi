//
//  ValidateActiviteViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 24/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ValidateActiviteViewController: UITableViewController {

    var posActivite : Int? 
    var activiteAR : ActiviteRealisee? = nil
    
    @IBOutlet weak var dateActivite: DatePicker!
    
    @IBOutlet weak var heureExercice: TimePicker!
    
    @IBOutlet weak var dureeRealisee: CountDownPicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    @IBAction func validerActivite(_ sender: Any) {
        let inputs:[String: UITextField] = ["dateActivite": dateActivite, "heureExercice": heureExercice, "dureeRealisee": dureeRealisee]
        
        
        if FormValidatorHelper.validateForm(inputs ){
            validateActiviteRealisee(withDate: dateActivite.getDate()!, withDuree: Int16(dureeRealisee.text!)!, withHeureExercice: heureExercice.getDate()!)
            
            
            DialogBoxHelper.alert(view: self, WithTitle: "Ajouté", andMessage: "L'activité a été réalisée avec succès", closure: {(action)->() in
                self.performSegue(withIdentifier: "validationSegue", sender: self)
            })
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }

        
    }
    
    func validateActiviteRealisee(withDate: NSDate, withDuree: Int16, withHeureExercice: NSDate){
        do{
            let _ = try activiteAR?.validate(withDate: withDate, withHeure: withHeureExercice, withDuree: withDuree)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }

    }
    
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
