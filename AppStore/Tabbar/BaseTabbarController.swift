//
//  BaseTabbarController.swift
//  AppStore
//
//  Created by ericzero on 12/26/22.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
//        viewControllers = [
//            tabbar(viewController: TodayViewController(), title: "Today", imageName: "today_icon"),
//            tabbar(viewController: AppsViewController(), title: "Apps", imageName: "apps"),
//            tabbar(viewController: SearchViewController(), title: "Search", imageName: "search")
//        ]
    }
//    fileprivate func tabbar(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
//
//        let nc = UINavigationController(rootViewController: viewController)
//        nc.navigationBar.prefersLargeTitles = true
//        viewController.navigationItem.title = title
//        //viewController.view.backgroundColor = .systemBackground
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = UIImage(named: imageName)
//        return nc
//    }
    
    func setTabbar() {
        let today = UINavigationController(rootViewController: TodayViewController())
        //today.navigationBar.prefersLargeTitles = true

        let apps = UINavigationController(rootViewController: AppsViewController())
        apps.navigationBar.prefersLargeTitles = true
        apps.navigationItem.title = "Apps"

        let search = UINavigationController(rootViewController: SearchViewController())
        search.navigationBar.prefersLargeTitles = true
        
        today.tabBarItem.image = UIImage(named: "today_icon")
        apps.tabBarItem.image = UIImage(named: "apps")
        search.tabBarItem.image = UIImage(named: "search")
        
        today.tabBarItem.title = "Today"
        apps.tabBarItem.title = "Apps"
        search.tabBarItem.title = "Search"
        
        tabBar.tintColor = .label
        
        setViewControllers([today, apps, search], animated: true)
    }

}
