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
        let bI = UIImageView()
        bI.translatesAutoresizingMaskIntoConstraints = false
        bI.backgroundColor = .clear
        bI.clipsToBounds = true
        bI.contentMode = .scaleAspectFit
        bI.layer.cornerRadius = 8
        return bI
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


extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.25,
    x: CGFloat = 0,
    y: CGFloat = 4,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
