//
//  MoralMachineResultsController.swift
//  EthicalIQ
//
//  Created by Simone Karani on 5/9/20.
//  Copyright © 2020 EthicalIQ. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MoralMachineResultsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        performSegue(withIdentifier: "goFromMMResultsToMain", sender: self)
    }
}
