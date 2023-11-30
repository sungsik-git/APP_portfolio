package com.chatting.ottgit

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.chatting.ottgit.ui.theme.OTTGITTheme
import com.kakao.sdk.auth.AuthCodeHandlerActivity

class SplashActivity : AppCompatActivity() {
    private val splashTimeOut: Long = 3000
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)
        Handler(Looper.getMainLooper()).postDelayed({
            val intent = Intent(this, LoginActivity::class.java)
            startActivity(intent)
            finish()
        }, 2500) // 시간 0.5초 이후 실행
        setContent {
            OTTGITTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    color = colorResource(id = R.color.white)
                ) {
                    showLogo()
                }
            }
        }
    }
}

@Composable
private fun showLogo(modifier: Modifier = Modifier) {
    val image = painterResource(id = R.drawable.ott_git_logo)
    Column(
        modifier
            .fillMaxSize()
            .fillMaxWidth()
            .fillMaxHeight(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Image(
            painter = image,
            contentDescription = null,
            modifier = modifier
                .clip(RoundedCornerShape(32.dp))
                .width(100.dp)
                .height(100.dp),

            )
    }

}

@Preview(showBackground = true)
@Composable
fun SplashPreview() {
    OTTGITTheme {
        showLogo()
    }
}