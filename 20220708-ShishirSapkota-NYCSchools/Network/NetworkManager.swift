//
//  NetworkManager.swift
//  20220708-ShishirSapkota-NYCSchools
//
//  Created by shishir sapkota on 7/8/22.
//

import Foundation

// This is the only place from where all request are handled. Its shared instance is shared across the app via ApiServiceType
final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    // all request goes from here.
     func `request`<T: Decodable>(
        _ url: URL,
        method: EndPoint.Methods = .get,
        params: [String: Any]?,
        header: [String:String]? = nil,
        success: @escaping (T) -> (),
        failure: @escaping (Error) -> ()
        ) {
        /*
           This does not check the status active internet connection.
           in real production app we could use something like Reachibility or if
           the app already has or can use alamofire then alamofire provide
           NetworkReachabilityManager().isReachable. we can wrap the following block
           like if(reachable) else {error}
           I did not used alamofire since try to make it a standalone app without any pod
        */
            do {
                URLSession.shared.dataTask(with: try request(for: params, url: url)) { (data, response, error) in
                    if let error = error {
                        let error = self.makeError(message: error.localizedDescription, code: (error as NSError).code)
                        failure(error)
                    }
                    guard let json = data else {print("No data");return}
                    print(String(decoding: json, as: UTF8.self))
                    do {
                       let value =  try JSONDecoder().decode(T.self, from: json)
                        success(value)
                    } catch (let error ){
                        print("Could not parse and decode json: \(error.localizedDescription)")
                    }
                }.resume()
            } catch let error {
               let error = makeError(message: error.localizedDescription, code: 555)
                failure(error)
            }
    }
    
   private func request(for params: [String: Any]?, url: URL, method: EndPoint.Methods = .get) throws -> URLRequest {
        var request = URLRequest(url:url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let params = params {
            let requestBody = try JSONSerialization.data(withJSONObject: params , options: .prettyPrinted)
            request.httpBody = requestBody
        }
        return request
    }
    
    private func makeError(message: String, code: Int) -> Error {
      let errorInfo: [String: Any]? = [NSLocalizedDescriptionKey: message]
      return NSError.init(domain: "Network", code: code, userInfo: errorInfo)
    }
    
}




