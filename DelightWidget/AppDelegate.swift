//
//  AppDelegate.swift
//  DelightWidget
//
//  Created by smis on 2020/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        guard let navigationController = self.window?.rootViewController as? UINavigationController,
              let mainViewController = navigationController.viewControllers.first(where: { $0 is MainViewController}) else { return false }
        let emojiDetails = EmojiProvider.all().first(where: { $0.url == url })
        mainViewController.performSegue(withIdentifier: "toDetail", sender: emojiDetails)
        
        return true
    }

}

