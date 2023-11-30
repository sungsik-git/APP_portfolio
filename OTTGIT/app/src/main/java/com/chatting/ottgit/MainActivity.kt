package com.chatting.ottgit

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.chatting.ottgit.ui.theme.OTTGITTheme
import kotlin.math.log

val fontFamily = FontFamily(
    Font(R.font.pretendardthin, FontWeight.W100),
    Font(R.font.pretendardextralight, FontWeight.W200),
    Font(R.font.pretendardlight, FontWeight.W300),
    Font(R.font.pretendardregular, FontWeight.W400),
    Font(R.font.pretendardmedium, FontWeight.W500),
    Font(R.font.pretendardsemibold, FontWeight.W600),
    Font(R.font.pretendardbold, FontWeight.W700),
    Font(R.font.pretendardextrabold, FontWeight.W800),
    Font(R.font.pretendardblack, FontWeight.W900),
)

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            OTTGITTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = colorResource(id = R.color.splashBackground)
                ) {
                    GreetingImage(
                        "WELCOME",
                        "OTT-GIT",
                        fontFamily
                    )
                }
            }
        }
    }
}

@Composable
fun printText(
    message: String,
    logo: String,
    fontFamily: FontFamily,
    modifier: Modifier = Modifier
) {
    Column(
        verticalArrangement = Arrangement.Center,
        modifier = modifier.padding(8.dp)
    ) {
        Text(
            text = message,
            color = Color.Gray,
            fontSize = 50.sp,
            textAlign = TextAlign.Left,
            modifier = Modifier
                .fillMaxWidth()
                .padding(start = 32.dp),
            fontFamily = fontFamily,
            fontWeight = FontWeight.W400
        )
        Text(
            text = logo,
            color = Color.Blue,
            fontSize = 80.sp,
            lineHeight = 116.sp,
            textAlign = TextAlign.Center,
            modifier = Modifier.fillMaxWidth(),
            fontFamily = fontFamily,
            fontWeight = FontWeight.W800
        )
    }
}

@Composable
fun GreetingImage(
    message: String,
    logo: String,
    fontFamily: FontFamily,
    modifier: Modifier = Modifier
) {
    val image = painterResource(R.drawable.ott_git_logo)
    Box {
        Image(
            painter = image,
            contentDescription = null,
            contentScale = ContentScale.Crop,
            alpha = 0.5F,
        )
        printText(
            message,
            logo,
            fontFamily = fontFamily,
            modifier = Modifier
                .fillMaxSize()
                .padding(8.dp)
        )
    }
}


@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    OTTGITTheme {
        GreetingImage("WELCOME", stringResource(R.string.ott_git), fontFamily)
    }
}