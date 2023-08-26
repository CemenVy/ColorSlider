//
//  MainViewController.swift
//  ColorSlider
//
//  Created by Семен Выдрин on 15.08.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setColor(_ color: UIColor)
        
}

final class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor
    }

}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
