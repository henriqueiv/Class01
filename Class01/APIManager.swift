//
//  APIManager.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import Alamofire
import Gloss

class APIManager {
    
    // MARK: Typealiases
    typealias HVDataReturnBlock = ((Bool, String, Trainer?) -> Void)
    
    // MARK: Static consts
    static let sharedInstance = APIManager()
    static let endpoint = "http://server03.local:60080/login/"
    
    // MARK: Public methods
    func login(user: String, password: String, withBlock block: HVDataReturnBlock) {
        let requestURL = APIManager.endpoint
        let parameter = ["user":user, "password":password]
        Alamofire.request(.GET, requestURL, parameters: parameter)
            .responseJSON {[unowned self] (response:Response<AnyObject, NSError>) in
                switch response.result {
                case .Success(let json as JSON):
                    self.parseApiReturn(json, withBlock: block)
                    
                case .Failure(let error):
                    block(false, error.localizedDescription, nil)
                    
                default:
                    block(false, "Unexpected result!", nil)
                    
                }
        }
    }
    
    // MARK: Private helpers
    private func parseApiReturn(json: JSON, withBlock block: HVDataReturnBlock) {
        let response = ((json["response"] as! String) == "true")
        let message = json["message"] as! String
        
        var trainer:Trainer?
        if let data = json["data"] as? JSON {
            trainer = Trainer(json: data)
        }
        
        block(response, message, trainer)
    }
    
}