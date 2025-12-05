//
//  Sheetable.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/19/25.
//

import Foundation

/// Sheetable 프로토콜
/// - 목적: 시트(sheet) 표시를 라우팅하거나 식별 가능한 값으로 다루기 위해 사용되는 타입의 공통 인터페이스를 정의합니다.
/// - 핵심 아이디어: `String` 기반의 `rawValue`를 갖는 `RawRepresentable`과 `Identifiable`을 결합하여,
///   열거형(enum) 등으로 시트 상태를 표현할 때 간편하게 식별자(`id`)를 제공할 수 있게 합니다.
/// - 전형적 사용 예: `enum MySheet: String, Sheetable { case settings, profile }` 처럼 선언해 `sheet(item:binding)` 등에 사용.
/// - 제약 사항: `RawValue == String` 이어야 하므로, 반드시 문자열 기반의 원시값을 사용해야 합니다.
protocol Sheetable: RawRepresentable, Identifiable where RawValue == String {}

/// 기본 구현
/// - 설명: `Sheetable`을 채택한 타입은 자동으로 `id`를 `rawValue`(문자열)로 제공합니다.
/// - 이유: 시트 구분에 필요한 식별자로 사람이 읽기 쉬운 안정적인 문자열을 사용하는 것이 일반적이고, 중복이 적습니다.
extension Sheetable {
    var id: String { rawValue }
}
