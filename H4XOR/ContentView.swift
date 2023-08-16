//
//  ContentView.swift
//  H4XOR
//
//  Created by MacOS on 14.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }.navigationTitle("H4XOR NEWS")
        }.onAppear{
            self.networkManager.fecthData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}

struct Posts: Identifiable{
    let id: String
    let title: String
}

let posts = [
Posts(id: "1", title: "test1"),
Posts(id: "2", title: "test2"),
Posts(id: "3", title: "test3")]
