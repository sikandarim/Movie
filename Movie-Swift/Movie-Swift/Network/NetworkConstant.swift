//
//  NetworkConstant.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//


import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init(){
        //Singleton
    }
    public var apiKey: String {
        get {
         
            return "5b6f46b695458bbadd9fe8ff6820a241"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}

