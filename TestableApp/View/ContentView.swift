//
//  ContentView.swift
//  TestableApp
//
//  Created by Viktor Kushnerov on 24.12.21.
//

import SwiftUI
import Resolver

struct ContentView: View {
    @StateObject var service = NewsService()

    var body: some View {
        VStack {
            ForEach(service.news, id: \.id) { item in
                Text("\(item.title)")
            }
        }
        .onAppear {
            Task {
                do {
                    try await service.fetchAllNews()
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Resolver.register {
            NewsService.mockLoader() //the app isn't running in canvas preview
//            NewsService.initLoader() //the app is running in canvas preview
        }
        
        return ContentView()
    }
}
