//
//  ViewController.swift
//  A-marte
//
//  Created by Miguel Valcarcel on 9/28/19.
//  Copyright © 2019 Miguel Valcarcel. All rights reserved.
//

import UIKit
import MaterialComponents

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 99/255, green: 169/255, blue: 143/255, alpha: 1)
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(iconImageView)
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.15).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: view.frame.height * 0.3).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.3).isActive = true
        
        userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.5).isActive = true
        userTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.08).isActive = true
        userTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.6).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.08).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.75).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
        
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.81).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
        
    }
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "amarteLogo")
        return iv
    }()
    
    let userTextField: MDCTextField = {
        let textField = MDCTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .clear
        textField.placeholder = "Usuario"
        textField.underline?.color = .white
        textField.placeholderLabel.textColor = .white
        textField.textColor = .white
        return textField
    }()
    
    let passwordTextField: MDCTextField = {
        let textField = MDCTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.backgroundColor = .clear
        textField.placeholder = "Contraseña"
        textField.underline?.color = .white
        textField.placeholderLabel.textColor = .white
        textField.textColor = .white
        return textField
    }()
    
    let signInButton: MDCRaisedButton = {
        let btn = MDCRaisedButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 220/255, green: 87/255, blue: 39/255, alpha: 1)
        btn.setTitle("Iniciar Sesión", for: .normal)
        btn.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return btn
    }()
    
    let signUpButton: MDCRaisedButton = {
        let btn = MDCRaisedButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 220/255, green: 87/255, blue: 39/255, alpha: 1)
        btn.setTitle("Registrate", for: .normal)
        return btn
    }()
    
    @objc func signInTapped() {
        present(TabBarViewController(), animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
}

