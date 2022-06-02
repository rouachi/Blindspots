//
//  ContentView.swift - What user sees
//  Beeps!
//
//  Created by Rym Ouachi on 24/02/2022.
//

import SwiftUI
import CoreBluetooth
import Combine

struct ContentView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isOnState = false
    @ObservedObject var bleManager = BLEManager()

    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
                .onReceive(timer) { input in
                    noStopScanning()
                    
                }
            
            VStack{
                
                if bleManager.isSwitchedOn {
                    
                    Text("Bluetooth Activated")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(width: 250.0, height: 100.0)
                        .background(Color(red: 0.028, green: 0.939, blue: 0.313))
                        .cornerRadius(/*@START_MENU_TOKEN@*/11.0/*@END_MENU_TOKEN@*/)
                }
                else{
                    Text("Bluetooth OFF Activate Bluetooth")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(width: 250.0, height: 100.0)
                        .background(Color(red: 1.002, green: 0.445, blue: 0.441))
                        .cornerRadius(/*@START_MENU_TOKEN@*/11.0/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                    .frame(height: 100)
                
                if (bleManager.state_ == true){
                    VStack{
                        Image("triangle")
                            .resizable()
                            .frame(width: 250.0, height: 250.0)
                        Text("Attention! Public works. Walk carefully.")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }
                }
                else{
                    Text("No public works detected. Walk carefully.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
                
            }
        }
    }
    func noStopScanning(){
        if bleManager.isSwitchedOn{
            self.bleManager.startScanning()
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

/*
 VStack (alignment: .center, spacing:10) {
     Text("Beeps!")
         .font(.largeTitle)
         .fontWeight(.bold)
         .foregroundColor(Color(hue: 0.746, saturation: 0.892, brightness: 0.604))
         .multilineTextAlignment(.center)
         .frame(width: 150.0, height: 50.0)
         
     
     if (bleManager.state_ == true){
         Image("triangle")
             .resizable()
             .frame(width: 300.0, height: 300.0)
 
         Text("Attention! Travaux routiers, marchez prudement")
             .font(.title)
             .fontWeight(.bold)
             .foregroundColor(Color.white)
             .multilineTextAlignment(.center)
             .frame(width: 380.0, height:100.0)
     }
     
     else {
         Text("Pas de travaux")
             .font(.title)
             .fontWeight(.bold)
             .foregroundColor(Color.white)
             .multilineTextAlignment(.center)
             .frame(width: 380.0, height:100.0)
     }
     
     Button(action: {
         self.bleManager.startScanning()
     }) {
         Text("Start Service")
             .font(.title)
             .fontWeight(.bold)
             .foregroundColor(Color.black)
             .frame(width: 250.0, height: 80.0)
     }
     .frame(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/80.0/*@END_MENU_TOKEN@*/)
     .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.169, saturation: 1.0, brightness: 1.0)/*@END_MENU_TOKEN@*/)
     .cornerRadius(/*@START_MENU_TOKEN@*/11.0/*@END_MENU_TOKEN@*/)
 
     Spacer()
     
     // Status goes here
     if bleManager.isSwitchedOn {
         Text("Bluetooth is ON")
             .font(.title3)
             .foregroundColor(.green)
             .frame(width: 380.0, height:100.0)
     }
     else {
         Text("Bluetooth is OFF")
             .font(.title3)
             .foregroundColor(.red)
             .frame(width: 380.0, height:100.0)
     }

     Spacer()
 }
 .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
 
 
 func isOn(isOnState: Bool) -> (String,[Double]){
     let isOnState = bleManager.isSwitchedOn
     if isOnState{
         let isOnText = "Bluetooth is ON"
         let isOnColor = [0.028,0.939,0.313]
     }
     return (isOnText, isOnColor)
 
 /*
 Button(action: {
     self.bleManager.startScanning()
 }) {
     Text("Start Service")
         .font(.title)
         .fontWeight(.bold)
         .foregroundColor(Color.black)
         .frame(width: 250.0, height: 80.0)
 }
 .frame(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/80.0/*@END_MENU_TOKEN@*/)
 .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.169, saturation: 1.0, brightness: 1.0)/*@END_MENU_TOKEN@*/)
 .cornerRadius(/*@START_MENU_TOKEN@*/11.0/*@END_MENU_TOKEN@*/)
 */
 }
 */
