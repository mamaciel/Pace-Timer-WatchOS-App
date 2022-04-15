//
//  ContentView.swift
//  Shared
//
//  Created by TSCMac on 4/12/22.
//

import SwiftUI
    

struct ContentView: View {
    @State var timerScreenShown = false
    @State var timeVal = 10
    
    var body: some View {
        VStack{
            Text("Select \(timeVal)s intervals").padding()

            Picker(
                selection: $timeVal,
                label: Text("")){
                    ForEach(10...120, id: \.self) {
                        Text("\($0)")
                    }
                }
            
            NavigationLink(destination: SecondView(timerScreenShown: $timerScreenShown, timeVal: timeVal), isActive: $timerScreenShown, label: {Text("Go")})
            
        }
    }
}

struct SecondView: View{
    @Binding var timerScreenShown:Bool
    @State var timeVal = 10
    @State var startVal = 0
    
    var body: some View {
        VStack{
            if timeVal > 0 {
                Text("Timer")
                    .font(.system(size: 14))
                Text("\(startVal)")
                    .font(.system(size: 40))
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            if self.timeVal > 0{
                                self.startVal += 1
                                if self.timeVal == self.startVal{
                                    
                                    WKInterfaceDevice.current().play(.click)
                                    self.startVal = 0
                                }
                            }
                        }
                    }
                Text("seconds")
                    .font(.system(size: 14))
                Button(action: {
                    self.timerScreenShown = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            } else {
                Button(action: {
                    self.timerScreenShown = false
                }) {
                    Text("Done")
                        .foregroundColor(.green)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
