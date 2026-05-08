//
//  ShopViewModel.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import Foundation
internal import Combine

final class ShopViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = [] // Lista observavel pelas Views.

    private let repository: ProductRepository // Dependencia da camada de dados.
    
    init(repository: ProductRepository) {
           self.repository = repository
           loadProducts() // Carrega na inicializacao.
       }
    
    func loadProducts(){
        products = repository.fetchProducts()
    }
    
    func products(for category: ProductCategory) -> [Product] {
        products.filter { $0.category == category }
    }
    
}
