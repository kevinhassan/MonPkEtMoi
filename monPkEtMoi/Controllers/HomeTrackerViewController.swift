//
//  HomeTrackerViewController.swift
//  monPkEtMoi
//
//  Created by Kevin HASSAN on 27/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class HomeTrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var trackers:[Tracker] = []
    @IBOutlet weak var tableTrackers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            trackers = try Tracker.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToShowTracker(segue : UIStoryboardSegue){
        self.tableTrackers.reloadData()
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trackers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackerCell", for: indexPath) as! TrackerTableViewCell
        cell.dateTracker.setDate(date: trackers[indexPath.row].date!)
        cell.etatLibelle.text = trackers[indexPath.row].avoirEtat?.libelleEtat
        cell.timeTracker.setDate(heure: trackers[indexPath.row].date!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
