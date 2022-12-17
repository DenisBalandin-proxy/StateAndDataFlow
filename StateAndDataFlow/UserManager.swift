//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import Foundation

class UserManager: ObservableObject {
    private let storageManager = StorageManager()
    @Published var isRegister = StorageManager().isRegister
    var name = StorageManager().userName
    
    func save() {
        storageManager.isRegister = isRegister
        storageManager.userName = name
    }
}
