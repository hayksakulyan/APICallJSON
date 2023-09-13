//
//  NetworkService.swift
//  APICallJSON
//
//  Created by Hayk Sakulyan on 11.09.23.
//

import Foundation

class NetworkService: ObservableObject {
    
    let baseURL = "https://jsonplaceholder.typicode.com/posts"
    
     func getPost(completion: @escaping([ResponseModel]) -> ()) {
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let error = error {
                print("Error \(error.localizedDescription)")
                return
            }
            
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                print("Invalid response")
//                return
//            }
            if let data = data {
                //                do {
                //                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                //                    if let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                //                        if let jsonString = String(data: jsonData, encoding: .utf8) {
                //                            print("Response JSON:\n\(jsonString)")
                //                        }
                //                    }
                //                } catch {
                //                    print("Error parsing JSON: \(error)")
                //                }
                let posts = try! JSONDecoder().decode([ResponseModel].self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
                
            }
        }
        .resume()   
    }
}
