import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    @State var action: Int? = 0
    @State var navigationHidden: Bool = true
    
    var body: some View {
        ZStack {
            if case .goToHomeScreen = viewModel.uiState {
                Text("Tela Principal")
            } else {
                NavigationStack {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {
                            Spacer(minLength: 36)
                            
                            VStack(alignment: .center, spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                                
                                Text("Login")
                                    .foregroundColor(Color("ColorPrimary"))
                                    .font(Font.system(.title).bold())
                                
                                numberField
                                passwordField
                                enterButton
                                registerLink
                                
                                Text("Copyrights @ sei la")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12).bold())
                                    .padding(.top, 16)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 24)
                        .background(Color.white)
                        .navigationBarTitle("Login", displayMode: .inline)
                        .navigationBarHidden(navigationHidden)
                    }
                    .onAppear { self.navigationHidden = true }
                    .onDisappear { self.navigationHidden = false }
                }
            }
        }
    }
}

extension SignInView {
    var numberField: some View {
        TextField("Email", text: $email)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("ColorPrimary")))
    }
    
    var passwordField: some View {
        SecureField("Senha", text: $password)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("ColorPrimary")))
    }
    
    var enterButton: some View {
        Button(action: {
            viewModel.signIn(email: email, password: password)
        }) {
            Text("Entrar")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("ColorPrimary"))
                .cornerRadius(8)
        }
    }
    
    var registerLink: some View {
        VStack {
            Text("Ainda não possui uma conta?")
                .padding(.top, 48)
                .foregroundColor(Color.gray)
            
            NavigationLink(destination: Text("Tela de Cadastro")) {
                Text("Tela de Cadastro")
                    .foregroundColor(Color("ColorPrimary"))
                    .bold()
            }
        }
    }
}

#Preview {
    let viewModel = SignInViewModel()
    return SignInView(viewModel: viewModel)
}
