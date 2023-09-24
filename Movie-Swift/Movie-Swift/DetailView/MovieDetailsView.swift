//
//  MovieDetailsView.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import Foundation
import UIKit

class MovieDetailsView: UIView {
  
    var imageheader = UIImageView()

   let titleLabel: UILabel = {
        LabelFactory.buildText( font: ThemeFont.demibold(ofSize: 20))
    }()
    
    let releaseDateLabel: UILabel = {
        LabelFactory.buildText( font: ThemeFont.regular(ofSize: 20))
   }()
     let desLabel: UILabel = {
        LabelFactory.build(text: "Description:", font: ThemeFont.demibold(ofSize: 20))
    }()
    let labelDescriptionExplained: UILabel = {
        LabelFactory.buildText( font: ThemeFont.regular(ofSize: 18))
    }()
    
    let dividerView = UIView()


    lazy var stackView = UIStackView(arrangedSubviews: [ releaseDateLabel, desLabel,labelDescriptionExplained])
    lazy var stackViewTitle = UIStackView(arrangedSubviews: [imageheader,titleLabel,dividerView])
    
    init() {
        super.init(frame: .zero)
        backgroundColor = ThemeColor.bg
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MovieDetailsView{
    
    func style(){
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        
        stackViewTitle.translatesAutoresizingMaskIntoConstraints = false
        stackViewTitle.axis = .vertical
        stackViewTitle.spacing = 22
        imageheader.translatesAutoresizingMaskIntoConstraints = false
        imageheader.addBorder(color: ThemeColor.primary, width: 3)
        
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
 
        dividerView.backgroundColor = ThemeColor.primary
       
        desLabel.textAlignment = .left
        
        labelDescriptionExplained.textAlignment = .left
        labelDescriptionExplained.numberOfLines = 20
        labelDescriptionExplained.lineBreakMode = .byWordWrapping
        
        addShadow(offset: CGSize(width:4, height: 3), color: ThemeColor.primary, radius: 16.0, opacity: 0.8)
        
  
        
    }
    
    func layout(){
        addSubview(stackViewTitle)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackViewTitle.topAnchor.constraint(equalTo: topAnchor,constant: 15),
            stackViewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackViewTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: stackViewTitle.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
            imageheader.heightAnchor.constraint(equalToConstant: 200)
 
        ])
        dividerView.heightAnchor.constraint(equalToConstant: 3).isActive = true
    }
    
}

