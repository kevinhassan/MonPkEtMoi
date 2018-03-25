//
//  ShowContactsPersoViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowContactsPersoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var contactsPerso:[ContactPerso]? = nil
    @IBOutlet weak var tableContactPerso: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            contactsPerso = try ContactPerso.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactsPerso!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactPersoCell", for: indexPath) as! ContactPersoTableViewCell
        
        cell.prenomNomContact.text = "\(String(describing: contactsPerso![indexPath.row].nomContact!)) \(String(describing: contactsPerso![indexPath.row].prenomContact!))"
        cell.numContact.text = contactsPerso![indexPath.row].telContact!
        return cell
    }
    @IBAction func unwindToListContactPerso(segue: UIStoryboardSegue){
        tableContactPerso.reloadData()
    }
}
