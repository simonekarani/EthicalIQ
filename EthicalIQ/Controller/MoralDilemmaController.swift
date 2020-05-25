//
//  MoralDilemmaController.swift
//  EthicalIQ
//
//  Created by Simone Karani on 5/23/20.
//  Copyright © 2020 EthicalIQ. All rights reserved.
//  Image ratios : 1.6
//

import UIKit

class MoralDilemmaController: UIViewController {
    
    let MORAL_DILEMMA_MAX_TEST_COUNT: Int = 35
    
    @IBOutlet weak var dilemmaText: UITextView!
    @IBOutlet weak var dilemmaImage: UIImageView!
    
    @IBOutlet weak var optButton1: UIButton!
    @IBOutlet weak var optButton2: UIButton!
    @IBOutlet weak var optButton3: UIButton!
    @IBOutlet weak var optButton4: UIButton!
    
    var mdViewDataCount: Int = 0
    var buttonList:[UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonList.append(optButton1)
        buttonList.append(optButton2)
        buttonList.append(optButton3)
        buttonList.append(optButton4)
        
        mdViewDataCount = 0
        setupMoralMachineTest()
    }
    
    func setupMoralMachineTest() {
        if (mdViewDataCount >= MORAL_DILEMMA_MAX_TEST_COUNT) {
            mdViewDataCount = 0
            moveToMoralDilemmaResults()
        }
        else {
            //let mdViewData = Int.random(in: 0..<MoralMachineViewData.count)
            let dilemmaData: MoralDilemmaData = MoralDilemmaViewData[mdViewDataCount]
            if UIScreen.main.bounds.size.height >= 700 {
                dilemmaText.font = UIFont.boldSystemFont(ofSize: CGFloat(dilemmaData.qFontSize))
                for selectionBtn in buttonList {
                    //selectionBtn.titleLabel?.font = selectionBtn.titleLabel?.font.withSize(18)
                    selectionBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(dilemmaData.optFontSize))

                }
            } else {
                dilemmaText.font = UIFont.boldSystemFont(ofSize: CGFloat(dilemmaData.qFontSize-2))
                for selectionBtn in buttonList {
                    //selectionBtn.titleLabel?.font = selectionBtn.titleLabel?.font.withSize(16)
                    selectionBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(dilemmaData.optFontSize - 2))
                }
            }

            dilemmaText.text = dilemmaData.question
            dilemmaImage.image = UIImage(named: dilemmaData.imgName)
            optButton1.setTitle(dilemmaData.option1, for: .normal)
            optButton2.setTitle(dilemmaData.option2, for: .normal)
            optButton3.setTitle(dilemmaData.option3, for: .normal)
            optButton4.setTitle(dilemmaData.option4, for: .normal)
            
            mdViewDataCount += 1
        }
    }
    
    @IBAction func optionSelected(_ sender: Any) {
        setupMoralMachineTest()
        for selectionBtn in buttonList {
            selectionBtn.isSelected = false
            selectionBtn.isHighlighted = false
        }
    }
    
    func moveToMoralDilemmaResults() {
        performSegue(withIdentifier: "gotoDilemmaResults", sender: self)
    }
}

