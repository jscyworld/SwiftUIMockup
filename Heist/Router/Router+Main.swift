//
//  Router+Main.swift
//  Heist
//
//  Created by Sirius_Haii on 11/19/25.
//

import SwiftUI

// Router의 메인 탭/영역에서 사용하는 라우팅 상태와 보조 상태(Sheet/Cover, 새로고침 등)를 정의한 확장 파일
// iOS 16+의 NavigationStack(path)와 iOS 15의 NavigationView(selection) 모두를 지원하기 위한 상태를 함께 보관합니다.
extension Router {
    
    /// 메인 화면(루트: Main)에서 사용하는 라우팅/표현 상태 컨테이너
    /// - path: iOS 16+에서 NavigationStack 경로
    /// - selection: iOS 15에서 NavigationView의 프로그램적 네비게이션에 사용
    /// - sheet/cover: 모달 표현(Sheet / Full Screen Cover) 상태
    /// - refreshID: .refresh(id:) 트리거를 위한 식별자
    struct Main: Refreshable {
                
        /// 네비게이션 스택/링크에서 푸시할 목적지(화면) 정의
        enum Destination: Hashable {
            // 메인 콘텐츠 화면으로 이동
            case mainContentView
        }
        
        /// iOS 16+: NavigationStack에서 사용하는 경로 스택
        var path: [Destination] = []
        /// iOS 15: NavigationView에서 selection 기반으로 프로그램적 네비게이션을 할 때 사용
        var selection: Destination?
        
        /// 시트(Sheet)로 표시할 수 있는 화면 목록
        enum Sheet: String, Sheetable {
            // 간단한 팝업 시트
            case popup
            
        }
        
        /// 풀스크린 커버로 표시할 수 있는 화면 목록
        enum Cover: String, Sheetable {
            // 메인 콘텐츠 화면을 풀스크린으로 표시
            case mainContentView
        }
        
        /// 현재 표시 중이거나 표시할 시트 상태
        var sheet: Sheet?
        
        /// 현재 표시 중이거나 표시할 풀스크린 커버 상태
        var cover: Cover?
        
        /// .refresh(id:)를 강제로 트리거하기 위한 식별자 (값 변경 시 새로고침)
        var refreshID: UUID = UUID()
    }
}

