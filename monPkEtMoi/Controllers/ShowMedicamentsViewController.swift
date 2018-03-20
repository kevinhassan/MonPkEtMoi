//
//  ShowMedicamentsViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 18/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowMedicamentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let medicamentDAO = CoreDataDAOFactory.getInstance().getMedicamentDAO()
    var medicaments: [Medicament] = []
    var medicamentSelected: Medicament? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            medicaments = (try medicamentDAO.getAll())!
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addMedicament(){
        
    }
    
    @IBAction func unwideFromMedicamentDetail(segue:UIStoryboardSegue){
        super.viewDidLoad()
        do{
            medicaments = (try medicamentDAO.getAll())!
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medicaments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicamentCell", for: indexPath)

        cell.textLabel?.text = medicaments[indexPath.row].nomMedicament
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.medicamentSelected = medicaments[indexPath.row]
        performSegue(withIdentifier: "showMedicament", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowMedicamentTableViewController
        destinationVC.medicament = self.medicamentSelected
    }
}
