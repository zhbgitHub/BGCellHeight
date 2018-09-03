## 效果图

![image](https://github.com/zhbgitHub/BGCellHeight/blob/master/xiaoguo.gif)



## 1. 实例：UITableViewCell+UITextView 高度自动调整
    * 依赖IQKeyboardManagerSwift框架
    * 基本功能，随着UITextView的数据，更改Cell的高度。
> 核心代码，注意适用于iOS9.0+， 
```
extension DynamicHightTableView: UITextViewDelegate {

 func textViewDidChange(_ textView: UITextView) {
    self.beginUpdates()
    self.endUpdates()
    var sltRange = textView.selectedRange
    sltRange.length = 1
    sltRange.location -= 1
    textView.scrollRangeToVisible(sltRange)
 }

 func textViewShouldEndEditing(_ textView: UITextView) ->Bool {
    textView.isScrollEnabled = false
    return true
 }

 func textViewDidEndEditing(_ textView: UITextView) {
    textView.isScrollEnabled = true
    let tag = textView.tag - 800
    let index = (tag % self.cell1TextArray.count)
    self.cell1TextArray[index] = textView.text
 }
}
```

## 2. 自动布局优先级的使用测试，今后提供针对hidden属性的扩展此功能

    * 控件removeFromSuperview优先级控制
    * 子控件 自动撑起 superView的size

