//
//  HomeViewController.swift
//  A-marte
//
//  Created by Miguel Valcarcel on 9/28/19.
//  Copyright © 2019 Miguel Valcarcel. All rights reserved.
//

import UIKit

struct volunteer {
    var name: String
    var cargo: String
    var pais: String
    var photo: String
}

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(contentView)
        contentView.addSubview(contactsCollectionView)
        contentView.addSubview(barImageView)
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setupViews()
    }
    
    func setupViews() {
        print(view.safeAreaInsets)
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.safeAreaInsets.top).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.safeAreaInsets.bottom)).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        contentView.frame.size.height = view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        contentView.frame.size.width = view.frame.width

        contactsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height * 0.2).isActive = true
        contactsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contactsCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        contactsCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        
        barImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        barImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: contentView.frame.width * 0.2).isActive = true
        barImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        barImageView.bottomAnchor.constraint(equalTo: contactsCollectionView.topAnchor).isActive = true
        
    }
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let contactsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
    }()
    
    let barImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "barImage")
        iv.contentMode = UIView.ContentMode.scaleAspectFit
        return iv
    }()
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    
}
