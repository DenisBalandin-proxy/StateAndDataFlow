//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Denis on 2022/12/17.
//

import SwiftUI

class StorageManager: ObservableObject {
    @AppStorage("userName") var userName = ""
    @AppStorage("isRegister") var isRegister = false
}
