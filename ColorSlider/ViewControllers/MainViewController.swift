//
//  MainViewController.swift
//  ColorSlider
//
//  Created by Семен Выдрин on 15.08.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setSettingsView(for backgroundcolor: UIColor)
        
}

final class MainViewController: UIViewController {

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.colorMainView = view.backgroundColor
        settingsVC?.delegate = self
    }

}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setSettingsView(for selectedColor: UIColor) {
        view.backgroundColor = selectedColor
    }
}
