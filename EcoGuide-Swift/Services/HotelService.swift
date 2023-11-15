//
//  HotelService.swift
//  EcoGuide-Swift
//
//  Created by chaabani achref on 15/11/2023.
//

import Foundation
import SwiftUI
import Alamofire

struct HotelService {
    func fetchHotels(completion: @escaping(Result<fetchHotelsResponse?, Error>) -> Void) {
        AF.request("\(Network.fetchHotelsUrl)",
                   method: .get,
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                print(responseData)
                do {
                    let parsedData = try JSONDecoder().decode(fetchHotelsResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.hotels)
                } catch {
                    print(error)
                    completion(.failure(error))
                }
                
            case let .failure(err):
                debugPrint(err)
                completion(.failure(err))
            }
        }
    }
    
}

