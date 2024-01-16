//
//  DrinkModel.swift
//  TestAppHammerSystems
//
//  Created by Akai on 12/1/24.
//

import Foundation

struct DrinkElement: Codable {
    let id: Int?
    let name, tagline, firstBrewed, description: String?
    let imageURL: String?
    let abv: Double?
    let ibu: Double?
    let targetFg: Int?
    let targetOg: Double?
    let ebc: Int?
    let srm, ph: Double?
    let attenuationLevel: Double?
    let volume, boilVolume: BoilVolume?
    let method: Method?
    let ingredients: Ingredients?
    let foodPairing: [String]?
    let brewersTips: String?
    let contributedBy: ContributedBy?

    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case description
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

struct BoilVolume: Codable {
    let value: Double?
    let unit: Unit?
}

enum Unit: String, Codable {
    case celsius = "celsius"
    case grams = "grams"
    case kilograms = "kilograms"
    case litres = "litres"
}

enum ContributedBy: String, Codable {
    case aliSkinnerAliSkinner = "Ali Skinner <AliSkinner>"
    case samMasonSamjbmason = "Sam Mason <samjbmason>"
}

struct Ingredients: Codable {
    let malt: [Malt]?
    let hops: [Hop]?
    let yeast: String?
}

struct Hop: Codable {
    let name: String?
    let amount: BoilVolume?
    let add: Add?
    let attribute: Attribute?
}

enum Add: String, Codable {
    case dryHop = "dry hop"
    case end = "end"
    case middle = "middle"
    case start = "start"
}

enum Attribute: String, Codable {
    case aroma = "aroma"
    case attributeFlavour = "Flavour"
    case bitter = "bitter"
    case flavour = "flavour"
}

struct Malt: Codable {
    let name: String?
    let amount: BoilVolume?
}

struct Method: Codable {
    let mashTemp: [MashTemp]?
    let fermentation: Fermentation?
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}

struct Fermentation: Codable {
    let temp: BoilVolume?
}

struct MashTemp: Codable {
    let temp: BoilVolume?
    let duration: Int?
}

typealias Drink = [DrinkElement]


class DrinkModel {
    
    func fetchDrinks(completion: @escaping ([DrinkElement]) -> Void) {
        NetworkManager.shared.fetchDrinks(completion: completion)
    }

    func saveData(_ data: [DrinkElement]) {
        NetworkManager.shared.saveData(data)
    }

    func loadData() -> [DrinkElement]? {
        NetworkManager.shared.loadData()
    }
}


