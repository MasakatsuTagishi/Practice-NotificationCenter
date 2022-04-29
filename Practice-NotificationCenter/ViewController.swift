//
//  ViewController.swift
//  Practice-NotificationCenter
//
//  Created by 田岸将勝 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!

    private let textModel = TextModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        NotificationCenter.default.addObserver(
            forName: .textModelDidChangeText,
            object: nil,
            queue: OperationQueue.main,
            using: { [weak self] _ in
                self?.updateLabel()
            }
        )
    }

    @IBAction private func pressedButton(_ sender: Any) {
        textModel.changeText()
    }

    private func setupLabel() {
        label.text = textModel.text
    }

    private func updateLabel() {
        label.text = textModel.text
    }
}

extension Notification.Name {
    static let textModelDidChangeText
    = Notification.Name("ChangeTextModel.didChangeText")
}

class TextModel {

    private(set) var text = "ボタンを押してください"

    func changeText() {
        text = "ありがとう"
        notify()
    }

    private func notify() {
        NotificationCenter.default.post(
            name: .textModelDidChangeText,
            object: nil
        )
    }

}
