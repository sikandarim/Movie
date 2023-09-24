//
//  MovieDetailsViewModel.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//
//
import Foundation

class MovieDetailsViewModel {

  //  var movieData: Movie
    var movieId: Int
    var movieImage: String?
    var movieTitle: String
    var movieDescription: String
    var releaseDate: String?
   
    
    init(movie: Movie) {
        
        var makeUrlString: String {
            return "\(NetworkConstant.shared.imageServerAddress)\(movie.backdropPath ?? "" )"
        }

 
        self.movieId = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeUrlString
        self.releaseDate = movie.releaseDate
        

    }
    
    


}
