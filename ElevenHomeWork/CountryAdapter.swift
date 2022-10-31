//
//  CountryAdapter.swift
//  ElevenHomeWork
//
//  Created by Александр Меренков on 27.10.2022.
//

import UIKit

class CountryAdapter: NSObject {
    
//    MARK: - Properties
    
    private let england = Country(countryName: "Англия", imageName: "england", isEuropeanCountry: true)
    private let france = Country(countryName: "Франция", imageName: "france", isEuropeanCountry: true)
    private let germany = Country(countryName: "Германия", imageName: "germany", isEuropeanCountry: true)
    private let india = Country(countryName: "Индия", imageName: "india")
    private let italy = Country(countryName: "Италия", imageName: "italy", isEuropeanCountry: true)
    private let kenya = Country(countryName: "Кения", imageName: "kenya")
    private let mexico = Country(countryName: "Мексика", imageName: "mexico")
    private let netherlands = Country(countryName: "Нидерланды", imageName: "netherlands", isEuropeanCountry: true)
    private let unitedStates = Country(countryName: "США", imageName: "united-states-of-america")

    private lazy var worldCountry = [england, france, germany, india, italy, kenya, mexico, netherlands, unitedStates].shuffled()
    
//    MARK: - Helpers
    
    func setup(for collectionView: UICollectionView) {
        collectionView.register(AttractionViewCell.self, forCellWithReuseIdentifier: AttractionViewCell.reuseIdentifire)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func shuffled() {
        worldCountry = worldCountry.shuffled()
    }
}

//  MARK: - Extensions

extension CountryAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return worldCountry.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttractionViewCell.reuseIdentifire, for: indexPath) as? AttractionViewCell else { return UICollectionViewCell() }
        cell.setUpCell(worldCountry[indexPath.item])
        return cell
    }
}

extension CountryAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AttractionViewCell else { return }
        cell.isEuropeanCountry(worldCountry[indexPath.item])
    }
}

extension CountryAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}


