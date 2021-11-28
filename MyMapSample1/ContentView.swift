//
//  ContentView.swift
//  MyMapSample1
//
//  Created by 森田晋 on 2021/11/28.
//

import SwiftUI

struct ContentView: View {
    @State var inputText:String = ""
    @State var dispSerchKey:String = ""
    
    var body: some View {
        VStack {
            TextField("キーワードを入力してください",text: $inputText , onCommit: {
                dispSerchKey = inputText
                print("入力したキーワード:" + dispSerchKey)
            })
                .padding()
            MapView(searchKey: dispSerchKey)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
