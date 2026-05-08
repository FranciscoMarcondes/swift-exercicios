//
//  ProductRepository.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import Foundation

// Camada de dados simples (mock)
struct ProductRepository {
    func fetchProducts() -> [Product] {
        [
            Product(id: UUID(), name: "iPhone Capinha", price: 89.90, category: .electronics),
            Product(id: UUID(), name: "Fone Bluetooth", price: 249.90, category: .electronics),
            Product(id: UUID(), name: "Camiseta Basica", price: 59.90, category: .clothing),
            Product(id: UUID(), name: "Jaqueta Jeans", price: 199.90, category: .clothing),
            Product(id: UUID(), name: "Luminaria de Mesa", price: 139.90, category: .home),
            Product(id: UUID(), name: "Jogo de Toalhas", price: 79.90, category: .home)
        ]
    }
}
