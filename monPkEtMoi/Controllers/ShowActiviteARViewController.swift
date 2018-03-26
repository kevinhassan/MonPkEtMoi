//
//  ShowActiviteARViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 24/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowActiviteARViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableActiviteAR: UITableView!
    
    var activite : ActivitePrescrite? = nil
    var posActivite: Int? = nil
    var activiteAR : [ActiviteRealisee]? = nil
    
    @IBOutlet weak var activiteLibelle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            activiteAR = try ActiviteRealisee.getAllComing(activitePrescrite: activite!)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
        print(self.activiteAR!.count)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.activiteAR!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        activiteLibelle.text! = (activite?.libelleActivite)!
        let cell = self.tableActiviteAR.dequeueReusableCell(withIdentifier: "activiteARCell", for: indexPath) as! ActiviteARTableViewCell
        
        cell.dateActiviteAR.text! = "Date de l'activité : " + (activiteAR![indexPath.row].dateActivite?.description)!
        
        cell.heureAR.text! = (activite?.dureeActivite.description)! + " minutes"
        
        return cell
    }


   
}
