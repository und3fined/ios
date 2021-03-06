import UIKit
import RxSwift

final class RegistrationSendCodeViewModel: RegistrationSendCodeViewModelType {

    var stepFinishedObservable: Observable<SendCodeFinishedData> {
        return model.stepFinishedObservable
    }

    private let model: RegistrationSendCodeModelType

    private let disposeBag = DisposeBag()

    init(model: RegistrationSendCodeModelType) {
        self.model = model
    }

    func bind(view: RegistrationSendCodeView) {
        view.sendCodeButtonTapEvent.subscribe(onNext: { [weak self] _ in
            self?.model.registerDevice(phoneNumber: view.phoneNumber)
        }).disposed(by: disposeBag)

        model.keyboardHeightWillChangeObservable.subscribe(onNext: { keyboardHeight in
            view.update(keyboardHeight: keyboardHeight)
        }) .disposed(by: disposeBag)
    }
}
