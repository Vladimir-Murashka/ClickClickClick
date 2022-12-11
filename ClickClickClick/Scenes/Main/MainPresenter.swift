//
//  MainPresenter.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

import UIKit

// MARK: - MainPresenterProtocol

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoad()
    func mainButtonPressed()
}

// MARK: - MainPresenter

final class MainPresenter {
    weak var viewController: MainViewProtocol?
    
    // MARK: - PrivateProperties
    
    private let sceneBuildManager: Buildable
    private let defaultsStorage: DefaultsManagerable
    private let audioManager: AudioManagerable
    private var timer = Timer()
    private var timerValue: Double = 5
    private var clickValueLabel = 0
    
    // MARK: - Initializer
    
    init(
        sceneBuildManager: Buildable,
        defaultsStorage: DefaultsManagerable,
        audioManager: AudioManagerable
    ) {
        self.sceneBuildManager = sceneBuildManager
        self.defaultsStorage = defaultsStorage
        self.audioManager = audioManager
    }
}

//MARK: - MainPresenterExtension

extension MainPresenter: MainPresenterProtocol {
    func viewDidLoad() {
        setupAudio()
        clickValueLabel = defaultsStorage.fetchObject(type: Int.self, for: .clickValue) ?? 1000000
        viewController?.updateClickLabel(value: String(clickValueLabel))
        startTimer()
    }
    
    func mainButtonPressed() {
        clickValueLabel -= 1
        if timerValue == 0 {
            audioManager.play()
            startTimer()
        }
        timerValue += 0.5
        print(timerValue)
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        viewController?.updateClickLabel(value: String(clickValueLabel))
        defaultsStorage.saveObject(clickValueLabel, for: .clickValue)
    }
}

private extension MainPresenter {
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc
    func updateTimer() {
        timerValue -= 1
        if timerValue <= 0 {
            audioManager.pause()
            timer.invalidate()
        }
        print(timerValue)
    }
    
    func setupAudio() {
        audioManager.loadSound(forResource: "test", withExtension: "mp3")
        audioManager.play()
    }
}
