//
//  MenuPresenter.swift
//  TestAppHammerSystems
//
//  Created by Akai on 15/1/24.
//

import Foundation

class MenuPresenter: MenuPresenterProtocol {
    weak var view: MenuViewProtocol?
    var model: DrinkModel = DrinkModel()
    
    func viewDidLoad() {
        model.fetchDrinks { [weak self] drinks in
            DispatchQueue.main.async {
                self?.view?.displayMenuItems(drinks)
            }
        }
        
        if let savedDrinks = model.loadData() {
            view?.displayMenuItems(savedDrinks)
        }
    }
}
