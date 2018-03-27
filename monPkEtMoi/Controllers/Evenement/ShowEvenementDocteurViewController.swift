//
//  ShowEvenementDocteurViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 26/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class ShowEvenementDocteurViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var evenements: [Evenement] = []
    var posEvent: Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            evenements = try Evenement.getAllSixMonth()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (evenements.count)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        posEvent = indexPath.row
        performSegue(withIdentifier: "showAccident", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "evenementCell", for: indexPath) as! EvenementTableViewCell

        cell.dateEvenement.setDate(date: evenements[indexPath.row].dateEvenement!)
        cell.typeEvenement.text = evenements[indexPath.row].avoirType?.libelleTypeEvenement
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowEvenementViewController
        destinationVC.evenement = evenements[posEvent!]
    }
}
