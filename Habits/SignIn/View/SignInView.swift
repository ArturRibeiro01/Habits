import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    @State var action: Int? = 0
    @State var navigationHidden: Bool = true
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false){
                VStack(alignment: .center, spacing: 20) {
                    Spacer(minLength: 36)
                    VStack(alignment: .center, spacing: 8) {
            
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal,48)
                        
                        Text("Login")
                            .foregroundColor(Color("ColorPrimary"))
                            .font(Font.system(.title).bold())
                        
                        numberField
                        passwordField
                        enterButton
                        registerLink
                        
                        Text("Copyrights @ sei la")
                            .foregroundColor(Color.gray)
                            .font(Font.system(size: 12).bold())
                            .padding(.top, 16)
                    }
                }.frame (
                    maxWidth: .infinity,
                    maxHeight: .infinity
                    
                ).padding (
                    .horizontal, 24)
                .background(Color.white)
                .navigationBarTitle(
                    "Login",
                    displayMode: .inline )
                .navigationBarHidden(navigationHidden)
            }.onAppear {
                self.navigationHidden = true
            }.onDisappear{
                self.navigationHidden = false
            }
        
        }


    }
}

extension SignInView {
    var numberField: some View {
        TextField("Email", text: $email)
            .border(Color.colorPrimary)
    }
    
    var passwordField: some View {
        SecureField("Senha", text: $password)
            .border(Color.colorPrimary)
    }
    
    var enterButton: some View {
        Button("Entrar"){
        }
    }
    
    var registerLink: some View {
        VStack{
            Text("Ainda não possui uma conta?")
                .padding(.top,48).foregroundColor(Color.gray)
            
            ZStack {
                NavigationLink(
                    destination: Text("Tela de Cadastro"),
                    tag: 1,
                    selection: $action
                ) {
                    EmptyView()
                }
                
                Button( "cadastre-se"){
                    self.action = 1
                }

            }
        }
    }
}

#Preview {
    let viewModel = SignInViewModel()
    let signIn = SignInView(viewModel: viewModel)
    return signIn
}
