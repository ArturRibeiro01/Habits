import Foundation
import SwiftUI


enum SignInViewRouter {
    static func makeSignInview() -> some View {
//        let viewModel = makeHomeView()
//        return AnyView(SignInView(viewModel: viewModel))
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
        
    }
}
