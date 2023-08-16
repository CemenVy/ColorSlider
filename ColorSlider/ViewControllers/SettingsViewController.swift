//
//  ViewController.swift
//  ColorSlider
//
//  Created by Семен Выдрин on 28.07.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var resultWindowView: UIView!
    
    @IBOutlet private var redValueLabel: UILabel!
    @IBOutlet private var greenValueLabel: UILabel!
    @IBOutlet private var blueValueLabel: UILabel!
    
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    @IBOutlet private var textFields: [UITextField]!
    
    // MARK: Public Properties
    weak var delegate: SettingsViewControllerDelegate?
    
    var colorMainView:UIColor!
    
    // MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultWindowView.layer.cornerRadius = 15
        
        updateSliderValue()
        setupTextFields()
    }
    
    // MARK: - IB Actions
    @IBAction func colorSliderValueChanged(_ sender: UISlider) {
        updateColorView()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
            textFields[0].text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
            textFields[1].text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
            textFields[2].text = string(from: blueSlider)
        }
    }
    
    @IBAction func saveValueButtonTapped() {
        view.endEditing(true)
        guard let selectedColor = resultWindowView.backgroundColor else { return }
        delegate?.setSettingsView(for: selectedColor)
        dismiss(animated: true)
    }
    
    // MARK: - Private Properties
    private func updateColorView() {
        resultWindowView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1.0
        )
    }
    
    private func updateValueLabel(){
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    private func updateTextFieldsFromSliders() {
        textFields[0].text = string(from: redSlider)
        textFields[1].text = string(from: greenSlider)
        textFields[2].text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func updateSliderValue() {
        if let colors = colorMainView {
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            var alpha: CGFloat = 0.0
            
            if colors.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
                redSlider.value = Float(red)
                greenSlider.value = Float(green)
                blueSlider.value = Float(blue)
            }
        }
        updateValueLabel()
        updateColorView()
        updateTextFieldsFromSliders()
    }
    
}
// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let floatValue = Float(textField.text ?? ""), (0.0...1.0).contains(floatValue) else {
            let alert = UIAlertController(
                title: "Ошибка",
                message: "Введите значение в диапазоне от 0.0 до 1.0",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        if let index = textFields.firstIndex(of: textField) {
            switch index {
            case 0:
                redSlider.value = floatValue
            case 1:
                greenSlider.value = floatValue
            default:
                blueSlider.value = floatValue
            }
            updateColorView()
            updateValueLabel()
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for textField in textFields {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func setupTextFields() {
        for textField in textFields {
            textField.delegate = self
        }
    }
}
// MARK: - Float
extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}

