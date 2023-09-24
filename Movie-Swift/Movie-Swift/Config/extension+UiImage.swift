//
//  extension+UiImage.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import Foundation
import UIKit
extension UIImageView  {
    func downloadImage(with urlString: String ){
        
        if let url = URL(string: urlString){
            let dataTask = URLSession.shared.dataTask(with: url, completionHandler: {
                (data, response, error) in
                guard let
                        data = data, error == nil,
                      let image = UIImage(data: data)
                else {
                    return
                }
                DispatchQueue.main.async {
                    self.image = image
                }
            })
            dataTask.resume()
            
        }
    }
}

    

