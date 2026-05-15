//
//  GestorDespesasApp.swift
//  GestorDespesas
//
//  Created by Francisco Marcondes da Silva Junior on 15/05/26.
//

import SwiftUI
import CoreData

@main
struct GestorDespesasApp: App {
   
    //Aqui criamos a injeçao de dependencia
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            // Injeta o contexto do Core Data no ambiente do SwiftUI.
                           // Qualquer view filha pode acessá-lo com @Environment.
                .environment(\.managedObjectContext ,persistenceController.container.viewContext)
        }
    }
}
