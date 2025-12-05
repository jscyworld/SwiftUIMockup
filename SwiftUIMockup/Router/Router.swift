//
//  Router.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/19/25.
//

// 전역 라우팅/내비게이션 상태를 관리하는 `Router`입니다.
// 루트 화면 전환(`root`)과 메인 영역 내 화면 흐름(`main`)을 함께 보유/브로드캐스트합니다.

import SwiftUI
import Combine

/// 앱 전역의 라우팅 및 내비게이션 상태를 보유하는 객체입니다.
/// - Important: SwiftUI에서 `@StateObject`(루트) 또는 `@EnvironmentObject`(하위 트리)로 주입하여
///   뷰 트리 전반에서 상태 변화를 구독하세요.
/// - Discussion: `root`는 앱의 최상위 전환(스플래시 → 메인/설정 등)을 제어하고,
///   `main`은 메인 탭/스택과 같은 하위 흐름 상태를 캡슐화합니다.
final class Router: ObservableObject {
    
    /// 앱의 최상위 루트 화면 상태입니다. 변경 시 루트 컨테이너가 전환됩니다.
    @Published var root: Root = .splash
    
    /// 메인 영역(탭/스택 등)의 세부 내비게이션 상태입니다. `root == .main`일 때 주로 사용됩니다.
    @Published var main: Main = .init()
    
    /// 라우팅 상태를 초기화합니다.
    /// - Parameter root: 초기 루트 상태(기본값 `.splash`).
    /// - Note: 초기 진입 지점을 다시 설정할 때 사용합니다.
    func reset(root: Root = .splash) {
        set(root: root)
    }
}


/// 세부 타입 및 헬퍼 메서드를 모아둔 확장입니다.
extension Router {
    
    /// 라우팅의 최상위 목적지를 표현하는 열거형입니다.
    enum Root: Equatable {
        /// 초기 진입/스플래시 화면
        case splash
        /// 메인 콘텐츠 영역(탭/피드 등)
        case main
        /// 설정 화면 트리
        case setting
    }
    
    /// 루트 화면 상태를 변경합니다. 변경 시 구독 중인 루트 컨테이너가 즉시 전환됩니다.
    /// - Parameter root: 설정할 루트 화면 상태
    func set(root: Root) {
        withAnimation(.easeInOut) {
            self.root = root
        }
    }
}

