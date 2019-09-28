//
//  HomeViewController.swift
//  A-marte
//
//  Created by Miguel Valcarcel on 9/28/19.
//  Copyright © 2019 Miguel Valcarcel. All rights reserved.
//

import UIKit

struct Volunteer {
    var name: String
    var cargo: String
    var pais: String
    var photo: String
}

class HomeViewController: UIViewController {
    
    var dataSource: [Volunteer] =  [Volunteer(name: "Miguel Perez", cargo: "Psicólogo", pais: "Colombia", photo: "Miguel"),
                                    Volunteer(name: "María Castro", cargo: "Neuropsicóloga", pais: "Perú", photo: "Maria"),
                                    Volunteer(name: "Pablo Sánchez", cargo: "Consejero", pais: "Venezuela", photo: "Pablo"),
                                    Volunteer(name: "Antonia Gutiérrez", cargo: "Coach", pais: "Argentina", photo: "Antonia")]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.addSubview(contactsCollectionView)
        contentView.addSubview(barImageView)
        contentView.addSubview(profileImage)
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

        contactsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height * 0.2).isActive = true
        contactsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contactsCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        contactsCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        barImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        barImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: contentView.frame.width * 0.2).isActive = true
        barImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        barImageView.bottomAnchor.constraint(equalTo: contactsCollectionView.topAnchor).isActive = true
        
        profileImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        profileImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        profileImage.rightAnchor.constraint(equalTo: barImageView.leftAnchor).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: contactsCollectionView.topAnchor).isActive = true
        
    }
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var contactsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.register(volunteerCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let barImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "barImage")
        iv.contentMode = UIView.ContentMode.scaleAspectFit
        return iv
    }()
    
    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "profileImage")
        return iv
    }()
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! volunteerCollectionViewCell
        let vol = dataSource[indexPath.item]
        cell.profileImage.image = UIImage(named: vol.photo)
        cell.nameLabel.text = vol.name
        cell.cargoLabel.text = vol.cargo
        cell.paisLabel.text = vol.pais
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width * 0.5 - 15, height: contentView.frame.width * 0.7)
    }
    
}

class volunteerCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 220/255, green: 87/255, blue: 39/255, alpha: 1)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(cargoLabel)
        addSubview(paisLabel)
        
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.05).isActive = true
        profileImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.width * 0.1).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: self.frame.height * 0.02).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.85).isActive = true
        
        cargoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        cargoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cargoLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.85).isActive = true
        
        paisLabel.topAnchor.constraint(equalTo: cargoLabel.bottomAnchor).isActive = true
        paisLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        paisLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.85).isActive = true
    }
    
    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        return lbl
    }()
    
    let cargoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        return lbl
    }()
    
    let paisLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = .center
        return lbl
    }()
}
