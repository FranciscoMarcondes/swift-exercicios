//
//  Persistence.swift
//  GestorDespesas
//
//  Created by Francisco Marcondes da Silva Junior on 15/05/26.
//

import CoreData

struct PersistenceController {
    
    // Instância compartilhada — padrão Singleton.
    // Em Java seria algo como: public static final EntityManager em = ...
    static let shared = PersistenceController()
    
    // O "container" é o responsável por conectar tudo:
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        
        // Referencia a minha base de dados
        container = NSPersistentContainer(name: "GestorDespesas")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        // Carrega o banco. Se der erro, o app não pode continuar.
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Erro ao carregar Core Data: \(error), \(error.userInfo)")
            }
        }
        // refletidas nas views do SwiftUI — similar ao Observer pattern.
        container.viewContext.automaticallyMergesChangesFromParent = true
        
    } // fechamento da primeira chave
}
