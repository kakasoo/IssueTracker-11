//
//  LabelDetailViewController.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/02.
//  Copyright © 2020 양어진. All rights reserved.
//

import UIKit

final class LabelDetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var descriptionTextField: UITextField!
    @IBOutlet private weak var colorTextField: UITextField!
    @IBOutlet private weak var colorSampleView: UIView!
    
    // MARK: - Properties
    
    var label: Label?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - IBAction
    
    @IBAction private func colorRandomButtonDidTap(_ sender: UIButton) {
        let color = randomColor()
        colorSampleView.backgroundColor = color
        colorTextField.text = color.toHexString()
    }
    
    @IBAction private func saveButtonDidTap(_ sender: UIButton) {
    }
    
    @IBAction private func deleteButtonDidTap(_ sender: UIButton) {
    }
    
    // MARK: - Methods
    
    private func configure() {
        self.navigationItem.title = "레이블 편집"
        
        guard let label = label, let color = label.color else { return }
        titleTextField.text = label.name
        descriptionTextField.text = label.description
        colorTextField.text = label.color
        colorSampleView.backgroundColor = UIColor(hex: color)
        
        colorTextField.addTarget(self,
                                 action: #selector(textFieldDidChange(_:)),
                                 for: .editingChanged)
    }
    
    private func randomColor() -> UIColor {
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    // MARK: - Objc
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let color = colorTextField.text else { return }
        colorSampleView.backgroundColor = UIColor(hex: color)
    }
    
}
