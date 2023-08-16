//
//  DetailView.swift
//  H4XOR
//
//  Created by MacOS on 14.08.2023.
//

import SwiftUI
import WebKit

struct DetailView: View {
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct WebView: UIViewRepresentable{
    
    let urlString: String?
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString{
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
}
