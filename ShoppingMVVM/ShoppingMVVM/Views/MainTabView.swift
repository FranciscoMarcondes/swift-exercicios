//
//  MainTabView.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var shopViewModel: ShopViewModel
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        TabView {
            NavigationStack {
                CategoryProductsView(
                    category: .electronics,
                    shopViewModel: shopViewModel,
                    cartViewModel: cartViewModel
                )
            }
            .tabItem {
                Label("Eletronicos", systemImage: "iphone")
            }

            NavigationStack {
                CategoryProductsView(
                    category: .clothing,
                    shopViewModel: shopViewModel,
                    cartViewModel: cartViewModel
                )
            }
            .tabItem {
                Label("Roupas", systemImage: "tshirt")
            }

            NavigationStack {
                CategoryProductsView(
                    category: .home,
                    shopViewModel: shopViewModel,
                    cartViewModel: cartViewModel
                )
            }
            .tabItem {
                Label("Casa", systemImage: "house")
            }

            NavigationStack {
                CartView(cartViewModel: cartViewModel)
            }
            .tabItem {
                Label("Carrinho", systemImage: "cart")
            }
            .badge(cartViewModel.totalItems)
        }
    }
}

#Preview {
    MainTabView(
        shopViewModel: ShopViewModel(repository: ProductRepository()),
        cartViewModel: CartViewModel()
    )
}
