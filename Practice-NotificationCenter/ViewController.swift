//
//  ViewController.swift
//  Practice-NotificationCenter
//
//  Created by 田岸将勝 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!

    private let changeTextModel = ChangeTextModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        NotificationCenter.default.addObserver(
            forName: .ChangeTextModelDidChangeText,
            object: nil,
            queue: OperationQueue.main,
            using: { [weak self] _ in
                self?.updateLabel()
            }
        )
    }

    @IBAction private func pressedButton(_ sender: Any) {
        changeTextModel.changeText()
    }

    private func setUpLabel() {
        label.text = changeTextModel.text
    }

    private func updateLabel() {
        label.text = changeTextModel.text
    }
}

extension Notification.Name {
    static let ChangeTextModelDidChangeText
    = Notification.Name("ChangeTextModel.didChangeText")
}

class ChangeTextModel {

    private(set) var text = "ボタンを押してください"

    func changeText() {
        text = "ありがとう"
        notify()
    }

    private func notify() {
        NotificationCenter.default.post(
            name: .ChangeTextModelDidChangeText,
            object: nil
        )
    }

}
