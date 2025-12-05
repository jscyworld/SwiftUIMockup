//
//  SplashView+Action.swift
//  SwiftUI Mockup
//
//  Created by Sirius Kim on 11/25/25.
//

import Combine
import UIKit

extension SplashView {
    
    // MARK: - Function (Action)
    
    func startSequence() async {
        do {
            startIntervalTimer()
            try detectJailBroken()
            moveToMain()
        } catch {
            print(error.localizedDescription)
            finishIntervalTimer()
            presentJailbreakAlertAndExit()
        }
    }
    
    private func detectJailBroken() throws {
        guard !JailBrokenDetector.hasJailBroken else { throw PreconditionError.jailBroken }
    }
    
    private func presentJailbreakAlertAndExit() {
        let title = "보안 경고"
        let message = "이 기기는 탈옥(Jailbreak) 상태로 감지되었습니다. 보안을 위해 앱을 종료합니다."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .destructive, handler: { _ in
            // 종료
            exit(0)
        }))

        // 최상위 뷰 컨트롤러에서 표시
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first(where: { $0.isKeyWindow }),
           let root = window.rootViewController {
            var top = root
            while let presented = top.presentedViewController {
                top = presented
            }
            top.present(alert, animated: true, completion: nil)
        } else {
            // 프레젠트할 수 없는 경우 즉시 종료
            exit(0)
        }
    }
    
    
    // MARK: - Function (Timer)
    
    private func startIntervalTimer() {
        timer = Timer.publish(every: splashInterval, on: .main, in: .default)
            .autoconnect()
            .sink { _ in didPassedMinInterval() }
    }
    
    private func finishIntervalTimer() {
        timer?.cancel()
    }
    
    private func didPassedMinInterval() {
        finishIntervalTimer()
        if JailBrokenDetector.hasJailBroken {
            presentJailbreakAlertAndExit()
        } else {
            moveToMain()
        }
    }
}

