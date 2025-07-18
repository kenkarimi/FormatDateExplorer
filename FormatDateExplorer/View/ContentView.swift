//
//  ContentView.swift
//  FormatDateExplorer
//
//  Created by Kennedy Karimi on 27/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var date_now = Date.now
    @State private var example_timestamp: Int64 = 1678886400 //A unix timestamp(seconds since 1970 NOT milliseconds) of 10 digits.
    @State private var date_only: String = ""
    @State private var time_only: String = ""
    @State private var date_time: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Original Date:")
                    .font(Font.system(size: 16, weight: .semibold, design: .monospaced))
                    .foregroundColor(Color.red)
                Text("\(date_now)")
            }
            .padding()
            HStack {
                Text("System Formatter:")
                    .font(Font.system(size: 16, weight: .semibold, design: .monospaced))
                    .foregroundColor(Color.red)
                Text(date_now, formatter: FormatDate().systemDateFormatter)
            }
            .padding()
            HStack {
                Text("Custom Date Only Formatter:")
                    .font(Font.system(size: 16, weight: .semibold, design: .monospaced))
                    .foregroundColor(Color.red)
                Text(date_now, formatter: FormatDate().customDateOnlyFormatter) //or date_only
                //Text("\(date_only)")
            }
            .padding()
            HStack {
                Text("Custom Time Only Formatter:")
                    .font(Font.system(size: 16, weight: .semibold, design: .monospaced))
                    .foregroundColor(Color.red)
                Text(date_now, formatter: FormatDate().customTimeOnlyFormatter) //or time_only
                //Text("\(time_only)")
            }
            .padding()
            HStack {
                Text("Custom Date Time:")
                    .font(Font.system(size: 16, weight: .semibold, design: .monospaced))
                    .foregroundColor(Color.red)
                Text("\(date_time)")
            }
            .padding()
        } //VStack
        .onAppear {
            let fd = FormatDate()
            let results: [String: Any] = fd.formatDateLocally(date: date_now, timestamp: example_timestamp)
            date_only = results["date_only"] as! String
            time_only = results["time_only"] as! String
            date_time = results["date_time"] as! String
        }
    }
}

#Preview {
    ContentView()
}
