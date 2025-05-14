import Foundation
import SwiftUI


enum SplashViewRouter {
    static func makeSignInview() -> some View {
        let viewModel = SignInViewModel()
        return AnyView(SignInView(viewModel: viewModel))
        
    }
}
