//
//  AddEventTableViewController.swift
//  monPkEtMoi
//
//  Created by Kévin Hassan on 14/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class AddEventTableViewController: UITableViewController {

    
    @IBOutlet weak var dateEvent: DatePicker!
    @IBOutlet weak var typeEvent: UITextField!
    @IBOutlet weak var descriptionEvent: UITextField!
    
    @IBAction func addEvent(_ sender: Any) {
        descriptionEvent.text = descriptionEvent.text ?? " "
        let inputs:[String: UITextField] = ["dateEvent": dateEvent,"typeEvent": typeEvent, "descriptionEvent": descriptionEvent]
        if(FormValidatorHelper.validateForm(inputs)){
            saveAddEvent(inputs: inputs)
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Données du formulaire incomplétes")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveAddEvent(inputs: [String: UITextField]){
        
    }
}
