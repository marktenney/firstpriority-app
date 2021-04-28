//
//  FetchData.swift
//  firstpriority
//
//  Created by Mark Tenney on 4/28/21.
//

import Foundation

var urlForFetchingData = "https://yourdomain.church/wp-json/tribe/events/v1/events"

func fetchData(completionHandler:@escaping ([EventsData]) -> Void) {
    var eventDataFetch = [EventsData]()
    
    // code for calling web api and getting the data
    if let urlToServer = URL.init(string: urlForFetchingData)
    {
        let task = URLSession.shared.dataTask(with: urlToServer, completionHandler: { (data, response, error) in
            
            if error != nil || data == nil
            {
                print("An error occured while fetching data from API")
            }
            else
            {
                if let responseText = String.init(data: data!,encoding: .ascii)
                {
                    let jsonData = responseText.data(using: .utf8)!
                    eventDataFetch = try! JSONDecoder().decode([EventsData].self, from: jsonData)
                    completionHandler(eventDataFetch)
                }
            }
        })
        task.resume()
    }
    
    
    completionHandler(eventDataFetch)
}
