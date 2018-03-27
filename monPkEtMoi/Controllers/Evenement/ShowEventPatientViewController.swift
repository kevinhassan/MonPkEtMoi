//
//  ShowEventPatientViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 15/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowEventPatientViewController: UIViewController {

    @IBOutlet weak var nbPriseToday: UILabel!
    @IBOutlet weak var nbRDV: UILabel!
    @IBOutlet weak var nbAccident: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            nbPriseToday.text = String(describing: try Prise.countPrises())
            nbRDV.text = String(describing: try RDV.countRVDComing())
            nbAccident.text = String(describing: try Evenement.countSixMonth())
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToHomePatient(segue: UIStoryboardSegue){
        if segue.identifier == "returnToHomePatient"{
            do {
                nbAccident.text = String(describing: try Evenement.countSixMonth())
            }catch let error as NSError{
                DialogBoxHelper.alert(view: self, error: error)
            }
        }
    }   
}
