//
//  DetailsListCell.swift
//  MovieTask
//
//  Created by ziad ghali on 1/12/19.
//  Copyright © 2019 ziad ghali. All rights reserved.
//

import UIKit

class DetailsListCell: UITableViewCell {

    @IBOutlet weak var BackgroundImageView: UIImageView!
    @IBOutlet weak var PosterImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var ReleaseDateLabel: UILabel!
    @IBOutlet weak var VotesLabel: UILabel!
    @IBOutlet weak var OverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func fillWith(_ media: MediaModel){
        if let backgroundImagePath = media.backdrop_path, let posterImagePath = media.poster_path{
            let BackgroundTotalPath = BASE_IMAGE_URL + backgroundImagePath
            let PosterTotalPath = BASE_IMAGE_URL + posterImagePath
            BackgroundImageView.imageFromUrl(BackgroundTotalPath)
            PosterImageView.imageFromUrl(PosterTotalPath)
        }
        ReleaseDateLabel.text = media.release_date
        TitleLabel.text = media.title
        VotesLabel.text = String(media.vote_count)
        OverviewLabel.text = media.overview
        
    }
}
