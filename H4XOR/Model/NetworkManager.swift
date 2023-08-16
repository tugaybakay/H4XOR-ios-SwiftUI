//
//  NetworkManager.swift
//  H4XOR
//
//  Created by MacOS on 14.08.2023.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    
    func fecthData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data,urlResponse,error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let result = try decoder.decode(Result.self, from: safeData)
                            self.posts = result.hits
                        }catch{
                            print("error!")
                        }
                    }
                }else{
                    print(error!.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
}
