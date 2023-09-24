//
//  MovieHeaderVC.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import Foundation
import UIKit

class MovieHeaderVC: UIView {

    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 100)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: MovieHeaderVC.self)
        bundle.loadNibNamed("MovieHeaderVC", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = ThemeColor.bg
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addShadow(offset: CGSize(width:4, height: 3), color:ThemeColor.primary, radius: 16.0, opacity: 0.8)
        NSLayoutConstraint.activate([
          
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            contentView.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -5)

        ])
      
    }
    

}


