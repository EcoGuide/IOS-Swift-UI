//
//  GuideService.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 13/11/2023.
//

import Foundation
import Alamofire
import SwiftUI

struct Guideservice {
    
    func fetchGuides(completion: @escaping(Result<fetchGuidesResponse?, Error>) -> Void) {
        AF.request("\(Network.fetchGuideUrl)",
                   method: .get,
                   encoding: JSONEncoding.default)
        .validate(contentType: ["application/json"])
        .responseData { res in
            switch res.result {
                
            case .success:
                let responseData = Data(res.data!)
                print(responseData)
                do {
                    let parsedData = try JSONDecoder().decode(fetchGuidesResponse.self, from: responseData)
                    completion(.success(parsedData))
                    print(parsedData.message)
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
    
    func fetchGuideReservations(guideId: String, completion: @escaping(Result<FetchGuideReservationsResponse?, Error>) -> Void) {
           AF.request(Network.fetchGuideReservationsUrl(guideId: guideId),
                      method: .get,
                      encoding: JSONEncoding.default)
               .validate(contentType: ["application/json"])
               .responseData { res in
                   switch res.result {
                       
                   case .success:
                       let responseData = Data(res.data!)
                       print(responseData)
                       do {
                           let parsedData = try JSONDecoder().decode(FetchGuideReservationsResponse.self, from: responseData)
                           print(parsedData)
                           completion(.success(parsedData))
                           print(parsedData.message)
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

    func addGuideReservation(guideId: String, userId: String, hoursBooked: Int, location: String, completion: @escaping(Result<ReservationGuide?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "guideId": guideId,
            "userId": userId,
            "hoursBooked": hoursBooked,
            "location": location
        ]
        
        print(guideId)

        AF.request(Network.addGuideReservationUrl(guideId: guideId),
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
            .validate(contentType: ["application/json"])
            .responseData { res in
                switch res.result {

                case .success:
                    let responseData = Data(res.data!)
                    do {
                        let parsedData = try JSONDecoder().decode(ReservationGuide.self, from: responseData)
                        completion(.success(parsedData))
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
