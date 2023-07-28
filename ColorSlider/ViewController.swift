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
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    private var redValueColor = Double.random(in: 0.00...1.00)
    private var greenValueColor = Double.random(in: 0.00...1.00)
    private var blueValueColor = Double.random(in: 0.00...1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupResultWindow()
        setupValuesSliders()
    }

    @IBAction func redSliderPull() {
        redValueColor = CGFloat(redSlider.value)
        
        redValueLabel.text = String(format: "%.2f", redValueColor)
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
    }
    
    @IBAction func greenSliderPull() {
        greenValueColor = CGFloat(greenSlider.value)
        
        greenValueLabel.text = String(format: "%.2f", greenValueColor)
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
    }
    
    @IBAction func blueSliderPull() {
        blueValueColor = CGFloat(blueSlider.value)
        
        blueValueLAbel.text = String(format: "%.2f", blueValueColor)
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
    }
    
    private func setupResultWindow() {
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
        
        resultWindowView.layer.cornerRadius = 15
    }
    
    private func setupValuesSliders() {
        redValueLabel.text = String(format: "%.2f", redValueColor)
        greenValueLabel.text = String(format: "%.2f", greenValueColor)
        blueValueLAbel.text = String(format: "%.2f", blueValueColor)
        
        redSlider.value = Float(redValueColor)
        greenSlider.value = Float(greenValueColor)
        blueSlider.value = Float(blueValueColor)
        
    }
    
}

