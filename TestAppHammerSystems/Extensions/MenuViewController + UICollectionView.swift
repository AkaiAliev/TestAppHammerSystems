//
//  MenuViewController + UICollectionView.swift
//  TestAppHammerSystems
//
//  Created by Akai on 12/1/24.
//

import UIKit

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuTitleCollectionView {
            if let selectedMenuIndex = selectedMenuIndex, selectedMenuIndex == indexPath {
                return
            }
            
            if let previousIndex = selectedMenuIndex {
                let previousCell = collectionView.cellForItem(at: previousIndex) as? MenuTitleCollectionViewCell
                previousCell?.changeBackgroundColor()
            }
            
            let cell = collectionView.cellForItem(at: indexPath) as? MenuTitleCollectionViewCell
            cell?.changeBackgroundColor()
            
            selectedMenuIndex = indexPath
        }
    }
}

extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case promotionCollectionView:
            return promotions.count
        case menuTitleCollectionView:
            return menuTitle.count
        case menuCollectionView:
            return menuItems.count
        default:
            fatalError("Неизвестный UICollectionView")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case promotionCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCollectionViewCell.reuseID, for: indexPath) as? PromotionCollectionViewCell else {
                fatalError("Не удалось привести UICollectionViewCell к PromotionCollectionViewCell")
            }
            let promotion = promotions[indexPath.item]
            cell.displayInfo(promotions: promotion)
            return cell
        case menuTitleCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuTitleCollectionViewCell.reuseID, for: indexPath) as? MenuTitleCollectionViewCell else {
                fatalError("Не удалось привести UICollectionViewCell к MenuTitleCollectionViewCell")
            }
            let title = menuTitle[indexPath.item]
            cell.displayInfo(title: title)
            
            if indexPath == selectedMenuIndex {
                cell.backgroundFrame.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
            } else {
                cell.backgroundFrame.backgroundColor = .clear
            }
            
            return cell
        case menuCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseID, for: indexPath) as? MenuCollectionViewCell else {
                fatalError("Не удалось привести UICollectionViewCell к MenuCollectionViewCell")
            }
            let menuItem = menuItems[indexPath.item]
            cell.displayInfo(menu: menuItem)
            return cell
        default:
            fatalError("Неизвестный UICollectionView")
        }
    }
}
