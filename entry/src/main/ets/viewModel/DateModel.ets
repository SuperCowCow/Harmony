
export class DataModel {

  private targetData: Array<TargetItemStruct> = [];

  getData(): Array<TargetItemStruct> {
    return this.targetData
  }

  deleteData(selectArr: Array<boolean>) {
    let dataLen = this.targetData.length - 1;
    for (let i = dataLen; i >= 0; i--) {
      if (selectArr[i]) {
        this.targetData.splice(i, 1);
      }
    }
  }

  addData(data: TargetItemStruct) {
    this.targetData.push(data);
  }


  updateProgress(index: number, updateDate: string) {
    this.targetData[index].isFinished = true;
    this.targetData[index].updateDate = updateDate;
  }
}

export default new DataModel();

export class TargetItemStruct {
  targetName: string;
  updateDate: string;
  isFinished: boolean;

  constructor(targetName: string, updateDate: string, isFinished: boolean) {
    this.targetName = targetName;
    this.updateDate = updateDate;
    this.isFinished = isFinished;
  }
}