//
//  MyPageViewController.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/18.
//

import UIKit

class MyPageViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        topView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
    }
    
   
}
