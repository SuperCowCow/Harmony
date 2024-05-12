@Entry
@Component
struct addArea {

  @State
  @State textAreaValue:string = ""
  controller: TextAreaController = new TextAreaController()
  build(){
    Row(){
      Column(){
        TextArea({"placeholder" : "添加待办事项", controller: this.controller})
          .height(40)
          .width(250)
          .margin({ left: 20})
          .onChange((itemValue) => {
            this.textAreaValue = itemValue
          })
      }
      Column(){
        Button("添加",{type: ButtonType.Capsule})
          .onClick(() => {
            console.log(this.textAreaValue);
            this.items.push(this.textAreaValue)
          })
          .margin({left : 20})
      }
    }
  }
}