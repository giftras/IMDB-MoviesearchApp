//
//  ListInfo.swift
//  MSSearch
//
//  Created by Macbook Pro on 2/10/2560 BE.
//  Copyright © 2560 Student. All rights reserved.
//

import UIKit
import Alamofire
class ListInfo{
    //get method to be public variable
    var _title: String!
    var _id: String!
    var _year: String!
    var _poster: String!
    var _type: String!

var title: String{
    if (_title == nil){
        _title = ""
    }
    return _title
}
    var id: String{
        if (_id == nil){
            _id = ""
        }
        return _id
    }
    var year: String{
        if (_year == nil){
            _year = ""
        }
        return _year
    }
    var poster: String{
        if (_poster == nil){
            _poster = ""
        }
        return _poster
    }
    var type: String{
        if (_type == nil){
            _type = ""
        }
        return _type
    }
    //constructor
    init(movieDict: Dictionary<String, AnyObject>) {
        if let name = movieDict["Title"] as? String {
            self._title = name
            print(name)
        }
        if let id = movieDict["imdbID"] as?
            String {
            self._id = id
        }
        if let year = movieDict["Year"] as?
            String {
            self._year = year
        }
        if let poster = movieDict["Poster"] as?
            String {
            self._poster = poster
        }
        if let type = movieDict["Type"] as?
            String {
            self._type = type
        }
//        if let poster = movieDict["Poster"] as? String {
//            //display image here
//        }
    
    }
}
