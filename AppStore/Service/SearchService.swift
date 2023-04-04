//
//  SearchService.swift
//  AppStore
//
//  Created by hakkı can şengönül on 1.04.2023.
//

import Foundation
import Alamofire
struct SearchService {
    static func fetchData(searchtext term: String,completion: @escaping([Result])->Void){
        let baseUrl = "https://itunes.apple.com/search"
        let parameters = ["entity":"software" ,"term":term]
        AF.request(baseUrl,method: .get,parameters: parameters).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else { return }
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
                
            }catch let error{
                print(error.localizedDescription)
            }
            
        }
    }
    static func fetchDataID(id: String,completion: @escaping([Result])->Void){
        let baseUrl = "https://itunes.apple.com/lookup"
        let parameters = ["id":id]
        AF.request(baseUrl,method: .get,parameters: parameters).responseData { responseData in
            if let error = responseData.error{
                print(error.localizedDescription)
                return
            }
            guard let data = responseData.data else { return }
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
                
            }catch let error{
                print(error.localizedDescription)
            }
            
        }
    }

}
