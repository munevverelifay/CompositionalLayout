//
//  MostPopularListViewCell.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 17.10.2023.
//


import UIKit

class MostPopularListViewCell: UICollectionViewCell {

    static let cellIdentifier = "MostPopularListViewCell"
    
    var cellData: MostPopularListModel? {
        didSet {
            guard let cellData = cellData else { return }
            restaurantImage.image = UIImage(named: cellData.coverImage)
            title.text = cellData.restaurantName
            subtitle.text = cellData.categoryTags
        }
    }
    
    let restaurantImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Restaurant Name"
        l.font = UIFont(name: "Inter", size: 18)
        l.textColor = AppColors.titleColor
        l.textAlignment = .left
        return l
    }()

    let subtitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "North India, Punjabi"
        l.font = UIFont(name: "Inter", size: 12)
        l.textColor = UIColor(red: 182/255, green: 183/255, blue: 283/255, alpha: 1.0)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        addSubview(restaurantImage)
        addSubview(title)
        addSubview(subtitle)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            print(self.frame.size.width)
        }
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            restaurantImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            restaurantImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            restaurantImage.heightAnchor.constraint(equalToConstant: 135),
            restaurantImage.topAnchor.constraint(equalTo: topAnchor),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: 11),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
            subtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}
