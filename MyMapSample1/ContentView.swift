        //
        //  ContentView.swift
        //  MyMapSample1
        //
        //  Created by 森田晋 on 2021/11/28.
        //

        import SwiftUI
        import MapKit

        struct ContentView: View {
            @State var inputText:String = ""
            @State var dispSerchKey:String = ""
            @State var dispMapType:MKMapType = .standard
            
            var body: some View {
                VStack {
                    TextField("キーワードを入力してください",text: $inputText , onCommit: {
                        dispSerchKey = inputText
                        print("入力したキーワード:" + dispSerchKey)
                    })
                        .padding()
                    ZStack(alignment: .bottomTrailing) {
                        MapView(searchKey: dispSerchKey, mapType: dispMapType)
                        
                        Button(action: {
                            if dispMapType == .standard {
                                dispMapType = .satellite
                            } else if dispMapType == .satellite {
                                dispMapType = .hybrid
                            } else if dispMapType == .hybrid {
                                dispMapType = .satelliteFlyover
                            } else if dispMapType == .satelliteFlyover {
                                dispMapType = .satelliteFlyover
                                    dispMapType = .hybridFlyover
                            } else if dispMapType == .hybridFlyover {
                                    dispMapType = .mutedStandard
                            } else {
                                    dispMapType = .standard
                            }
                        }) {
                                Image(systemName: "map")
                                    .resizable()
                                    .frame(width: 35.0,height: 35.0,alignment: .leading)
                            }
                        }
                               }
                               }
                               
                               }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
