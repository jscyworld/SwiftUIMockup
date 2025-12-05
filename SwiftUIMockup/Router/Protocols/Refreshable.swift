//
//  Refreshable.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/19/25.
//

// 이 파일은 뷰/상태를 강제로 갱신(refresh)할 수 있도록 하는 공통 프로토콜 `Refreshable`을 정의합니다.
// `refreshID`를 새로운 UUID로 바꿔치기하여, 이를 의존하는 SwiftUI 뷰나 로직이 변경을 감지하도록 만듭니다.

import Foundation

/// 갱신(Refresh) 동작을 제공하는 타입이 채택하는 프로토콜입니다.
/// - 사용 예: SwiftUI에서 `refreshID`를 `@State` 또는 `@Published`로 보관하고,
///   값이 바뀔 때마다 뷰가 재계산/리렌더링되도록 트리거로 활용할 수 있습니다.
protocol Refreshable {
    /// 현재 상태의 식별자입니다. `refresh()`가 호출되면 새로운 UUID로 교체되어 변경을 알립니다.
    var refreshID: UUID { get set }
    /// 상태를 갱신합니다. 구현체는 별도 로직 없이 기본 구현을 사용해도 됩니다.
    mutating func refresh()
}

/// 기본 구현: `refreshID`를 새로운 UUID로 바꿔 상태 변화를 유도합니다.
extension Refreshable {
    // 새로운 UUID를 부여하여 관찰 가능한 변경을 발생시킵니다.
    mutating func refresh() {
        refreshID = UUID()
    }
}
