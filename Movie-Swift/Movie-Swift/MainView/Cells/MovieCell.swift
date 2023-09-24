//
//  MovieCell.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import Foundation
import UIKit
class MovieCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
    LabelFactory.buildText( font: ThemeFont.demibold(ofSize: 14))
    }()
   
    let imageheader = UIImageView()
    
    lazy var stackView = UIStackView(arrangedSubviews: [nameLabel, imageheader])
    
    static let reuseID = "movieList"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
        backgroundColor = ThemeColor.bg
        addBorder(color: ThemeColor.primary, width: 3)
        round()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieCell {
    private func setup(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
  
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.numberOfLines = 2
        nameLabel.textAlignment = .center
    
        imageheader.translatesAutoresizingMaskIntoConstraints = false
        imageheader.addShadow(offset: CGSize(width:0, height: 3), color: .black, radius: 16.0, opacity: 0.8)
        imageheader.addBorder(color: ThemeColor.primary, width: 3)
        
        contentView.addSubview(stackView)
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageheader.widthAnchor.constraint(equalToConstant: 100),
            imageheader.heightAnchor.constraint(equalToConstant: 3),
        ])
    }
}



extension MovieCell {
   
    func setupCell(viewModel: MovieTableViewCellModel){
        self.nameLabel.text = viewModel.name
        self.imageheader.downloadImage(with: viewModel.image ?? "")
    }
    
}
