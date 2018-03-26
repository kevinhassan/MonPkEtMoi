//
//  ShowRDVViewController.swift
//  monPkEtMoi
//
//  Created by Yves-Alain AGBODJOGBE on 21/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowRDVViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var rdvs: [RDV]? = nil
    var posRDV: Int? = nil
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            rdvs = try RDV.getAllComing()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToShowRDV(segue : UIStoryboardSegue){
        self.tableView.reloadData()
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rdvs!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rdvCell", for: indexPath) as! RDVTableViewCell
        cell.typeRDV.text = rdvs![indexPath.row].donner?.libelleTypeSoignant
        cell.dateRDV.setDate(date: rdvs![indexPath.row].dateRDV!)
        cell.heureRDV.setDate(heure: rdvs![indexPath.row].heureRDV!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        posRDV = indexPath.row
    }
}
