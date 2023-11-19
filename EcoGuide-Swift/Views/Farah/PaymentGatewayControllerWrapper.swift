import Foundation
import Stripe
import SwiftUI

struct PaymentGatewayControllerWrapper: UIViewControllerRepresentable {
    @Binding var message: String
    let clientSecret: String
    let onCompletion: (STPPaymentHandlerActionStatus) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Perform the payment handling when the view appears
        if uiViewController.presentedViewController == nil {
            handlePayment(using: context.coordinator)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    private func handlePayment(using coordinator: Coordinator) {
        let paymentHandler = STPPaymentHandler.shared()

        paymentHandler.confirmPayment(
            withParams: STPPaymentIntentParams(clientSecret: clientSecret),
            authenticationContext: coordinator
        ) { (status, intent, error) in
            switch status {
            case .failed:
                self.message = "Failed"
            case .canceled:
                self.message = "Cancelled"
            case .succeeded:
                self.message = "Your Payment has been successfully completed"
            @unknown default:
                break
            }

            // Call the onCompletion callback with the payment status
            self.onCompletion(status)
        }
    }

    class Coordinator: NSObject, STPAuthenticationContext {
        var parent: PaymentGatewayControllerWrapper

        init(parent: PaymentGatewayControllerWrapper) {
            self.parent = parent
        }

        func authenticationPresentingViewController() -> UIViewController {
            // This is the correct way to get the presenting view controller
            return UIApplication.shared.windows.first?.rootViewController ?? UIViewController()
        }
    }
}
