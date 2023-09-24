//
//  ThemeFont.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import Foundation
import UIKit
struct ThemeFont {

  static func regular(ofSize size: CGFloat) -> UIFont {
    return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
  }
  
  static func bold(ofSize size: CGFloat) -> UIFont {
    return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
  }
  
  static func demibold(ofSize size: CGFloat) -> UIFont {
    return UIFont(name: "AvenirNext-DemiBold", size: size) ?? .systemFont(ofSize: size)
  }
    
}

