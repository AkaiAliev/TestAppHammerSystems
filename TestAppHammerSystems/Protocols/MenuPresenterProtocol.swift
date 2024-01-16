//
//  MenuPresenterProtocol.swift
//  TestAppHammerSystems
//
//  Created by Akai on 15/1/24.
//

import Foundation

protocol MenuPresenterProtocol: AnyObject {
    var view: MenuViewProtocol? { get set }
    func viewDidLoad()
}
