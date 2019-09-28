//
//  PreguntasDiariasViewController.swift
//  A-marte
//
//  Created by Miguel Valcarcel on 9/28/19.
//  Copyright © 2019 Miguel Valcarcel. All rights reserved.
//

import UIKit
import MaterialComponents

class PreguntasDiariasViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.addSubview(totalImage)
        contentView.addSubview(okButton)
        // Do any additional setup after loading the view.
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setupViews()
    }
    
    func setupViews() {
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.safeAreaInsets.bottom)).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        contentView.frame.size.height = view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        contentView.frame.size.width = view.frame.width
        
        totalImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        totalImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(contentView.frame.height * 0.1)).isActive = true
        totalImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        totalImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        okButton.topAnchor.constraint(equalTo: totalImage.bottomAnchor).isActive = true
        okButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05).isActive = true
        okButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
    }
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let totalImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "preguntasDiarias")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let okButton: MDCRaisedButton = {
        let btn = MDCRaisedButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(red: 220/255, green: 87/255, blue: 39/255, alpha: 1)
        btn.setTitle("Enviar", for: .normal)
        btn.addTarget(self, action: #selector(okTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc func okTapped() {
        present(TabBarViewController(), animated: false, completion: nil)
    }
}
