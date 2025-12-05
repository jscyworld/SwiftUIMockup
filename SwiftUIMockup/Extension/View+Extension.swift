//
//  View+Extension.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/19/25.
//

// 이 확장은 SwiftUI `View`에 비동기 리프레시 헬퍼를 제공합니다.
// 특정 식별자 `id` 값이 변경될 때마다 제공된 비동기 `action`을 실행합니다.

import SwiftUI

/// View 확장: 식별자 변화에 반응해 비동기 작업을 트리거합니다.
extension View {
    /// 주어진 `id` 값이 바뀔 때마다 비동기 `action`을 실행합니다.
    /// - Parameters:
    ///   - id: 변경을 감지할 식별자. `Equatable`을 요구하며 값 변경 시 트리거됩니다.
    ///   - action: 변경 시 실행할 비동기 작업. 새로운 `Task`에서 실행됩니다.
    /// - Returns: 변경 감지 로직이 적용된 뷰를 반환합니다.
    /// - Note: `nonisolated`는 이 메서드가 어떤 actor에도 묶이지 않음을 의미합니다. UI 업데이트는 메인 액터에서 수행되도록 `@MainActor` 컨텍스트를 보장해야 합니다.
    nonisolated func refresh<ID>(id: ID, _ action: @escaping () async -> Void) -> some View where ID: Equatable {
        // iOS 17+: use the newer onChange signature with oldValue/newValue if available
        if #available(iOS 17, macOS 14, watchOS 10, tvOS 17, *) {
            return onChange(of: id) { _, _ in
                Task { await action() }
            }
        } else {
            // iOS 15/16: fall back to the older onChange(of:_:) API
            return onChange(of: id) { _ in
                Task { await action() }
            }
        }
    }
}

