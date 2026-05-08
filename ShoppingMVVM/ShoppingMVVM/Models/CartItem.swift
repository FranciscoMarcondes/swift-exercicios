//
//  CartItem.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import Foundation

struct CartItem: Identifiable {
    
    let product: Product //produto associado
    var quantity: Int    // quantidade
    var id: UUID { product.id }  // reaproveito o id do produto
    var subtotal: Decimal {
        product.price * Decimal(quantity) // preço x quantidade
    }
}
