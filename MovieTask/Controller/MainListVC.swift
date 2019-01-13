//
//  MainListVC.swift
//  MovieTask
//
//  Created by ziad ghali on 1/12/19.
//  Copyright © 2019 ziad ghali. All rights reserved.
//

import UIKit

class MainListVC: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var persons: [PersonModel]! = []
    var isDataLoading:Bool!
    var Page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.register(UINib(nibName: "\(MainTableCell.self)", bundle: nil), forCellReuseIdentifier: "\(MainTableCell.self)")
        callApis()
    }
    
    private func callApis(_ scrolled: Bool? = nil){
        LoadingViewController.shared.show(self)
        if scrolled != nil , scrolled!{
            Page += 1
        }
        Api.GetPopular(Page) { [unowned self](success, errorMsg, object) in
            LoadingViewController.shared.close {
                    if success {
                        if let model = object as? [PersonModel] {
                            self.persons += model
                            self.TableView.reloadData()
                        }
                    }else if let message = errorMsg{
                        //TODO: Alert message
                        debugPrint(message)
                    }
                }
            }
        
    }
}

extension MainListVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "\(MainTableCell.self)", for: indexPath) as! MainTableCell
        let model = persons[indexPath.row]
        cell.fillWith(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "\(DetailsListVC.self)") as? DetailsListVC
        let person = persons[indexPath.row]
        nextVC?.title = person.name
        nextVC?.mediaItems = person.knownFor
        self.navigationController?.pushViewController(nextVC!, animated: true)
    }
    
}

extension MainListVC: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
        isDataLoading = false
    }
    
    //Pagination
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
        if ((TableView.contentOffset.y + TableView.frame.size.height) >= TableView.contentSize.height) {
            if !isDataLoading{
                isDataLoading = true
                self.callApis(true)
            }
        }
    }
    
}
