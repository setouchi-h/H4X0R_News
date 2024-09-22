//
//  ContentView.swift
//  H4X0R News
//
//  Created by 橋本一輝 on 2024/09/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post._highlightResult.url?.value)) {
                    HStack {
                        Text(String(post.points))
                        Text(post._highlightResult.title.value) // _highlightResult.title.value から取得
                            .lineLimit(2) // 長いタイトルに対応するため、2行に制限
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchNews()
        }
    }
}

#Preview {
    ContentView()
}
