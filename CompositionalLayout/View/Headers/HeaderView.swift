//
//  HeaderView.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 17.10.2023.
//

import Foundation
import UIKit

class HeaderView: UICollectionReusableView {
    
    // MARK: PROPERTIES -
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
    
    
    let title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = UIColor(red: 74/255, green: 75/255, blue: 77/255, alpha: 1.0)
        l.textAlignment = .left
        return l
    }()
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
//        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        backgroundColor = .clear
        addSubview(title)
    }
}
