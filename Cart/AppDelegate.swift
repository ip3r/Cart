//
//  AppDelegate.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let currencies = JSONRatesCurrencies()
		window = UIWindow()
        window?.rootViewController = UINavigationController(
            rootViewController: CurrenciesViewController(
                currencies: currencies
            )
        )
        window?.makeKeyAndVisible()
        return true
    }

}

