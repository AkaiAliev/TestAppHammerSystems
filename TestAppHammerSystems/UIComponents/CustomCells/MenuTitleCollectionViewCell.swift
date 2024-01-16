//
//  MenuTitleCollectionViewCell.swift
//  TestAppHammerSystems
//
//  Created by Akai on 12/1/24.
//

import UIKit

class MenuTitleCollectionViewCell: UICollectionViewCell {
    static var reuseID = String(describing: MenuTitleCollectionViewCell.self)
    
    var menuTitle: MenuTitleModel?
    
    lazy var backgroundFrame: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 88, height: 32)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var menuTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 42, height: 16)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "Пицца"
        label.numberOfLines = 0
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
        addSubview(backgroundFrame)
        backgroundFrame.addSubview(menuTitleLabel)
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundFrame.widthAnchor.constraint(equalToConstant: 88),
            backgroundFrame.heightAnchor.constraint(equalToConstant: 32),
            backgroundFrame.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundFrame.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            menuTitleLabel.widthAnchor.constraint(equalToConstant: 42),
            menuTitleLabel.heightAnchor.constraint(equalToConstant: 16),
            menuTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            menuTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func displayInfo(title: MenuTitleModel) {
        menuTitleLabel.text = title.name
    }
    
    func changeBackgroundColor() {
        if backgroundFrame.backgroundColor == .clear {
            backgroundFrame.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
        } else {
            backgroundFrame.backgroundColor = .clear
        }
    }
}

