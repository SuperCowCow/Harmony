
@Component
export struct OtherLoginWay {

  build(){
    Column(){
      Text($r('app.string.Other_login_way'))
        .fontColor(Color.Gray)
        .margin({bottom: 10})
      Row(){
        Button("方式一",{type: ButtonType.Circle})
          .width("18%")
          .backgroundColor(Color.Gray)

        Button("方式二",{type: ButtonType.Circle})
          .width("18%")
          .backgroundColor(Color.Gray)

        Button("方式三",{type: ButtonType.Circle})
          .width("18%")
          .backgroundColor(Color.Gray)
      }
      .justifyContent(FlexAlign.SpaceAround)
      .width("100%")
    }
  }
}