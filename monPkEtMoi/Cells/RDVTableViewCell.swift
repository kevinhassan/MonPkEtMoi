//
//  RDVTableViewCell.swift
//  monPkEtMoi
//
//  Created by macOS on 22/03/2018.
//  Copyright © 2018 CHU-polytech. All rights reserved.
//

import Foundation
import UIKit

class RDVTableViewCell: UITableViewCell{
    @IBOutlet weak var typeRDV: UILabel!
    @IBOutlet weak var dateRDV: DateLabel!
    @IBOutlet weak var heureRDV: TimeLabel!
}
