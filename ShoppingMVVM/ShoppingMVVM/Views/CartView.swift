//
//  CartView.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import SwiftUI
struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        VStack {
            if cartViewModel.items.isEmpty {
                ContentUnavailableView(
                    "Carrinho vazio",
                    systemImage: "cart",
                    description: Text("Adicione produtos nas secoes da loja.")
                )
            } else {
                List {
                    ForEach(cartViewModel.items) { item in
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(item.product.name)
                                    .font(.headline)
                                Text("Quantidade: \(item.quantity)")
                                    .font(.subheadline)
                                Text("Subtotal: \(item.subtotal.brl)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            VStack(spacing: 8) {
                                Button {
                                    cartViewModel.add(item.product)
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                }

                                Button {
                                    cartViewModel.removeOne(item.product)
                                } label: {
                                    Image(systemName: "minus.circle.fill")
                                }

                                Button("Remover") {
                                    cartViewModel.removeAll(item.product)
                                }
                                .font(.caption)
                                .foregroundStyle(.red)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.vertical, 4)
                    }
                }

                HStack {
                    Text("Total de itens: \(cartViewModel.totalItems)")
                    Spacer()
                    Text("Total: \(cartViewModel.totalAmount.brl)")
                        .font(.headline)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
            }
        }
        .navigationTitle("Carrinho")
    }
}

#Preview("Carrinho vazio") {
    NavigationStack {
        CartView(cartViewModel: CartViewModel())
    }
}

#Preview("Carrinho com itens") {
    let cartVM = CartViewModel()
    let repo = ProductRepository()
    repo.fetchProducts().prefix(2).forEach { cartVM.add($0) }
    return NavigationStack {
        CartView(cartViewModel: cartVM)
    }
}
