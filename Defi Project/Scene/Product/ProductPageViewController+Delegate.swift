//
//  ProductPageViewController+Delegate.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/19.
//

import UIKit

extension ProductPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ProductViewController else { return nil }
        if viewController.productType == .liquidityPool {
            currentIndex = 1
        } else if viewController.productType == .singlePool {
            currentIndex = 0
        } else {
            return nil
        }
        return viewControllerList[currentIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ProductViewController else { return nil }
        if viewController.productType == .lockUp {
            currentIndex = 1
        } else if viewController.productType == .singlePool {
            currentIndex = 2
        } else {
            return nil
        }
        return viewControllerList[currentIndex]
    }
}
