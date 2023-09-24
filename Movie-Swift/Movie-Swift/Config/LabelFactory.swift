//
//  LabelFactory.swift
//  Movie-Swift
//
//  Created by Mariam Sikandari on 2023-07-29.
//

import Foundation
import UIKit
struct LabelFactory {
  
  static func build(
    text: String?,
    font: UIFont,
    backgroundColor: UIColor = .clear,
    textColor: UIColor = ThemeColor.text,
    textAlignment: NSTextAlignment = .center) -> UILabel {
      let label = UILabel()
      label.text = text
      label.font = font
      label.backgroundColor = backgroundColor
      label.textColor = textColor
      label.textAlignment = textAlignment
      return label
    }
    
    static func buildTextView(
      font: UIFont,
      backgroundColor: UIColor = .clear,
      textColor: UIColor = ThemeColor.text,
      textAlignment: NSTextAlignment = .center) -> UITextView {
        let textView = UITextView()
          textView.font = font
          textView.backgroundColor = backgroundColor
          textView.textColor = textColor
          textView.textAlignment = textAlignment
          textView.textAlignment = .left
        return textView
      }
    static func buildText(
      font: UIFont,
      backgroundColor: UIColor = .clear,
      textColor: UIColor = ThemeColor.text,
      textAlignment: NSTextAlignment = .center) -> UILabel {
        let textView = UILabel()
          textView.font = font
          textView.backgroundColor = backgroundColor
          textView.textColor = textColor
          textView.textAlignment = textAlignment
          textView.textAlignment = .left
        return textView
      }
    
    
    
}

