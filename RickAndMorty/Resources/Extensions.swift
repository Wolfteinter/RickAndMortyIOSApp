//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 25/04/23.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
