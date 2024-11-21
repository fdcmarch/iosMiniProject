//
//  CustomTabbarController.swift
//  iOSTrainingProject
//
//  Created by FDC-CrisMarch on 11/18/24.
//

import Foundation
import UIKit
class CustomTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
    configureViewControllers()
  }
  private func setupTabBar() {
    // Customize your tab bar appearance here (optional)
    tabBar.tintColor = .systemBlue
    tabBar.unselectedItemTintColor = .gray
    tabBar.backgroundColor = .white
    tabBar.isTranslucent = false
  }
  private func configureViewControllers() {
      let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")

    let vc2 = FavoriteTutorViewController()
    let vc3 = TextbookViewController()
    let vc4 = LearningViewController()
    let vc5 = MyPageViewController()
      
    // Set titles and images for each tab
    vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
    vc2.tabBarItem = UITabBarItem(title: "Favorite Tutor", image: UIImage(systemName: "heart"), tag: 0)
    vc3.tabBarItem = UITabBarItem(title: "Textbook", image: UIImage(systemName: "book.pages.fill"), tag: 0)
    vc4.tabBarItem = UITabBarItem(title: "Learning", image: UIImage(systemName: "pencil"), tag: 0)
    vc5.tabBarItem = UITabBarItem(title: "My Page", image: UIImage(systemName: "person"), tag: 1)
      
      
    // Embed each view controller in a UINavigationController (optional)
    let nav1 = UINavigationController(rootViewController: vc1)
    let nav2 = UINavigationController(rootViewController: vc2)
    let nav3 = UINavigationController(rootViewController: vc3)
    let nav4 = UINavigationController(rootViewController: vc4)
    let nav5 = UINavigationController(rootViewController: vc5)
    // Add the view controllers to the tab bar controller
    viewControllers = [nav1, nav2, nav3, nav4, nav5]
  }
}
