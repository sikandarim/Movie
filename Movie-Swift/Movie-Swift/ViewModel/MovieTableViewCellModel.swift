//
//  MovieTableViewCellModel.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import Foundation

class MovieTableViewCellModel {
    var id: Int
    var name: String
    var image: String?
    
    init(movie: Movie) {
        var makeUrlString: String {
            return "\(NetworkConstant.shared.imageServerAddress)\(movie.posterPath ?? "" )"
        }
        self.id = movie.id
        self.name = movie.name ?? movie.title ?? ""
        self.image = makeUrlString
    }
    

}


