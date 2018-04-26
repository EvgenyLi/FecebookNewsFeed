//
//  CustomTabBarController.swift
//  Facebook News Feed
//
//  Created by Евгений Липадат on 23.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let feedNavController = UINavigationController(rootViewController: feedController)
        feedNavController.title = "News Feed"
        feedNavController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
        let friendsController = FriendRequestsController()
        let friendsNavController = UINavigationController(rootViewController: friendsController)
        friendsNavController.title = "Friend Request"
        friendsNavController.tabBarItem.image = UIImage(named: "requests_icon")
        
        let messengerVC = UIViewController()
        let messengerNavigationController = UINavigationController(rootViewController: messengerVC)
        messengerNavigationController.title = "Messenger"
        messengerNavigationController.tabBarItem.image = UIImage(named: "messenger_icon")
        
        let notificationsNavController = UINavigationController(rootViewController: UIViewController())
        notificationsNavController.title = "Notifications"
        notificationsNavController.tabBarItem.image = UIImage(named: "globe_icon")
        
        let moreNavController = UINavigationController(rootViewController: UIViewController())
        moreNavController.title = "More"
        moreNavController.tabBarItem.image = UIImage(named: "more_icon")
        
        viewControllers = [feedNavController,friendsNavController,messengerNavigationController,notificationsNavController,moreNavController]
        
        tabBar.isTranslucent = false
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1).cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }


    



}
