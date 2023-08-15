//
//  StartViewController.swift
//  ColorSlider
//
//  Created by Семен Выдрин on 15.08.2023.
//

import UIKit

final class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.colorStartScreen = view.backgroundColor
    }

}
