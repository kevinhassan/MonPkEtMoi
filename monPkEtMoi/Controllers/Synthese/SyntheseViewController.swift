//
//  SyntheseViewController.swift
//  monPkEtMoi
//
//  Created by macOS on 27/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import UIKit

class SyntheseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewSynthese: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var trackers: [Tracker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            trackers = try Tracker.getSynthese(numJour: 1)
        }catch{
            DialogBoxHelper.alert(view: self, errorMessage: "Impossible de récuperer la synthèse demandée")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "syntheseCell", for: indexPath) as! SyntheseTableViewCell
        cell.etatLabel.text = trackers[indexPath.row].avoirEtat?.libelleEtat
        cell.heureLabel.setDate(heure: trackers[indexPath.row].date!)
        return cell
    }
    
    @IBAction func changeDay(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            do{
                trackers = try Tracker.getSynthese(numJour: 1)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Impossible de récuperer la synthèse demandée")
            }
        case 1:
            do{
                trackers = try Tracker.getSynthese(numJour: 2)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Impossible de récuperer la synthèse demandée")
            }
        case 2:
            do{
                trackers = try Tracker.getSynthese(numJour: 3)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Impossible de récuperer la synthèse demandée")
            }
        case 3:
            do{
                trackers = try Tracker.getSynthese(numJour: 4)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Impossible de récuperer la synthèse demandée")
            }
        case 4:
            do{
                trackers = try Tracker.getSynthese(numJour: 5)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Impossible de récuperer la synthèse demandée")
            }
        default:
            print("default")
            do{
                trackers = try Tracker.getSynthese(numJour: 1)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Impossible de récuperer la synthèse demandée")
            }
        }
        tableViewSynthese.reloadData()
    }
    
}
