//
//  MapView.swift
//  MyMapSample1
//
//  Created by 森田晋 on 2021/11/28.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
//    UIViewRepresentableにはmakeUIViewとupdateUIViewが必要
    let searchKey:String//検索キー
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
