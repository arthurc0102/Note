# 說明

> arthur 的 Markdown 練習筆記


---


# 標題

> # H1
> 語法：`# H1`
>
> ## H2
> 語法：`## H2`
>
> ### H3
> 語法：`### H3`
>
> #### H4
> 語法：`#### H4`
>
> ##### H5
> 語法：`##### H5`
>
> ###### H6
> 語法：`###### H6`


# 段落與空行

第一段

第二段

第一行  
第二行

語法：`在兩行間插入空行會產生段落，在一行的結束插入兩個空白在換行會產生強置換行`



# 區塊

## 小區塊

`區塊內容`

語法：``用一個或兩個反單引號（`區塊內容`）把內容包起來``  

註：如果要在區塊中插入反單引號可以使用兩個反單引號包住內容

## 大區塊

```
區塊內容
```

````
語法：用三個或四反單引號把內容包起來

　　　```  
　　　區塊內容
　　　```
````

註一：如果要在區塊中插入三個反單引號可以使用四個反單引號包住內容  
註二：使用四個反單引號的時候在 Atom 上顯示是正常的，不過轉換成 HTML 後會有問題（會變成四個反單引號，而不是 code 標籤


# 階層

> 國家
>> 台灣
>>> 新北市

>>美國
>>> 紐約

>>> 洛杉磯

>>> 芝加哥

>> 日本
>>> 東京

>>> 大阪

語法：`用 > 的數量區分階層`


# 項目符號

## 項目

* 紅
* 橙
* 藍
* 綠
* 藍
* 靛
* 紫

語法：`用 * 號產生項目`

## 數字

1. 零
2. 一
3. 二
4. 三
5. 四
6. 五
7. 六
8. 七
9. 八
10. 九
11. 十

語法：`1. 、2. 、3. ........，以此方式排序`


# 水平線

---

語法：使用 --- 符號產生水平線


# 超連結

## 第一種方法

[什麼是 Markdown](https://zh.wikipedia.org/wiki/Markdown)

語法：`[顯示文字](連結網址)`

## 第二種方法

這裡有兩個 Markdown 的教學網站[第一個][1]、[第二個][2]。

[1]: https://wastemobile.gitbooks.io/gitbook-chinese/content/format/markdown.html
[2]: https://kingofamani.gitbooks.io/git-teach/content/chapter_6_gitbook/markdown.html

```
語法：
　　　內容[顯示文字 1][數字 1]........[顯示文字 2][數字 2].....

　　　[數字 1]: 超連結 1
　　　[數字 2]: 超連結 2
```

## 第三種方法：自動連結

這是 Google 的網址：<http://google.com>

語法：`<網址>`


# 強調語法

粗體：**Hello World**

語法：`**文字內容**`

斜體：*Hello World*

語法：`*文字內容*`

刪除線：~~Hello World~~

語法：`~~文字內容~~`


# 表格

| 123 | 456 | 789 |
| :-- | --: | :-: |
| 4   | 5   | 6   |
| 7   | 8   | 9   |

```
語法：
　　　| 表頭 | 表頭 | 表頭 |
　　　| 對齊 | 對齊 | 對齊 |
　　　| 內容 | 內容 | 內容 |
　　　| 內容 | 內容 | 內容 |

```

註：「:」用途是對齊，放在左邊靠左、右邊靠右、都放置中


# 程式碼

* javascript:
```js
function helloWorld() {
  console.log('Hello World');
}
```

* python:
```python
def hello_world():
    print('Hello World')
```

````
語法：寫法像是大區塊，利用三個反單引號將程式碼包起來，在開頭的三個反單引號後加上語言名稱

　　　```語言名稱
　　　程式碼.......
　　　```
````

註：Markdown 支援的語言可以參考 *[Syntax highlighting in markdown](http://support.codebasehq.com/articles/tips-tricks/syntax-highlighting-in-markdown)*


# 圖片

![Markdown](https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Markdown-mark.svg/208px-Markdown-mark.svg.png)

語法：`![圖片描述](圖片連結)`


# 影片

<iframe width="560" height="315" src="https://www.youtube.com/embed/6A5EpqqDOdk" frameborder="0" allowfullscreen></iframe>

<br>
語法：直接使用 HTML 語法


# HTML 語法

<h3>在 Markdown 中可以直接使用 HTML 語法</h3>

`<h3>被包在區塊中的語法不會被執行</h3>`


# 跳脫字元

語法：`在特殊符號前插入「\」即可`


# 參考資料

1. <https://wastemobile.gitbooks.io/gitbook-chinese/content/format/markdown.html>
2. <https://kingofamani.gitbooks.io/git-teach/content/chapter_6_gitbook/markdown.html>
3. <http://markdown.tw/>
