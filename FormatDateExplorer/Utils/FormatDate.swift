//
//  FormatDate.swift
//  FormatDateExplorer
//
//  Created by Kennedy Karimi on 27/03/2025.
//

import Foundation

struct FormatDate {
    
    let systemDateFormatter: DateFormatter = { //anonymous closure pattern
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    let customDateFormatter: DateFormatter = { //anonymous closure pattern
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy 'at' HH:mm" //The 'at' has to be in quotes since it's not part of the date field symbol table(https://www.unicode.org/reports/tr35/tr35-dates.html#Date_Field_Symbol_Table). Other formats e.g. E, dd MMM yyyy HH:mm:ss z which translates to Tue, 11 Apr 2021 08:37:01 GMT+3.
        return formatter
    }()
    
    let customDateOnlyFormatter: DateFormatter = { //anonymous closure pattern
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
    
    let customTimeOnlyFormatter: DateFormatter = { //anonymous closure pattern
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    func formatDateLocally(date: Date, timestamp: Int64) -> [String: Any] {
        /**
         * timeIntervalSince1970 takes a TimeInterval() which is a Double as input. Since timestamp is of type Int64, it is implicitly converted by TimeInterval into a Double.
         */
        let date_from_stamp: Date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        
        //formatting date
        //let date_only: String = customDateOnlyFormatter.string(from: date)
        //let time_only: String = customTimeOnlyFormatter.string(from: date)
        
        //formatting timestamp converted into a date
        let date_only: String = customDateOnlyFormatter.string(from: date_from_stamp)
        let time_only: String = customTimeOnlyFormatter.string(from: date_from_stamp)
        
        let date_time: String = "\(date_only) at \(time_only)"
        
        let results: [String: Any] = ["date_only": date_only, "time_only": time_only, "date_time": date_time]
        
        return results
    }
}

extension Date {
    
    var date_time: String {
        return "nothing"
    }
}
