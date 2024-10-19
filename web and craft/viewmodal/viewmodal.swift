//
//  viewmodal.swift
//  web and craft
//
//  Created by Ann Antony on 19/10/24.
//

import Foundation

class viewModel {
    
    var urlStr : String = "https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo"
    
    func fetchWebApiData(completion: @escaping ( _ _response : [WebAPIResponse]) -> Void) {
        let urlString = urlStr
        guard let url = URL(string: urlString) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode([WebAPIResponse].self, from: data)
                DispatchQueue.main.async {
                    
                    completion(apiResponse)
                    
                }
            } catch {
                print("Error decoding data:", error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
