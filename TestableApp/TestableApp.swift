//
//  TestableAppApp.swift
//  TestableApp
//
//  Created by Viktor Kushnerov on 24.12.21.
//

import SwiftUI
import Resolver

@main
struct TestableApp: App {
    init() {
        Resolver.register {
            NewsService.initLoader()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
