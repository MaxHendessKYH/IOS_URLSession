//
//  ContentView.swift
//  urlSession
//
//  Created by Max.Hendess on 2024-02-19.
//

import SwiftUI

struct ContentView: View {
   
    
    var body: some View {
        VStack {
            Button("CALL API"){
                getPost()
            }
        }
        .padding()
    }
}
func getPost(){
    let apiUrl = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    let session = URLSession.shared
    
    let task = session.dataTask(with:apiUrl){
        data, response, error in
        
        if let error{
            print("ERROR \(error.localizedDescription))")
            return
        }
        
        guard let jsonData = data else { print("ERROR NO DATA FOUND")
            return
        }
        
        do{
            let posts = try JSONDecoder().decode([Post].self, from: jsonData)
            for post in posts{
                print("TITLE: \(post.title) BODY: \(post.body)")
            }
        }catch{
            print("Error decoding json")
        }
    }
    
    task.resume()
}
#Preview {
    ContentView()
}
