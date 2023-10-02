//
//  ViewController.swift
//  Randomizer
//
//  Created by Irina Muravyeva on 02.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.minimumValue = minimumValueLabel.text
        settingsVC.maximumValue = maximumValueLabel.text
        
    }
    
    @IBAction func GetNumberButtonPressed() {
        let minimumValue = Int(minimumValueLabel.text ?? "") ?? 0
        let maximumValue = Int(maximumValueLabel.text ?? "") ?? 100
        // minimumValue - не опциональное, а minimumValueLabel.text - опциональное
        // поэтому сначала мы передаем пустую строку, если текст содержит nill
        // потом это значение пытаемся преобразовать к Int
        
        randomNumberLabel.text = Int.random(in: minimumValue...maximumValue).formatted()
    }
    
    @IBAction func saveButtonDidTapped(for segue: UIStoryboardSegue, sender: Any?){
        guard let settingsVC = segue.source as? SettingsViewController else { return }
        minimumValueLabel.text = settingsVC.minimumValueTF.text
        maximumValueLabel.text = settingsVC.maximumValueTF.text
    }
}

