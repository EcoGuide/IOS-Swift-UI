//
//  Reset_password .swift
//  EcoGuide-Swift
//
//  Created by ben romdhane fedi on 2023-11-10.
//

import Foundation
class Reset_password {
    
    
//    
//    if let valeur = UserDefaults.standard.string(forKey: "tokenverificationcodesms") {
//        print(valeur)
//    }

    func Reset_PWD(email: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://192.168.1.129:3000/reset-password") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let parameters: [String: Any] = [
            "email": email,
         ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                  let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let token = json["Token"] as? String {
                            
                            // Ici, nous décodons le token juste après l'avoir récupéré
                            if let payload = self.decodeJWT(token: token) {
                                print(payload)
//                                completion(.success(payload))
                            } else {
                                completion(.failure(URLError(.cannotDecodeContentData)))
                            }
                            
                        } else {
                            completion(.failure(URLError(.cannotParseResponse)))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }

                task.resume()
            }
//__________________________________CONFIG TOKEN SEND IN RESPONSE________________________________
    func removeBearerPrefix(from token: String) -> String {
        let bearerPrefix = "Bearer "
        if token.hasPrefix(bearerPrefix) {
            return String(token.dropFirst(bearerPrefix.count))
        }
        return token
    }
    
    func decodeJWT(token: String) -> [String: Any]? {
        let segments = token.components(separatedBy: ".")
        guard segments.count == 3 else {
            return nil
        }

        var base64String = segments[1]
        if base64String.count % 4 != 0 {
            let padlen = 4 - base64String.count % 4
            base64String += String(repeating: "=", count: padlen)
        }

        guard let data = Data(base64Encoded: base64String) else {
            return nil
        }

        let payload = try? JSONSerialization.jsonObject(with: data, options: [])
        return payload as? [String: Any]
    }
    
//        if let valeur = UserDefaults.standard.string(forKey: "tokenverificationcodesms") {

//    __________________________
    
    
    
    
    
    
    

}
