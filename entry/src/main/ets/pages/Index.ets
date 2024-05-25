import router from '@ohos.router'
import CommonConstants from '../constants/CommonConstants'
import { OtherLoginWay } from '../view/OtherLoginWay'
@Entry
@Component
struct Index {

  @State
  username:string = ""
  @State
  password:string = ""

  build() {

    Column(){
      // logo
      Image($r('app.media.login'))
        .align(Alignment.Center)
        .height(CommonConstants.LOGIN_IMAGE_HEIGHT)
        .width(100)
        .margin({top: 70, bottom: 30})
      // text
      Text($r('app.string.Login_slogan'))
        .fontSize(30)
        .fontWeight(1)
        .margin({bottom: 10})
      // text
      Text($r('app.string.Login_introduction'))
        .fontColor(Color.Gray)
        .margin({bottom: 50})
      // username input
      TextInput({placeholder: $r('app.string.Username'), text: this.username})
        .onChange((inputValue) => {
          this.username = inputValue
        })
        .height(50)
        .margin({bottom : 30})
      // password input
      TextInput({placeholder: $r('app.string.Password'), text: this.password})
        .type(InputType.Password)
        .onChange((inputValue) => {
          this.password = inputValue
        })
        .height(50)
        .margin({bottom : 10})
      // verify code login link and forget password link
      Row(){

        Text($r('app.string.MessageVerifyLogin'))
          .fontColor('#3399ff')
        Text($r("app.string.Forget_password"))
          .fontColor('#3399ff')
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({bottom: 80})

      // login button
      Button($r("app.string.Login"),{type: ButtonType.Capsule})
        .onClick(() =>{
          if (this.username != "" && this.password != "") {
            router.pushUrl({url: "pages/Content" })
          }
        })
        .width("80%")
        .margin({bottom: 10})
      // register button
      Text($r("app.string.Register"))
        .fontColor('#3399ff')
        .margin({bottom: 30})
      //other login way

      OtherLoginWay()

    }
    .width('100%')
    .height('100%')



  }
}