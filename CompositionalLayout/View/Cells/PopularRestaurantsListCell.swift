//
//  PopularRestaurantsListCell.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 17.10.2023.
//

import UIKit

class PopularRestaurantsListCell: UICollectionViewCell {
    static let cellIdentifier = "PopularRestaurantsListCell"
    var cellData : PopularRestaurantsListModel? {
        didSet {
            guard let cellData = cellData else {return}
            restaurantName.text = cellData.restaurantName
            restaurantImgCover.image = UIImage(named: cellData.restaurantCoverImage)
            restaurantInfoLabel.attributedText = setRestaurantInfoText(withRating: cellData.rating, description: cellData.ratingsNumber, starFontSize: 12)
            restaurantTagLabel.text = cellData.tags
        }
    }
    private let restaurantImgCover: UIImageView = {
        let restaurantImgCover = UIImageView()
        restaurantImgCover.translatesAutoresizingMaskIntoConstraints = false
        restaurantImgCover.contentMode = .scaleAspectFill
        restaurantImgCover.clipsToBounds = true
        return restaurantImgCover
    }()
    private let restaurantName: UILabel = {
        let restaurantName = UILabel()
        restaurantName.translatesAutoresizingMaskIntoConstraints = false
        restaurantName.font = AppFonts.titleFont
        restaurantName.textColor = AppColors.titleColor
        return restaurantName
    }()
    private let restaurantInfoLabel: UILabel = {
        let restaurantInfoLabel = UILabel()
        restaurantInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        return restaurantInfoLabel
    }()
    private let restaurantTagLabel: UILabel = {
        let restaurantTagLabel = UILabel()
        restaurantTagLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantTagLabel.font = AppFonts.secondaryFont
        restaurantTagLabel.textColor = AppColors.secondaryFontColor
        return restaurantTagLabel
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
    func setRestaurantInfoText(withRating rating: Float, description: String, starFontSize: CGFloat) -> NSAttributedString {
        let starImage = NSTextAttachment()
        starImage.image = UIImage(systemName: "star.fill")?.withTintColor(AppColors.fontColor)
        starImage.bounds = CGRect(x: 0, y: -1 , width: starFontSize, height: starFontSize)
        let starAttributedString = NSAttributedString(attachment: starImage)
        let attributedText = NSMutableAttributedString()
        attributedText.append(starAttributedString)
        attributedText.append(NSAttributedString(string: " \(rating)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.fontColor]))
        attributedText.append(NSAttributedString(string: " \(description)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.secondaryFontColor]))
        attributedText.append(NSAttributedString(string: "  • ", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.fontColor]))
        return attributedText
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
