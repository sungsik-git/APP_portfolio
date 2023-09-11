import Foundation
import Firebase
import FirebaseAuth

//Firebse insert info Viewmodel
class ViewModel: ObservableObject {
    
    @Published var state: SignInState = .signedOut

    enum SignInState{
        case signedIn
        case signedOut
    }
    
    func emailAuthSignUp(email: String, userName: String, password: String) -> Void {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                
                return
            }
            
            if result != nil {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userName
                print("사용자 이메일: \(String(describing: result?.user.email))")
            }
        }
    }
    
    func emailAuthSignIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                
                return
            }
            
            if result != nil {
                self.state = .signedIn
                print("사용자 이메일: \(String(describing: result?.user.email))")
                print("사용자 이름: \(String(describing: result?.user.displayName))")

            }
        }
    }
}
