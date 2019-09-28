//
//  PerfilViewController.swift
//  A-marte
//
//  Created by Miguel Valcarcel on 9/28/19.
//  Copyright © 2019 Miguel Valcarcel. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.addSubview(totalImage)
        contentView.addSubview(salirImage)
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
        totalImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        totalImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        totalImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        salirImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        salirImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        salirImage.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.1).isActive = true
        salirImage.heightAnchor.constraint(equalToConstant: contentView.frame.width * 0.1).isActive = true
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
        iv.image = UIImage(named: "")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let salirImage: UIButton = {
        let iv = UIButton()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setImage(UIImage(named: "salir"), for: .normal)
        iv.addTarget(self, action: #selector(salirTapped), for: .touchUpInside)
        return iv
    }()
    
    @objc func salirTapped() {
        present(LoginViewController(), animated: false, completion:  nil)
    }

}
