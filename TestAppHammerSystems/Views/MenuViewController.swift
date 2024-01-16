//
//  MenuViewController.swift
//  TestAppHammerSystems
//
//  Created by Akai on 12/1/24.
//

import UIKit

class MenuViewController: UIViewController, MenuViewProtocol {
    
    var presenter: MenuPresenterProtocol!
    
    var menuItems = [DrinkElement]()
    var promotions = [
        PromotionBannerModel(image: UIImage(named: "promotion")!),
        PromotionBannerModel(image: UIImage(named: "promotion")!),
        PromotionBannerModel(image: UIImage(named: "promotion")!),
        PromotionBannerModel(image: UIImage(named: "promotion")!),
        PromotionBannerModel(image: UIImage(named: "promotion")!),
        PromotionBannerModel(image: UIImage(named: "promotion")!)
    ]
    
    var menuTitle = [
        MenuTitleModel(name: "Пицца"),
        MenuTitleModel(name: "Комбо"),
        MenuTitleModel(name: "Дессерты"),
        MenuTitleModel(name: "Напитки"),
        MenuTitleModel(name: "Пицца"),
        MenuTitleModel(name: "Комбо"),
        MenuTitleModel(name: "Дессерты"),
        MenuTitleModel(name: "Напитки")
    ]
    
    var selectedMenuIndex: IndexPath?
    
    private lazy var сityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Москва"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.frame = CGRect(x: 0, y: 0, width: 61, height: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
        
    }()
    
    private lazy var arrowDownImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrowDown")
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 0, y: 0, width: 14, height: 8)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var locationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var promotionCollectionView: UICollectionView = {
        var viewLayout = UICollectionViewFlowLayout()
        viewLayout.itemSize = CGSize(width: 300, height: 112)
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 16
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            PromotionCollectionViewCell.self,
            forCellWithReuseIdentifier: PromotionCollectionViewCell.reuseID
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    lazy var menuTitleCollectionView: UICollectionView = {
        var viewLayout = UICollectionViewFlowLayout()
        viewLayout.itemSize = CGSize(width: 88, height: 32)
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 8
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            MenuTitleCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuTitleCollectionViewCell.reuseID
        )
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 749)
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var menuCollectionView: UICollectionView = {
        var viewLayout = UICollectionViewFlowLayout()
        viewLayout.itemSize = CGSize(width: 375, height: 172)
        viewLayout.scrollDirection = .vertical
        viewLayout.minimumLineSpacing = 1
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            MenuCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuCollectionViewCell.reuseID
        )
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //    private lazy var mainScrollView: UIScrollView = {
    //        let scrollView = UIScrollView(frame: .zero)
    //        scrollView.backgroundColor = .clear
    //        scrollView.frame = view.bounds
    //        scrollView.autoresizingMask = .flexibleHeight
    //        scrollView.bounces = true
    //        scrollView.isScrollEnabled = true
    //        scrollView.showsVerticalScrollIndicator = false
    //        scrollView.translatesAutoresizingMaskIntoConstraints = false
    //        return scrollView
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        print("MenuViewController: viewDidLoad")
        self.title = "Меню"
        presenter = MenuPresenter()
        presenter.view = self
        presenter.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        setUpSubviews()
        setUpConstraints()
    }
    
    private func setUpSubviews() {
        view.addSubview(locationStackView)
        locationStackView.addArrangedSubview(сityTitleLabel)
        locationStackView.addArrangedSubview(arrowDownImageView)
        view.addSubview(promotionCollectionView)
        view.addSubview(menuTitleCollectionView)
        view.addSubview(backgroundView)
        backgroundView.addSubview(menuCollectionView)
        //        view.addSubview(mainScrollView)
        
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            locationStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            locationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            locationStackView.widthAnchor.constraint(equalToConstant: 83),
            locationStackView.heightAnchor.constraint(equalToConstant: 20),
            
            promotionCollectionView.topAnchor.constraint(equalTo: locationStackView.bottomAnchor, constant: 24),
            promotionCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            promotionCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            promotionCollectionView.heightAnchor.constraint(equalToConstant: 112),
            
            menuTitleCollectionView.topAnchor.constraint(equalTo: promotionCollectionView.bottomAnchor, constant: 24),
            menuTitleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            menuTitleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            menuTitleCollectionView.heightAnchor.constraint(equalToConstant: 45),
            
            backgroundView.topAnchor.constraint(equalTo: menuTitleCollectionView.bottomAnchor, constant: 24),
            backgroundView.heightAnchor.constraint(equalToConstant: 447),
            backgroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            menuCollectionView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0),
            menuCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0),
            menuCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0),
            menuCollectionView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0)
        ])
    }
    
    func displayMenuItems(_ items: [DrinkElement]) {
        self.menuItems = items
        self.menuCollectionView.reloadData()
    }
}
