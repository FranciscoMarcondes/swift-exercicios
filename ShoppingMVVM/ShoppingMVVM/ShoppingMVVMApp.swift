//
//  ShoppingMVVMApp.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import SwiftUI
import SwiftData

@main
struct ShoppingMVVMApp: App {
    @StateObject private var shopViewModel = ShopViewModel(repository: ProductRepository())
        @StateObject private var cartViewModel = CartViewModel()

        var body: some Scene {
            WindowGroup {
                MainTabView(
                    shopViewModel: shopViewModel,
                    cartViewModel: cartViewModel
                )
            }
        }
    }
