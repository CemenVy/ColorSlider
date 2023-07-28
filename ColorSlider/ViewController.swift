//
//  ViewController.swift
//  ColorSlider
//
//  Created by Семен Выдрин on 28.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var resultWindowView: UIView!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Private Properties
    private var redValueColor = 0.50
    private var greenValueColor = 0.20
    private var blueValueColor = 0.78
    
    // MARK: - View life Cycles
    override func viewWillLayoutSubviews() {
        setupValuesSliders()
        setupResultWindow()
    }
    
    // MARK: - IB Actions
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
        
        blueValueLabel.text = String(format: "%.2f", blueValueColor)
        resultWindowView.backgroundColor = UIColor(
            red: redValueColor,
            green: greenValueColor,
            blue: blueValueColor,
            alpha: 1.0
        )
    }
        
        // MARK: - Private Properties
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
            blueValueLabel.text = String(format: "%.2f", blueValueColor)
            
            redSlider.value = Float(redValueColor)
            greenSlider.value = Float(greenValueColor)
            blueSlider.value = Float(blueValueColor)
        }
    
}
