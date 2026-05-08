//
//  CategoryProductsView.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import SwiftUI
struct CategoryProductsView: View {
    let category: ProductCategory
    @ObservedObject var shopViewModel: ShopViewModel
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        List {
            ForEach(shopViewModel.products(for: category)) { product in
                ProductRowView(
                    product: product,
                    quantityInCart: cartViewModel.quantity(for: product),
                    onAdd: {
                        cartViewModel.add(product)
                    }
                )
            }
        }
        .navigationTitle(category.rawValue)
    }
}

#Preview {
    let shopVM = ShopViewModel(repository: ProductRepository())
    let cartVM = CartViewModel()
    return NavigationStack {
        CategoryProductsView(
            category: .electronics,
            shopViewModel: shopVM,
            cartViewModel: cartVM
        )
    }
}
