//
//  HomeModel.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/05/31.
//

import Foundation

struct Product {
    var title: String
    var location: String
    var time: String
    var price: Int
    var image: String
}

// TODO: description 만들어서 새 페이지에 내용까지 넣기

class HomeModel {
    private var storage: Array<Product> = [
        Product(title:"청원피스", location:"당산동3가", time:"30분 전", price:5000, image:"img01"),
        Product(title:"연핑크 롱원피스", location:"당산동3가", time:"35분 전", price:3000, image:"img01"),
        Product(title:"자라 니트 봄 원피스 재당근", location:"양천구 목3동", time:"끌홀 28분전", price:15000, image:"img01"),
        Product(title:"테니스 스커트 연핑 s", location:"당산동3가", time:"31분 전", price:3000, image:"img01"),
        Product(title:"베이지프릴카라 블라우스 재당근해요", location:"양천구 목3동", time:"끌홀 29분 전", price:9000, image:"img01"),
        Product(title:"잔꽃부늬 블라우스 블랙", location:"당산동3가", time:"37분 전", price:4000, image:"img01"),
        Product(title:"롱남방", location:"당산제2동", time:"끌홀 42분 전", price:6000, image:"img01")
    ]
    
    // 새로운 데이터 만들기 (Create)
    public func addCellData(data: Product) {
        storage.append(data)
    }
    
    // 해당 인덱스의 셀 가져오기 (Read)
    public func getCellData(index: Int) -> Product {
        return storage[index]
    }
    
    // 해당 인덱스의 셀 수정 (Update)
    public func updateCellData(data: Product, index: Int) {
        storage[index] = data
    }
    
    // 해당 인덱스의 셀 삭제 (Delete)
    public func deleteCellData(index: Int) {
        storage.remove(at: index)
    }
}
