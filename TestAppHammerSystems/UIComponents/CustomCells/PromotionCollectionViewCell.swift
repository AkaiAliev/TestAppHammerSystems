//
//  PromotionCollectionViewCell.swift
//  TestAppHammerSystems
//
//  Created by Akai on 12/1/24.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    static var reuseID = String(describing: PromotionCollectionViewCell.self)
    
    var promotionsArray: PromotionBannerModel?
    
    private lazy var promotionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "waterbottle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 112)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        setUpSubviews()
        setUpConstraints()

    }
    
    private func setUpSubviews() {
        addSubview(promotionImageView)
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            promotionImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            promotionImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func displayInfo(promotions: PromotionBannerModel) {
        promotionsArray = promotions
        promotionImageView.image = promotions.image
    }
}
