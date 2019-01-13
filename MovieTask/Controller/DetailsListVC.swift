//
//  DetailsVC.swift
//  MovieTask
//
//  Created by ziad ghali on 1/12/19.
//  Copyright © 2019 ziad ghali. All rights reserved.
//

import UIKit

class DetailsListVC: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var mediaItems: [MediaModel]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.register(UINib(nibName: "\(DetailsListCell.self)", bundle: nil), forCellReuseIdentifier: "\(DetailsListCell.self)")
    }
}

extension DetailsListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailsListCell.self)", for: indexPath) as! DetailsListCell
        let model = mediaItems[indexPath.row]
        cell.fillWith(model)
        return cell
    }
}
