//
//  MoralMachineController.swift
//  EthicalIQ
//
//  Created by Simone Karani on 5/1/20.
//  Copyright © 2020 EthicalIQ. All rights reserved.
//  Imag ratio: 1.36
//

import UIKit

class MoralMachineController: UIViewController {
    
    let MM_MAX_TEST_COUNT: Int = 13
    
    @IBOutlet weak var optionABtn: UIButton!
    @IBOutlet weak var optionBBtn: UIButton!
    
    @IBOutlet weak var optionAInstr: UITextView!
    @IBOutlet weak var optionBInstr: UITextView!
    
    var mmViewDataCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mmViewDataCount = 0
        optionAInstr.isUserInteractionEnabled = false
        optionBInstr.isUserInteractionEnabled = false
        
        setupMoralMachineTest()
    }

    @IBAction func optionAClicked(_ sender: Any) {
        setupMoralMachineTest()
    }
    
    @IBAction func optionBClicked(_ sender: Any) {
        setupMoralMachineTest()
    }
    
    func setupMoralMachineTest() {
        if (mmViewDataCount >= MM_MAX_TEST_COUNT) {
            mmViewDataCount = 0
            moveToMMResults()
        }
        else {
            let mmViewData = Int.random(in: 0..<MoralMachineViewData.count)
            let optA: MoralMachineData = MoralMachineViewData[mmViewData][0]
            let optB: MoralMachineData  = MoralMachineViewData[mmViewData][1]
            mmViewDataCount += 1
            
            generateTestData(optAData: optA, optBData: optB)
        }
    }
    
    func generateTestData(optAData: MoralMachineData, optBData: MoralMachineData) {
        optionABtn.setImage(UIImage(named: optAData.imgName), for: [])
        //optionABtn.layer.cornerRadius = 8.0
        optionABtn.layer.borderWidth = 1.0
        optionABtn.layer.borderColor = UIColor.blue.cgColor
        
        optionBBtn.setImage(UIImage(named: optBData.imgName), for: [])
        //optionBBtn.layer.cornerRadius = 8.0
        optionBBtn.layer.borderWidth = 1.0
        optionBBtn.layer.borderColor = UIColor.blue.cgColor

        optionAInstr.text = optAData.instruction
        optionBInstr.text = optBData.instruction
    }
    
    func moveToMMResults() {
        performSegue(withIdentifier: "moralMachineResults", sender: self)
    }
}

