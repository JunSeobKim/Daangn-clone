//
//  LifeModel.swift
//  Daangn-clone
//
//  Created by 김준섭 on 2022/06/03.
//

import Foundation

struct Content {
    var category: String
    var title: String
    var name: String
    var location: String
    var time: String
    var image: String?
}

class LifeModel {
    private var storage: Array<Content> = [
        Content(category: "동네질문", title: "파리공원 부근에 로또판매점 없나유", name: "오마이지쟈스", location: "목5동", time: "1분 전"),
        Content(category: "일상", title: "한 달 모음 소주병 폐자할머니 드리는 날^^", name: "조제", location: "망원동", time: "9분 전"),
        Content(category: "강아지", title: "심심해서 제 새끼 자랑해요", name: "존크", location: "양천구 목동", time: "1시간 전")
    ]
    
    // 새로운 데이터 만들기 (Create)
    public func addLifeCellData(data: Content) {
        storage.append(data)
    }
    
    // 해당 인덱스의 셀 가져오기 (Read)
    public func getLifeCellData(index: Int) -> Content {
        return storage[index]
    }
    
    // 해당 인덱스의 셀 수정 (Update)
    public func updateLifeCellData(data: Content, index: Int) {
        storage[index] = data
    }
    
    // 해당 인덱스의 셀 삭제 (Delete)
    public func deleteLifeCellData(index: Int) {
        storage.remove(at: index)
    }
    
    // 카운트
    public func lifeCount() -> Int {
        return storage.count
    }
}
