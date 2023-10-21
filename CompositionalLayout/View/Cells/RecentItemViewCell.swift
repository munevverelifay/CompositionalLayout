//
//  RecentItemViewCell.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 17.10.2023.
//

import Foundation

import UIKit

class RecentItemViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "RecentItemViewCell"
    var benefitHeightConstrains: NSLayoutConstraint?
    var locationHeightConstrains: NSLayoutConstraint?
    
    var cellData : RecentItemsListModel? {
        didSet {
            guard let cellData = cellData else {return}
            restaurantName.text = cellData.restaurantName
            restaurantImgCover.image = UIImage(named: cellData.restaurantCoverImage)
            restaurantInfoLabel.attributedText = setRestaurantInfoLabel(withRating: cellData.rating, withDesc: cellData.ratingsNumber)
            restaurantTagLabel.text = cellData.tags
           
        }
    }
    
    //MARK: Prop
    lazy var restaurantImageCard: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    lazy var restaurantImgCover: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        return img
    }()
    

    
    lazy var restaurantName: UILabel = {
        let res = UILabel()
        res.translatesAutoresizingMaskIntoConstraints = false
        res.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        res.textColor = .label
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
        l.font = UIFont.systemFont(ofSize: 13,weight: .regular)
        l.textColor = .darkGray.withAlphaComponent(0.8)
        return l
    }()
    

    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpConstrains()
    }
    
    func configure(){
        addSubview(restaurantImageCard)
        restaurantImageCard.addSubview(restaurantImgCover)
 
        
        addSubview(restaurantName)
        addSubview(restaurantInfoLabel)
        addSubview(restaurantTagLabel)
  
    }
    
    func setUpConstrains(){
        restaurantImgCover.setUp(to: restaurantImageCard)

        
        NSLayoutConstraint.activate([
            
            restaurantImageCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantImageCard.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            restaurantImageCard.bottomAnchor.constraint(equalTo: bottomAnchor),
            restaurantImageCard.widthAnchor.constraint(equalToConstant: 75),
            
            restaurantName.topAnchor.constraint(equalTo: topAnchor , constant: 5),
            restaurantName.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 30),
            restaurantName.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantName.bottomAnchor.constraint(equalTo: restaurantInfoLabel.topAnchor, constant: -3),
            
            restaurantInfoLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantInfoLabel.bottomAnchor.constraint(equalTo: restaurantTagLabel.topAnchor, constant: -5),
            
            restaurantTagLabel.leadingAnchor.constraint(equalTo: restaurantImageCard.trailingAnchor, constant: 15),
            restaurantTagLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantTagLabel.bottomAnchor.constraint(equalTo: restaurantTagLabel.topAnchor, constant: -8),
            
            
        ])
    
    }
    
    
    func setOfferAttributedLabel(withTitle title: String, withSubtitle subtitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title.uppercased(), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13,weight: .bold) , NSAttributedString.Key.foregroundColor: UIColor.orange]))
        attributedText.append(NSAttributedString(string: "\n• \(subtitle) •".uppercased(), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 7,weight: .regular) , NSAttributedString.Key.foregroundColor: UIColor.orange]))
        return attributedText
    }
    
    func setRestaurantInfoLabel(withRating rating: Float, withDesc desc: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string:"")
        
        let fontSize = 13.0
        let fontColor = UIColor.darkGray
        let font = UIFont.systemFont(ofSize: fontSize,weight: .regular)
        
        // Star Icon
        let starImg = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        let starImage = NSTextAttachment()
        starImage.image = starImg?.withTintColor(fontColor)
        starImage.bounds = CGRect(x: 0, y: (font.capHeight - fontSize).rounded() / 2, width: fontSize, height: fontSize)
        starImage.setImageHeight(height: fontSize)
        let imgString = NSAttributedString(attachment: starImage)
        attributedText.append(imgString)
        
        attributedText.append(NSAttributedString(string: "  \(rating)  •  \(desc)" , attributes:[NSAttributedString.Key.font: font , NSAttributedString.Key.foregroundColor: fontColor]))
        
        return attributedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
