//
//  ContentView.swift
//  APICallJSON
//
//  Created by Hayk Sakulyan on 11.09.23.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [ResponseModel] = []
    
    
    var body: some View {
        
        NavigationStack {
            List(posts) { post in
                
                VStack {
                    Text("\(post.title)")
                    Text("\(post.body)")
                }
                
            }
            .onAppear() {
                NetworkService().getPost { (posts) in
                    self.posts = posts
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 
