//
//  MenuCollectionViewCell.swift
//  TestAppHammerSystems
//
//  Created by Akai on 12/1/24.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static var reuseID = String(describing: MenuCollectionViewCell.self)
    
    var menuArray: DrinkElement?
    
    private lazy var foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "waterbottle")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 132, height: 132)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var foodNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 136, height: 20)
        label.textColor = UIColor(red: 0.133, green: 0.157, blue: 0.192, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.text = "Ветчина и грибы"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 171, height: 48)
        label.textColor = UIColor(red: 0.665, green: 0.668, blue: 0.679, alpha: 1)
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundFrame: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 87, height: 32)
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 42, height: 16)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.text = "от 345 р"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(foodImageView)
        addSubview(foodNameLabel)
        addSubview(foodDescriptionLabel)
        addSubview(backgroundFrame)
        backgroundFrame.addSubview(priceTitleLabel)
        
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            foodImageView.widthAnchor.constraint(equalToConstant: 132),
            foodImageView.heightAnchor.constraint(equalToConstant: 132),
            foodImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            foodImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            foodNameLabel.widthAnchor.constraint(equalToConstant: 136),
            foodNameLabel.heightAnchor.constraint(equalToConstant: 20),
            foodNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            foodNameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 32),

            foodDescriptionLabel.widthAnchor.constraint(equalToConstant: 171),
            foodDescriptionLabel.heightAnchor.constraint(equalToConstant: 48),
            foodDescriptionLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 16),
            foodDescriptionLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 32),

            backgroundFrame.widthAnchor.constraint(equalToConstant: 87),
            backgroundFrame.heightAnchor.constraint(equalToConstant: 32),
            backgroundFrame.topAnchor.constraint(equalTo: foodDescriptionLabel.bottomAnchor, constant: 16),
            backgroundFrame.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 116),

            priceTitleLabel.widthAnchor.constraint(equalToConstant: 51),
            priceTitleLabel.heightAnchor.constraint(equalToConstant: 16),
            priceTitleLabel.centerXAnchor.constraint(equalTo: backgroundFrame.centerXAnchor),
            priceTitleLabel.centerYAnchor.constraint(equalTo: backgroundFrame.centerYAnchor)
            
        ])
    }
    
    func displayInfo(menu: DrinkElement) {
        menuArray = menu
        if let imageURL = URL(string: menuArray?.imageURL ?? "no image") {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                if let error = error {
                    print("Error downloading image: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.foodImageView.image = image
                    }
                }
            }.resume()
        }
        foodNameLabel.text = menu.name
        foodDescriptionLabel.text = menu.description
        priceTitleLabel.text = menu.name
    }
}
