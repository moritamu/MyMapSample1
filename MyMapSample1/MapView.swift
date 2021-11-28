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
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchKey, completionHandler: { (placemarks,error) in
            if let unwrapPlacemarks = placemarks ,
               let firstPlacemark = unwrapPlacemarks.first ,
               let location = firstPlacemark.location {
                let targetCoordinate = location.coordinate
                print(targetCoordinate)
                
                let pin = MKPointAnnotation()//ピンを生成
                pin.coordinate = targetCoordinate//ピンの場所に経度緯度を設定
                pin.title = searchKey//ピンのタイトル
                uiView.addAnnotation(pin)//ピンを地図に置く
                uiView.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                //緯度経度を中心にして半径５００mの範囲を表示する
                
            }
        })
        
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
