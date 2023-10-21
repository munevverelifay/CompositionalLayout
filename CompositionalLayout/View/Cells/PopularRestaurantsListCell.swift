//
//  PopularRestaurantsListCell.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 17.10.2023.
//

import Foundation
import UIKit

class PopularRestaurantsListCell: UICollectionViewCell {
    static let cellIdentifier = "PopularRestaurantsListCell"
    var cellData : PopularRestaurantsListModel? {
        didSet {
            guard let cellData = cellData else {return}
            restaurantName.text = cellData.restaurantName
            restaurantImgCover.image = UIImage(named: cellData.restaurantCoverImage)
            restaurantInfoLabel.attributedText = setRestaurantInfoLabel(withRating: cellData.rating, withDesc: cellData.ratingsNumber)
            restaurantTagLabel.text = cellData.tags
        }
    }

    lazy var restaurantImgCover: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var restaurantName: UILabel = {
        let res = UILabel()
        res.translatesAutoresizingMaskIntoConstraints = false
        res.font = AppFonts.titleFont
        res.textColor = AppColors.titleColor
        return res
    }()
    
    let restaurantInfoLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let restaurantTagLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = AppFonts.secondaryFont
        l.textColor = AppColors.secondaryFontColor
        return l
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpConstrains()
    }
    
    func configure(){
        addSubview(restaurantImgCover)
        addSubview(restaurantName)
        addSubview(restaurantInfoLabel)
        addSubview(restaurantTagLabel)
    }
    
    
    func setUpConstrains() {
        
        NSLayoutConstraint.activate([
            restaurantImgCover.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            restaurantImgCover.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            restaurantImgCover.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            restaurantImgCover.heightAnchor.constraint(equalToConstant: 194),
            
            restaurantName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            restaurantName.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantName.topAnchor.constraint(equalTo: restaurantImgCover.bottomAnchor, constant: 8),
            
            restaurantInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            restaurantInfoLabel.topAnchor.constraint(equalTo: restaurantName.bottomAnchor, constant: 5),
            
            restaurantTagLabel.leadingAnchor.constraint(equalTo: restaurantInfoLabel.trailingAnchor, constant: 7),
            restaurantTagLabel.topAnchor.constraint(equalTo: restaurantName.bottomAnchor, constant: 10)
        ])
    }

    func setRestaurantInfoLabel(withRating rating: Float,  withDesc desc: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string:"")
        let fontSize = 12.0
        let starImg = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        let starImage = NSTextAttachment()
        starImage.image = starImg?.withTintColor(AppColors.fontColor)
        starImage.bounds = CGRect(x: 0, y: (AppFonts.secondaryFont.capHeight - fontSize).rounded() / 2, width: fontSize, height: fontSize)
        starImage.setImageHeight(height: fontSize)
        let imgString = NSAttributedString(attachment: starImage)
        
        attributedText.append(imgString)
        attributedText.append(NSAttributedString(string: " \(rating)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.fontColor]))
        attributedText.append(NSAttributedString(string: " \(desc)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.secondaryFontColor]))
        attributedText.append(NSAttributedString(string: "  • ", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.fontColor]))
        
        
        return attributedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}
