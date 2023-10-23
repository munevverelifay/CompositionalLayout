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
            subtitle.attributedText = setRestaurantInfoLabel(withRating: cellData.rating, description: cellData.categoryTags, restaurantCategoryTags: cellData.restaurantCategoryTags, starFontSize: 12)
        }
    }
    let restaurantImage: UIImageView = {
        let restaurantImage = UIImageView()
        restaurantImage.translatesAutoresizingMaskIntoConstraints = false
        restaurantImage.contentMode = .scaleAspectFill
        restaurantImage.clipsToBounds = true
        restaurantImage.layer.cornerRadius = 20
        return restaurantImage
    }()
    let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Restaurant Name"
        title.font = AppFonts.restaurantNameFont
        title.textColor = AppColors.titleColor
        title.textAlignment = .left
        return title
    }()
    let subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = "Italian-American"
        subtitle.font = AppFonts.secondaryFont
        subtitle.textColor = AppColors.secondaryFontColor
        subtitle.textAlignment = .left
        return subtitle
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpViews(){
        addSubview(restaurantImage)
        addSubview(title)
        addSubview(subtitle)
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
    func setRestaurantInfoLabel(withRating rating: Float, description: String, restaurantCategoryTags: String, starFontSize: CGFloat) -> NSAttributedString {
        let starImage = NSTextAttachment()
        starImage.image = UIImage(systemName: "star.fill")?.withTintColor(AppColors.fontColor)
        starImage.bounds = CGRect(x: 0, y: -1 , width: starFontSize, height: starFontSize)
        let starAttributedString = NSAttributedString(attachment: starImage)
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "\(restaurantCategoryTags)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.secondaryFontColor]))
        attributedText.append(NSAttributedString(string: "  • ", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.fontColor]))
        attributedText.append(NSAttributedString(string: "  \(description)  ", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.secondaryFontColor]))
        attributedText.append(starAttributedString)
        attributedText.append(NSAttributedString(string: " \(rating)", attributes: [NSAttributedString.Key.font: AppFonts.secondaryFont, NSAttributedString.Key.foregroundColor: AppColors.fontColor]))
        return attributedText
    }
}
