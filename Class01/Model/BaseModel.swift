//
//  BaseModel.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import Gloss

class BaseModel: NSObject, Decodable {
    
    required init?(json: JSON) {
        super.init()
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            guard let property = child.label else {
                print("deu ruim")
                break
            }
            
            let childReflected = Mirror(reflecting: child.value)
            if childReflected.displayStyle == .Optional {
                print("optional")
                self.setValue((property <~~ json), forKey: property) // Here the error doesn't occurs
            } else {
                print("not optional")
                self.setValue((property <~~ json)!, forKey: property) // Here the error doesn't occurs
            }
            
//            if property == "super" { continue }
//            
//            //            let value = (property <~~ json)!
//            //            <self.valueForKey(property)!.dynamicType>
//            
//            //            let type = self.valueForKey(property)!.dynamicType
//            //            let a = (property <~~ json)! // Here de error occurs
//            
//            print("\(self.dynamicType).\(property)")
//            if Mirror(reflecting: reflect(self.property)).displayStyle == .Optional {
//                print("optional")
//                self.setValue((property <~~ json), forKey: property) // Here the error doesn't occurs
//            } else {
//                print("not optional")
//                self.setValue((property <~~ json)!, forKey: property) // Here the error doesn't occurs
//            }
        }
    }
    
}
