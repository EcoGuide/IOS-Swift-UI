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
    func fetchHotels(completion: @escaping(Result<FetchHotelsResponse?, Error>) -> Void) {
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
                    let parsedData = try JSONDecoder().decode(FetchHotelsResponse.self, from: responseData)
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
    func fetchChambresForHotel(hotelId: String, completion: @escaping (Swift.Result<fetchChambre, AFError>) -> Void) {
        let chambresUrl = Network.fetchChambresForHotelUrl(hotelId: hotelId)
        
        AF.request(chambresUrl, method: .get, encoding: JSONEncoding.default)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: fetchChambre.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

}

