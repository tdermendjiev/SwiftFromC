//
//  SwiftClass.swift
//  SwiftFromC
//
//  Created by Dermendzhiev, Teodor on 27.05.22.
//

import Foundation

func helloWorld(param: Double) -> Int {
    helloInt(param: 1234)
    return Int(param)
}

func helloInt(param: Int) {
    print(param)
}
