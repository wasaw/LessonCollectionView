//
//  AttractionViewCell.swift
//  ElevenHomeWork
//
//  Created by Александр Меренков on 26.10.2022.
//

import UIKit

class AttractionViewCell: UICollectionViewCell {
    
//    MARK: - Properties
    static let reuseIdentifire = "AttractionCell"
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private let counryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    func setUpCell(_ country: Country) {
        layer.borderWidth = 0
        backgroundColor = .none
        imageView.image = UIImage(named: country.imageName)
        counryNameLabel.text = country.countryName
    }
    
    func isEuropeanCountry(_ country: Country) {
        if country.isEuropeanCountry {
            backgroundColor = .systemGreen
            layer.borderWidth = 0.5
        } else {
            backgroundColor = .red
            layer.borderWidth = 0.5
        }
    }
    
    private func configureUI() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        addSubview(counryNameLabel)
        counryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        counryNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        counryNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        
        layer.cornerRadius = 10
   }
}
