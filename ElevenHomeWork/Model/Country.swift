//
//  Country.swift
//  ElevenHomeWork
//
//  Created by Александр Меренков on 26.10.2022.
//

struct Country {
    let countryName: String
    let imageName: String
    let isEuropeanCountry: Bool
    
    init(countryName: String, imageName: String, isEuropeanCountry: Bool = false) {
        self.countryName = countryName
        self.imageName = imageName
        self.isEuropeanCountry = isEuropeanCountry
    }
}
