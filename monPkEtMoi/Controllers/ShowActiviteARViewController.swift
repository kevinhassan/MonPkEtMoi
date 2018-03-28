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
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
        print(self.activiteAR!.count)
    }

    
    @IBAction func removeActivite(_ sender: Any) {
        DialogBoxHelper.alertAsk(view: self, WithTitle: "Supprimer une activité", andMessage: "Etes vous sûr de vouloir supprimer cette activite?", closureContinue: {(action) in
            do{
                try self.activite!.delete()
                DialogBoxHelper.alert(view: self, WithTitle: "Suppression de l'activité", andMessage: "Suppression réussie", closure: {(action) in
                    self.performSegue(withIdentifier: "removeActivite", sender: self)
                })
            }catch let error as NSError{
                DialogBoxHelper.alert(view: self, error: error)
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
        
        
        let cell = self.tableActiviteAR.dequeueReusableCell(withIdentifier: "activiteARCell", for: indexPath) as! ActiviteARTableViewCell
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        let dateString = formatter.string(from: self.activiteAR![indexPath.row].dateActivite! as Date)
        
        cell.dateActiviteAR.text! = dateString
        
        cell.libelleActiviteAR.text! = (activite?.libelleActivite)!

        cell.dureeAR.text! = (activite?.dureeActivite.description)! + " minutes"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "validationSegue"{
        
            if let indexPath = self.tableActiviteAR.indexPathForSelectedRow{
                let destinationVC = segue.destination as! ValidateActiviteViewController
                destinationVC.activiteAR = self.activiteAR?[indexPath.row]
            }
        }
    }


   
}
