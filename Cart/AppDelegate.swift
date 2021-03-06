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
        let cartStore = Memory<[UUID: Memory<[String:String]>]>(value: [:])
        let productStore = Memory<[UUID: Memory<[String:String]>]>(
            value: [
                UUID() : Memory(
                    value: [
                        "name": "Peas",
                        "unit": "bag",
                        "amount": "0.95"
                    ]
                ),
                UUID() : Memory(
                    value: [
                        "name": "Eggs",
                        "unit": "dozen",
                        "amount": "2.10"
                    ]),
                UUID() : Memory(
                    value: [
                        "name": "Milk",
                        "unit": "bottle",
                        "amount": "1.30"
                    ]),
                UUID() : Memory(
                    value: [
                        "name": "Beans",
                        "unit": "can",
                        "amount": "0.73"
                    ])
            ]
        )
        window = UIWindow()
        window?.rootViewController = UINavigationController(
            rootViewController: CartViewController(
                cartItems: InMemoryCart(
                    items: cartStore,
                    item: { (uuid) -> (CartItem) in
                        return InMemoryCartItem(
                            key: uuid,
                            items: cartStore,
                            productClosure: {(uuid) -> (Product) in
                                return InMemoryProduct(
                                    uuid: uuid,
                                    products: productStore
                                )
                        }
                        )
                }
                ),
                products: InMemoryProducts(
                    products: productStore,
                    product: { (uuid) -> (Product) in
                        return InMemoryProduct(
                            uuid: uuid,
                            products: productStore
                        )
                }
                ),
                currencies: JSONRatesCurrencies()
            )
        )
        window?.makeKeyAndVisible()
        return true
    }

}

