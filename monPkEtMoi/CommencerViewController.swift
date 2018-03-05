//
//  CommencerViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 05/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class CommencerViewController: UIViewController{
    @IBOutlet weak var boutonCommencer: UIButton!
    let segueShowFormulaireid = "showFormulaireid"
    
    
    
    var patient : [Patient] = []
    var erreur : String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let request : NSFetchRequest<Patient> = Patient.fetchRequest()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            self.erreur = "Impossible de charger les données"
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
        do{
            try self.patient = context.fetch(request)
        }
        catch let error as NSError{
            self.erreur = ("\(error)")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueShowFormulaireid{
            if self.isExist(patient: self.patient){
                
            }
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func isExist(patient : [Patient]) -> Bool {
        var isExist  : Bool = false
        if(patient.count>0){
            isExist = true
        }
        return isExist
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
