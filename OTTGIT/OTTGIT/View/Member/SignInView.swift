import SwiftUI

struct SignInView: View {
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var signInProcessing: Bool = false
    @State var viewModel: ViewModel

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack(spacing: 15) {
                    Text("이메일로 로그인하세요")
                        .font(.largeTitle)
                        .lineSpacing(10)
                    
                    VStack {
                        TextField("이메일을 입력하세요", text: $emailText)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .textInputAutocapitalization(.never)
                        SecureField("비밀번호를 입력하세요", text: $passwordText)
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .padding(.bottom, 30)
                    }
                    
                    // 로그인 접속중에 signInProcessing = false 이거나 유저 정보가 비어있다면
                    if signInProcessing {
                        ProgressView()
                    }
                    
                    
                    Button {
                        signInProcessing = true
                        viewModel.emailAuthSignIn(email: emailText, password: passwordText)
                        
                        
                    } label: {
                        Text("로그인")
                            .padding()
                            .foregroundColor(.white)
                            .background(emailText.isEmpty || passwordText.isEmpty == true ? .gray : .red)
                            .cornerRadius(10)
                            .padding(.bottom, 40)
                    }
                    .disabled(emailText.isEmpty || passwordText.isEmpty ? true : false)
                    
                    // 회원가입 View로 이동
                    HStack {
                        Text("아이디가 없으십니까?")
                        
                        NavigationLink {
                            SignUpView()
                        } label: {
                            HStack {
                                Text("지금 만드세요.")
                                Image(systemName: "arrow.up.forward")
                                
                            }
                        }
                    }
                    
                }
                .padding()
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: ViewModel())
    }
}
