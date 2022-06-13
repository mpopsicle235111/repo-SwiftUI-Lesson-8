//
//  GroupsAPI.swift
//  Swift-UI-Hometask-2.0
//
//  Created by Anton Lebedev on 19.05.2022.
//

import Foundation
import Alamofire
import SwiftUI

//This is VK API's request structure
//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

protocol GroupsService {
    func getGroups(completion: @escaping ([GroupAPI])->())
}

class GroupsAPI: GroupsService {
    
    let baseUrl = "https://api.vk.com/method"
    let userId = Session.shared.userId
    let accessToken = Session.shared.token
    let version = "5.131"
    let fields = "decription"
    let extended = "1"
    
    func getGroups(completion: @escaping([GroupAPI])->()) {
        
        let path = "/groups.get"
        let url = baseUrl + path
        
        //Params is a dictionary
        let groupParams: [String: String] = [
            "used_id": userId,
            "access_token": accessToken,
            "extended" : "1", //This is the key parameter: it returns
                        //data on images and names
                 
            "v": version
        ]
        //We send a request to server using Alamofire
        AF.request(url, method: .get, parameters: groupParams).responseJSON { response in
            
            // print(response.result)
            print(response.data?.prettyJSON)
            guard let jsonData = response.data else { return }
            
            //MARK: THIS IS MANUAL PARSING
            do {
                let jsonContainer: Any = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                
                //Force unwrap here is on purpose
                //so we can better track errors
                let jsonObject = jsonContainer as! [String: Any]
                let response = jsonObject["response"] as! [String: Any]
                let items = response["items"] as! [Any]
                
                let groupsAPI = items.map { GroupAPI(item: $0 as! [String: Any])}
                completion(groupsAPI)
            } catch {
                print(error)
            }
        }
    }
}
