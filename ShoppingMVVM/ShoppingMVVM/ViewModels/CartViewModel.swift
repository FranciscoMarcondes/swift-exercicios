//
//  CartViewModel.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import Foundation
internal import Combine

final class CartViewModel: ObservableObject {
    
    // Dicionario [produto: quantidade] para acesso rapido.
    @Published private var quantitiesByProduct: [Product: Int] = [:]

    var items: [CartItem] {
        quantitiesByProduct
            .map { CartItem(product: $0.key, quantity: $0.value) } // Converte para lista da tela.
            .sorted { $0.product.name < $1.product.name }          // Ordena por nome.
    }

    var totalAmount: Decimal {
        items.reduce(Decimal.zero) { partial, item in
            partial + item.subtotal // Soma todos os subtotais.
        }
    }

    var totalItems: Int {
        quantitiesByProduct.values.reduce(0, +) // Soma todas as quantidades.
    }

    func add(_ product: Product) {
        quantitiesByProduct[product, default: 0] += 1 // Adiciona 1 unidade.
    }

    func removeOne(_ product: Product) {
        guard let currentQuantity = quantitiesByProduct[product] else { return }

        if currentQuantity <= 1 {
            quantitiesByProduct.removeValue(forKey: product) // Remove item se zerar.
        } else {
            quantitiesByProduct[product] = currentQuantity - 1 // Diminui 1 unidade.
        }
    }

    func removeAll(_ product: Product) {
        quantitiesByProduct.removeValue(forKey: product) // Remove completamente.
    }

    func quantity(for product: Product) -> Int {
        quantitiesByProduct[product, default: 0] // Retorna qtde para mostrar na tela.
    }
}
