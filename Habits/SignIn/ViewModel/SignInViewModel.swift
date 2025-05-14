import Foundation
import SwiftUI


class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
