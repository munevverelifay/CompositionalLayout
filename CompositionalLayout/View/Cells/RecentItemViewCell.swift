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
            restaurantNameLabel.text = cellData.restaurantName
            restaurantImgCover.image = UIImage(named: cellData.restaurantCoverImage)
            restaurantTagLabel.attributedText = setRestaurantTagLabel(restaurantCategoryTags: cellData.restaurantCategoryTags, categoryTags: cellData.categoryTags)
            restaurantInfoLabel.attributedText = setRestaurantInfoLabel(withRating: cellData.rating, description: cellData.ratingsNumber, starFontSize: 12)
        }
    }
    lazy var restaurantImgCover: UIImageView = {
        let restaurantImgCover = UIImageView()
        restaurantImgCover.translatesAutoresizingMaskIntoConstraints = false
        restaurantImgCover.contentMode = .scaleAspectFill
        restaurantImgCover.clipsToBounds = true
        restaurantImgCover.layer.cornerRadius = 8
        return restaurantImgCover
    }()

    lazy var restaurantNameLabel: UILabel = {
        let restaurantNameLabel = UILabel()
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLabel.font = UIFont.systemFont(ofSize: 15,weight: .bold)
        restaurantNameLabel.textColor = .label
        return restaurantNameLabel
    }()
    let restaurantInfoLabel: UILabel = {
        let restaurantInfoLabel = UILabel()
        restaurantInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        return restaurantInfoLabel
    }()
    let restaurantTagLabel: UILabel = {
        let restaurantTagLabel = UILabel()
        restaurantTagLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantTagLabel.font = UIFont.systemFont(ofSize: 13,weight: .regular)
        restaurantTagLabel.textColor = .darkGray.withAlphaComponent(0.8)
        return restaurantTagLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpConstrains()
    }
    func configure(){
        addSubview(restaurantImgCover)
        addSubview(restaurantNameLabel)
        addSubview(restaurantInfoLabel)
        addSubview(restaurantTagLabel)
    }
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            restaurantImgCover.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantImgCover.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            restaurantImgCover.bottomAnchor.constraint(equalTo: bottomAnchor),
            restaurantImgCover.widthAnchor.constraint(equalToConstant: 75),
            restaurantNameLabel.topAnchor.constraint(equalTo: topAnchor , constant: 5),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: restaurantImgCover.trailingAnchor, constant: 22),
            restaurantNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantNameLabel.bottomAnchor.constraint(equalTo: restaurantTagLabel.topAnchor, constant: -3),
            restaurantTagLabel.leadingAnchor.constraint(equalTo: restaurantImgCover.trailingAnchor, constant: 22),
            restaurantTagLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantTagLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 2),
            restaurantInfoLabel.leadingAnchor.constraint(equalTo: restaurantImgCover.trailingAnchor, constant: 22),
            restaurantInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantInfoLabel.topAnchor.constraint(equalTo: restaurantTagLabel.bottomAnchor, constant: 1),
        ])
    }
    func setRestaurantTagLabel(restaurantCategoryTags: String, categoryTags: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "\(restaurantCategoryTags)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.secondaryFontColor]))
        attributedText.append(NSAttributedString(string: "  •  ", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.fontColor]))
        attributedText.append(NSAttributedString(string: " \(categoryTags)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.secondaryFontColor]))
        return attributedText
    }
    func setRestaurantInfoLabel(withRating rating: Float, description: String, starFontSize: CGFloat) -> NSAttributedString {
        let starImage = NSTextAttachment()
        starImage.image = UIImage(systemName: "star.fill")?.withTintColor(AppColors.fontColor)
        starImage.bounds = CGRect(x: 0, y: -1 , width: starFontSize, height: starFontSize)
        let starAttributedString = NSAttributedString(attachment: starImage)
        let attributedText = NSMutableAttributedString()
        attributedText.append(starAttributedString)
        attributedText.append(NSAttributedString(string: " \(rating)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.fontColor]))
        attributedText.append(NSAttributedString(string: " \(description)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.secondaryFontColor]))
        return attributedText
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
