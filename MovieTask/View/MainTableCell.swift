//
//  MainTableCell.swift
//  MovieTask
//
//  Created by ziad ghali on 1/12/19.
//  Copyright © 2019 ziad ghali. All rights reserved.
//

import UIKit

class MainTableCell: UITableViewCell {
    
    @IBOutlet weak var PersonImage: UIImageView!
    @IBOutlet weak var PersonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PersonImage.roundView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func fillWith(_ Person: PersonModel){
        if let personImagePath = Person.profilePath{
            let totalPath = BASE_IMAGE_URL + personImagePath
            PersonImage.imageFromUrl(totalPath)
        }
        PersonNameLabel.text = Person.name
    }
    
}
