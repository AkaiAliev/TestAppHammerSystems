//
//  NetworkManager.swift
//  TestAppHammerSystems
//
//  Created by Akai on 12/1/24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchDrinks(completion: @escaping ([DrinkElement]) -> Void) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else {
            print("Неверный URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Ошибка при запросе данных: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Данные не получены.")
                return
            }
            
            do {
                let drinks = try JSONDecoder().decode([DrinkElement].self, from: data)
                completion(drinks)
                print(drinks)
            } catch {
                print("Ошибка декодирования: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func saveData(_ data: [DrinkElement]) {
        let defaults = UserDefaults.standard
        if let encodedData = try? JSONEncoder().encode(data) {
            defaults.set(encodedData, forKey: "savedDrinks")
        }
    }
    
    func loadData() -> [DrinkElement]? {
        let defaults = UserDefaults.standard
        if let savedData = defaults.object(forKey: "savedDrinks") as? Data {
            if let decodedData = try? JSONDecoder().decode([DrinkElement].self, from: savedData) {
                return decodedData
            }
        }
        return nil
    }
}
