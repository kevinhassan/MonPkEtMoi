//
//  ShowContactsProViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 25/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowContactsProViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var contactsPro:[ContactPro] = []
    @IBOutlet weak var tableContactsPro: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            contactsPro = try ContactPro.getAll()
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
        return contactsPro.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactProCell", for: indexPath) as! ContactProTableViewCell

        cell.prenomNomContact.text = "\(String(describing: contactsPro[indexPath.row].nomContact!)) \(String(describing: contactsPro[indexPath.row].prenomContact!))"
        cell.typeSoignantContact.text = contactsPro[indexPath.row].etreDuType?.libelleTypeSoignant!
        return cell
    }
    @IBAction func unwindToListContactPro(segue: UIStoryboardSegue){
        tableContactsPro.reloadData()
    }
}
