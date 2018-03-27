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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            activiteAR = try ActiviteRealisee.getAllComing(activitePrescrite: activite!)
            print(activiteAR!)
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
        print(self.activiteAR!.count)
    }

    
//    @IBAction func removeActivite(_ sender: Any) {
//        DialogBoxHelper.alertAsk(view: self, WithTitle: "Supprimer activité", andMessage: "Etes vous sûr de vouloir supprimer l'activité", closureContinue: {(action) in
//            do{
//                let _ = try ActivitePrescrite.delete(self.activite!)
//                self.performSegue(withIdentifier: "returnToActivite", sender: nil)
//            }catch{
//                DialogBoxHelper.alert(view: self, errorMessage: "Suppression impossible")
//            }
//        }, closureCancel: nil)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.activiteAR!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = self.tableActiviteAR.dequeueReusableCell(withIdentifier: "activiteARCell", for: indexPath) as! ActiviteARTableViewCell
        let formatter = DateFormatter()
        let dateString = formatter.string(from: self.activiteAR![indexPath.row].dateActivite! as Date)
        print(dateString)
        cell.dateActiviteAR.text! = dateString
        
        cell.libelleActiviteAR.text! = (activite?.libelleActivite)!

        cell.heureAR.text! = (activite?.dureeActivite.description)! + " minutes"
        
        return cell
    }


   
}
