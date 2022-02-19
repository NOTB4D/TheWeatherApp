//
//  NetworkService.swift
//  TheWeatherApp
//
//  Created by Eser Kucuker on 19.02.2022.
//

import Foundation


class NetworkService: NetworkServiceProtocol {
    
    private let apiKey = "48457c9c3e30f6ce6adbeb8310abd454"
    private let baseUrl = "api.openweathermap.org/data/2.5/"
    
    
    func get<T: Decodable>(from endpoint: String, completion: @escaping (T? , NetworkError?)-> Void ){
        guard let url = URL(string: baseUrl + endpoint + apiKey )  else {
            completion(nil, NetworkError.invalitUrl)
            return }
        
        createDataTask(from: url, completion: completion).resume()
    }
   private func createDataTask<T: Decodable>(from url: URL, completion: @escaping (T? , NetworkError?)-> Void ) -> URLSessionDataTask{
        return  URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard error != nil else {
                completion(nil, NetworkError.custom(error?.localizedDescription))
                return
            }
            
            guard let data = data else{
                completion(nil, NetworkError.noData)
                return
            }
            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                
                completion (decodedData , nil )
                
            }catch {
                completion(nil, NetworkError.custom(error.localizedDescription))
            }
        }
    }
}
