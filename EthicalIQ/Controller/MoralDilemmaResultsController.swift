//
//  MoralDilemmaResultsController.swift
//  EthicalIQ
//
//  Created by Simone Karani on 5/23/20.
//  Copyright © 2020 EthicalIQ. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MoralDilemmaResultsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        performSegue(withIdentifier: "goDilemma2Home", sender: self)
    }
}
