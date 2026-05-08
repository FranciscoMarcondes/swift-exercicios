//
//  ProductRowView.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import SwiftUI

// Linha visual de um produto com botao de adicionar.
struct ProductRowView: View {
    let product: Product
    let quantityInCart: Int
    let onAdd: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                Text(product.price.brl)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(spacing: 6) {
                Button("Adicionar") {
                    onAdd()
                }
                .buttonStyle(.borderedProminent)

                if quantityInCart > 0 {
                    Text("No carrinho: \(quantityInCart)")
                        .font(.caption)
                        .foregroundStyle(.green)
                }
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    let produto = Product(
        id: UUID(),
        name: "Fone Bluetooth",
        price: 249.90,
        category: .electronics
    )
    return ProductRowView(
        product: produto,
        quantityInCart: 2,
        onAdd: {}
    )
    .padding()
}
