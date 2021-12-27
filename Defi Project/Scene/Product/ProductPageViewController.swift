//
//  ProductPageViewController.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/19.
//

import UIKit

class ProductPageViewController: UIPageViewController {
    var viewControllerList: [ProductViewController] = []
    var currentIndex = 0
    var isTopBannerHidden = false
    
    override func viewDidLoad() {
        viewControllerList = [
            ProductViewController.loadFromXib(parent: self, type: .lockUp),
            ProductViewController.loadFromXib(parent: self, type: .singlePool),
            ProductViewController.loadFromXib(parent: self, type: .liquidityPool)
        ]
        self.dataSource = self
        for viewController in viewControllerList {
            viewController.goToSelectedPage = goToSelectedPage
        }
        setViewControllers([viewControllerList[0]], direction: .forward, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let viewControllers = viewControllers else { return }
        for vc in viewControllers {
            guard let vc = vc as? ProductViewController else { return }
            vc.showTopBanner()
        }
    }
    
    func goToSelectedPage(selectedIndex: Int) {
        if selectedIndex == currentIndex {
            return
        }
        setViewControllers([viewControllerList[selectedIndex]], direction: selectedIndex > currentIndex ? .forward : .reverse, animated: true, completion: nil)
        currentIndex = selectedIndex
    }
}
