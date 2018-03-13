//
//  ParametreViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 13/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class ParametreViewController : UITableViewController{
    
    @IBOutlet weak var modeMedecin: UISwitch!
    
    @IBAction func changerMode(_ sender: Any) {
        var vc: UIViewController?
        if(modeMedecin.isOn){
            vc = self.storyboard?.instantiateViewController(withIdentifier: "homeMedecin") as! HomeMedecinViewController
        }else{
            vc = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController
        }
        self.present(vc!, animated: true, completion: nil)

    }
}
