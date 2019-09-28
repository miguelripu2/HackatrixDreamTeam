//
//  RetosViewController.swift
//  A-marte
//
//  Created by Miguel Valcarcel on 9/28/19.
//  Copyright © 2019 Miguel Valcarcel. All rights reserved.
//

import UIKit

class RetosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.addSubview(topImageView)
        contentView.addSubview(bottomImageView)
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
        
        topImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        topImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        topImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width * 0.4).isActive = true
        
        bottomImageView.topAnchor.constraint(equalTo: topImageView.bottomAnchor).isActive = true
        bottomImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bottomImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bottomImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let topImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "retosTopImage")
        iv.contentMode = UIView.ContentMode.scaleToFill
        return iv
    }()
    
    let bottomImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "retosBottomImage")
        iv.contentMode = UIView.ContentMode.scaleAspectFit
        return iv
    }()
    

}
