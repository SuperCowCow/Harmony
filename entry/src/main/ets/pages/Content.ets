import router from '@ohos.router'
@Entry
@Component
struct Content {
  
  @State
  targets: string[] = ["目标1"]
  
  build() {
    List(){
      ListItemGroup({header: this.itemGroupTitle($r('app.string.Work_objectives') as unknown as string, 40)}){
        ListItem(){
          Column(){
            Row(){
              Column(){
                Image($r("app.media.workflow"))
                  .margin({top : 20})
              }
              .width("50%")


              Column(){
                Text($r('app.string.First_quarter_operating_goals'))
                  .fontSize(20)
                Text($r('app.string.User_increased'))
                  .fontSize(15)
                  .fontColor("#b3b3b3")
              }
            }
            .justifyContent(FlexAlign.SpaceAround)
            .width("100%")

            Row(){
              Column(){
                Text($r('app.string.Overall_progress'))
                  .fontSize(15)
                  .align(Alignment.Start)
                Text($r('app.string.Update_time'))
                  .fontSize(10)
                  .fontColor("#b3b3b3")
                Text("03/26/2024 19:20")
                  .fontSize(15)
              }
              Column(){
                Circle({ width: 50, height: 50})
                  .fillOpacity(0)
                  .stroke("#f2f2f2")
                  .strokeWidth(3)
              }
            }
            .width("100%")
            .justifyContent(FlexAlign.SpaceAround)
          }
        }
        .border({radius: 10})
        .width("95%")
        .backgroundColor(Color.White)
        .margin({left: "2.5%"})
      }
      .height("20%")


      ListItemGroup({header: this.itemGroupTitle($r('app.string.Sub_target') as unknown as string, 25)}){
        ForEach(this.targets, (target) => {
          ListItem(){
            this.subTarget(target)
          }
          .border({radius: 10})
          .width("95%")
          .margin({left: "2.5%"})
          .backgroundColor(Color.White)
        })
      }


    }
    .height("100%")
    .width("100%")
    .backgroundColor("#f2f2f2")

}

  @Builder itemGroupTitle(text: string, fontSize: number){
    Text(text)
      .fontSize(fontSize)
      .backgroundColor("#f2f2f2")
      .width("100%")
  }

  @Builder subTarget(target: string){
    Row(){
      Column(){
        Text(target)
      }
      Column(){
        Column(){
          Text("0%")
          Row(){
            Text($r('app.string.Update_time'))
            Text("：2020/01/01")
          }

        }
      }
    }
    .width("90%")
    .justifyContent(FlexAlign.SpaceBetween)
  }

}

