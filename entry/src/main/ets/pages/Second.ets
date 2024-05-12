import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State text: string = 'Hi there'

  build() {
    Row() {
      Column() {
        Text(this.text)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button(){
          Text('go back')
            .fontColor(Color.Red)
            .fontSize(30)
        }
        .type(ButtonType.Circle)
        .margin({
          top: 20
        })
        .backgroundColor(Color.Green)
        .width('40%')
        .height('10%')
        .onClick(() => {router.back()
      })
      .width('100%')
    }
    .height('100%')
  }
}}