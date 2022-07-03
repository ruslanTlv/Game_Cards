//
//  ViewController.swift
//  Google
//
//  Created by Ruslan on 16/05/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your name"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.textColor = .orange
        return label
    }()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.systemGreen
        return textField
    }()

    var newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Game", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.systemBackground, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        button.layer.cornerRadius = 20
        button.layer.backgroundColor = UIColor.systemOrange.cgColor
        return button
    }()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(infoLabel)
        view.addSubview(nameTextField)
        view.addSubview(newGameButton)
        navigationController?.navigationBar.tintColor = UIColor.systemGreen
        nameTextField.delegate = self
        allEdits()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }

    func allEdits() {
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(0)
        }
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(130)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp_bottomMargin).inset(-70)
            make.height.equalTo(40)
            make.width.equalTo(400)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(infoLabel.snp_bottomMargin).inset(-20)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        newGameButton.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp_bottomMargin).inset(-150)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
        newGameButton.addTarget(self, action: #selector(onNewGameButtonTap), for: .touchUpInside)
    }
    
    @objc func onNewGameButtonTap() {
        let GameVC = GameViewController()
        GameVC.titleForPlayerName = nameTextField.text
        GameVC.titleText = """
Good Luck "\(nameTextField.text!)"
"""
        
        if nameTextField.text == "" {
            let alert = UIAlertController(title: "Name not entered!", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: {sth in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            
            present(alert, animated: true)
        } else if nameTextField.text!.count <= 4 {
            let alert = UIAlertController(title: "Alert", message: "Name should have more than 4 characters!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: {sth in
                self.navigationController?.popToRootViewController(animated: true)
            }))
            
            present(alert, animated: true)
        } else {
            infoLabel.text = "Hello \(nameTextField.text ?? "")"
            infoLabel.textColor = .green
            navigationController?.pushViewController(GameVC, animated: true)
        }
    }
    
}

