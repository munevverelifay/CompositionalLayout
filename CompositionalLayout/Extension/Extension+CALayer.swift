//
//  Extension+CALayer.swift
//  CompositionalLayout
//
//  Created by Münevver Elif Ay on 23.10.2023.
//

import UIKit

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
