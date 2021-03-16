//
//  WebService.swift
//  Exchange Rates
//
//  Created by Jonathan Ng on 16/03/2021.
//

import Foundation
import Alamofire

class WebService: ObservableObject {
    var url =  "https://api.exchangeratesapi.io/latest"
    let json4Swift = [Json4Swift_Base]()
    
    
    func getRates() {
        let decoder = JSONDecoder()
        AF.request(url, method: .get, parameters: .none).responseDecodable(of: Json4Swift_Base.self, decoder: decoder){ response in
            switch response.result{
            case .success(let val):
                let json4Swift = val
                print(json4Swift)
            case .failure(let err):
                print(err)
            }
        }
    }
}
