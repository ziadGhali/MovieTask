//
//  UIView+Extension.swift
//  MovieTask
//
//  Created by ziad ghali on 1/12/19.
//  Copyright © 2019 ziad ghali. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromUrl(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request){ data, response, error in
                if let data = data{
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}

extension UIView{
    func roundView(){
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
}
