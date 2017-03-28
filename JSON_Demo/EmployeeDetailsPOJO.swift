//
//  EmployeeDetailsPOJO.swift
//  JSON_Demo
//
//  Created by Ram Mhapasekar on 27/03/17.
//  Copyright © 2017 rammhapasekar. All rights reserved.
//

import Foundation

class EmployeeDetailsPOJO{
    
    var empName:String = ""
    var empJobDescription:String = ""
    var empAge:Int = 0
    
    init(empName:String, empJobDescription:String, empAge:Int){
        
        self.empName = empName
        self.empJobDescription = empJobDescription
        self.empAge = empAge
    }
}
