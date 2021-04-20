//
//  UIColor.swift
//  rocksizorspaper
//
//  Created by Gusztav Jantay on 2021. 04. 20..
//

import UIKit

extension UIColor {
    
    static let customOrange = UIColor(red:253 ,green: 138, blue: 41, a :1.0)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red : CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a)
    }
    

}
