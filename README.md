## 1. 用途 Effect
将当前窗口调整为标准大小并放置在特定位置。
Put current window to standard size and suitable position.

## 2. 用法 Usage
- 同时按下鼠标左右键触发窗口调整；
- 调整结果取决于触发时鼠标指针位于窗口的哪个区域；

## 4. 标准大小 Standard Size

### 标准高度 Standard Height
- 半高。屏幕高度的一半；
- 全高。屏幕高度；

### 标准宽度 Standard Width
- 文件宽。约550像素，适合文件浏览等；
- 内容宽。约1400像素，适合网页浏览、内容编辑等；

## 3. 调整规则 Adjust Rules

### 首次调整 First Time
- 如果鼠标在前窗口左侧，窗口被调整至屏幕左侧，并设置为全高文件宽；
- 如果鼠标在前窗口右侧，窗口被调整至屏幕右侧，并设置为全高内容宽；

### 再次调整 Second Time
已经是标准大小的窗口，再次调整时遵循以下规则：
<table>
  <tr>
    <td></td><td>调至半高/全高</td><td></td>
  </tr>
  <tr>
    <td>调至左侧全高文件宽</td><td>调至屏幕中间</td><td>调至右侧全高内容宽</td>
  </tr>
  <tr>
    <td></td><td>调至半高/全高</td><td></td>
  </tr>
</table>


