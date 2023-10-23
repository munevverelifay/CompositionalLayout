//
//  TopBannerCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 16.10.2023.
//

import Foundation
import UIKit

class TopBannerCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "TopBannerCollectionViewCell"
    var cellData : TopBannerModel? {
        didSet {
            guard let cellData = cellData else {return}
            bannerImage.image = UIImage(named: cellData.image)
        }
    }
    let bannerImage : UIImageView = {
        let bannerImage = UIImageView()
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        bannerImage.backgroundColor = .clear
        bannerImage.clipsToBounds = true
        bannerImage.contentMode = .scaleAspectFit
        bannerImage.layer.cornerRadius = 8
        return bannerImage
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    func configure(){
        contentView.backgroundColor = .clear
        addSubview(bannerImage)
        bannerImage.setUp(to: self)
        bannerImage.layer.applySketchShadow()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

