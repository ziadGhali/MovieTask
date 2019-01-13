//
//  pickerViewController.swift
//  CoozynPilot
//
//  Created by Ahmed Osama on 12/25/16.
//
//

import UIKit

class LoadingViewController: UIViewController {
    static var shared = LoadingViewController()
    
    var currentVC: UIViewController!
    var isDismissed = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isDismissed = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        isDismissed = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showAsSubView(_ view: UIView) {
        DispatchQueue.main.async {
            self.view.frame.size = view.frame.size
            
            self.view.alpha = 0
            view.addSubview(self.view)
            UIView.animate(withDuration: 0.2, animations: {
                self.view.alpha = 1
            })
        }
    }
    
    func removeFromSuper() {
        DispatchQueue.main.async {
            self.view.alpha = 1
            UIView.animate(withDuration: 0.2, animations: { 
                self.view.alpha = 0
            }, completion: { (isDone) in
                self.view.removeFromSuperview()
            })
        }
    }
    
    func show(_ viewController: UIViewController) {
        DispatchQueue.main.async {
            self.currentVC = viewController
            self.modalPresentationStyle = .overCurrentContext
            self.modalTransitionStyle = .crossDissolve
            self.currentVC.present(self, animated: true, completion: nil)
        }
    }
    
    func close(_ completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            DispatchQueue.main.async {
                if self.isBeingDismissed || self.isDismissed || self.presentingViewController == nil {
                    completion()
                } else {
                    self.dismiss(animated: true, completion: {
                        completion()
                    })
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
