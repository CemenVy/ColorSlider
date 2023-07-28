//
//  ViewController.swift
//  ColorSlider
//
//  Created by Семен Выдрин on 28.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var resultWindowView: UIView!
    @IBOutlet private var redValueLabel: UILabel!
    @IBOutlet private var greenValueLabel: UILabel!
    @IBOutlet private var blueValueLabel: UILabel!
    
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
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
    @IBAction func colorSliderValueChanged(_ sender: UISlider) {
            switch sender {
            case redSlider:
                redValueColor = CGFloat(sender.value)
            case greenSlider:
                greenValueColor = CGFloat(sender.value)
            case blueSlider:
                blueValueColor = CGFloat(sender.value)
            default:
                break
            }
            
            updateColorView()
        }
    
    // MARK: - Private Properties
    private func updateColorView() {
        redValueLabel.text = String(format: "%.2f", redValueColor)
        greenValueLabel.text = String(format: "%.2f", greenValueColor)
        blueValueLabel.text = String(format: "%.2f", blueValueColor)
        
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
        redSlider.value = Float(redValueColor)
        greenSlider.value = Float(greenValueColor)
        blueSlider.value = Float(blueValueColor)
        
        updateColorView()
    }
    
}
