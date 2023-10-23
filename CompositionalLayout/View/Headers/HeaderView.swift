//
//  HeaderView.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 17.10.2023.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let headerIdentifier = "HeaderView"
    var titleText: String? {
        didSet {
            title.text = titleText
        }
    }
    var titleFont: UIFont? {
          didSet {
              title.font = titleFont
          }
      }
    private let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = AppColors.titleColor
        title.textAlignment = .left
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpViews(){
        backgroundColor = .clear
        addSubview(title)
    }
}
