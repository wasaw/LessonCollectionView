//
//  ViewController.swift
//  ElevenHomeWork
//
//  Created by Александр Меренков on 26.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK: - Properties
    
    private let annotationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let repeatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Попробовать снова", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(handleRepeatButton), for: .touchUpInside)
        return button
    }()
    
    private var collectionView: UICollectionView?
    private let adapter = CountryAdapter()
    
//    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(annotationLabel)
        annotationLabel.translatesAutoresizingMaskIntoConstraints = false
        annotationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        annotationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        annotationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        annotationLabel.text = "Выберите страны, которые находятся в Европе."
        configureCollectionView()
        configureButton()
    }

//    MARK: - Helpers
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        adapter.setup(for: collectionView)
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: annotationLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 450).isActive = true
    }
    
    private func configureButton() {
        view.addSubview(repeatButton)
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repeatButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        repeatButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        repeatButton.widthAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
//    MARK: - Selecters
    
    @objc private func handleRepeatButton() {
        adapter.shuffled()
        collectionView?.reloadData()
    }
}

