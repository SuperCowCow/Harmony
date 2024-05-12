import { ToDoItem } from '../view/ToDoItem'

@Entry
@Component
struct Index {
  @State textAreaValue: string = ""
  @State items: string[] = ['1', '2']

  build() {
    Column() {
      Row() {
        Text("待办事项")
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
      }

      List() {
        ForEach(this.items, (item, index) => {
          ListItem() {
            ToDoItem({ itemValue: item, itemIndex: index })
          }.backgroundColor(Color.White)
        })
      }
      .divider({ strokeWidth: "1" })

      Row() {
        Column() {
          TextArea({ "placeholder": "添加待办事项" })
            .height(40)
            .width(250)
            .margin({ left: 20 })
            .onChange((itemValue) => {
              this.textAreaValue = itemValue
            })
        }

        Column() {
          Button("添加", { type: ButtonType.Capsule })
            .onClick(() => {
              if (this.textAreaValue.trim() != '') {
                this.items.push(this.textAreaValue)
              }
            })
            .margin({ left: 20 })
        }
      }

    }
    .height('100%')
    .backgroundColor(Color.Grey)
  }
}