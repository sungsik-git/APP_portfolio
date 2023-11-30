@file:OptIn(ExperimentalMaterial3Api::class)

package com.chatting.ottgit

import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.chatting.ottgit.ui.theme.OTTGITTheme
import com.chatting.ottgit.viewModel.KakaoLoginViewModel

class LoginActivity : AppCompatActivity() {

    private val loginViewModel : KakaoLoginViewModel by viewModels()
    private val googleLogin: GoogleLogin = GoogleLogin()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        setContent {
            OTTGITTheme {
                Surface(
                    modifier = Modifier
                ) {
                    kakaoLoginView(loginViewModel,googleLogin)
                }
            }
        }
    }
}

@Composable
fun kakaoLoginView(viewModel: KakaoLoginViewModel, googleLogin: GoogleLogin){

    var isLoggedIn = viewModel.isLoggedIn.collectAsState()

    var loginStatusInfoTitle = if(isLoggedIn.value) "로그인 상태" else "로그아웃 상태"

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(20.dp)
    ) {
        Spacer(modifier = Modifier.height(10.dp))
        Button(onClick = {
            viewModel.kakaoLogin()
        }) {
            Text(text = "카카오 로그인하기")
        }
        Button(onClick = {
            viewModel.kakaoLogout()
        }) {
            Text(text = "카카오 로그아웃하기")
        }
        Text(text = loginStatusInfoTitle, textAlign = TextAlign.Center, fontSize = 20.sp)

        Button(onClick = {
            googleLogin.startSignIn()
            }
        ) {
            Text(text = "구글 로그인")
        }
    }
}

//@Composable
//fun StyledTextField(modifier: Modifier = Modifier, viewModel : KakaoLoginViewModel) {
//    var value by remember { mutableStateOf("") }
//    Column(
//        modifier = Modifier
//            .padding(),
//        horizontalAlignment = Alignment.CenterHorizontally,
//        verticalArrangement = Arrangement.Center
//    ) {
//        OutlinedTextField(value = value, onValueChange = { value = it })
//
//        TextField(
//            value = value,
//            onValueChange = { value = it },
//            label = { Text("your ID") },
//            maxLines = 1,
//            textStyle = TextStyle(color = Color.Gray, fontWeight = FontWeight.Bold),
//            modifier = Modifier.padding(20.dp)
//        )
//
//        TextField(
//            value = value,
//            onValueChange = { value = it },
//            label = { Text(text = "your Password") },
//            maxLines = 1,
//            textStyle = TextStyle(color = Color.Gray, fontWeight = FontWeight.Bold),
//            modifier = Modifier.padding(20.dp),
//            visualTransformation = PasswordVisualTransformation(),
//            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password)
//            )
//
//        kakaoLoginView(viewModel)
//    }
//
//}

@Preview(showBackground = true)
@Composable
private fun showStyleTextField() {
    OTTGITTheme {
//        StyledTextField()
    }
}