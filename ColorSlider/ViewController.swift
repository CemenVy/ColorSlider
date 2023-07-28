//
//  ViewController.swift
//  ColorSlider
//
//  Created by Семен Выдрин on 28.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultWindowView: UIView!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLAbel: UILabel!
    
    private var redValueColor = 0.0
    private var greenValueColor = 0.0
    private var blueValueColor = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
        
        resultWindowView.layer.cornerRadius = 15
    }


    @IBAction func redSlider(_ sender: UISlider) {
        redValueColor = CGFloat(sender.value)
        
        redValueLabel.text = String(format: "%.2f", redValueColor)
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        greenValueColor = CGFloat(sender.value)
        
        greenValueLabel.text = String(format: "%.2f", greenValueColor)
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        blueValueColor = CGFloat(sender.value)
        
        blueValueLAbel.text = String(format: "%.2f", blueValueColor)
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
    }
    
    
}

