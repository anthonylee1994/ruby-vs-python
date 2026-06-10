# Python vs Ruby 總結

Python 通常優先追求明確、穩定、易讀。
Ruby 通常優先追求表達力、自然語感、寫起嚟順手。

## 1. Strings

- Python：常用 f-string、len(value)、value.upper()、substring in value
- Ruby：常用 #{ } interpolation、value.length、value.upcase、value.include?(substring)
- 重點分別：Ruby method 名好多時讀起嚟似英文；Python 對通用操作通常偏向用明確 built-in function。

## 2. Arrays / Lists

- Python：用 list、append、list slicing、list comprehension
- Ruby：用 Array、push、range、map/select block
- 重點分別：Python 好常用 list comprehension；Ruby 多數靠 Enumerable method 加 block。

## 3. Functions / Methods

- Python：def function_name(...):，通常明確寫 return
- Ruby：def method_name(...)，最後一個 expression 會 implicit return
- 重點分別：Ruby method 較常省略括號同 return；Python 就偏向明確。

## 4. Hashes / Dicts

- Python：dict 常見用 string key：user['name']
- Ruby：Hash 常見用 symbol key：user[:name]
- 重點分別：Ruby framework-style API 好常用 symbol-key hash；Python 處理 JSON-like data 通常用 string key。

## 5. Classes

- Python：用 **init**、self.name，method 要明確收 self
- Ruby：用 initialize、@name、attr_reader，instance method 入面 self 多數係 implicit
- 重點分別：Python 會將 receiver 寫清楚；Ruby 會收起多啲樣板碼，亦有 attribute helper。

## 6. Basic Polymorphism

- Python：只要 object 有預期 method，duck typing 就用到
- Ruby：duck typing 係核心風格：respond 到個 method 就可以用
- 重點分別：兩邊都支援 duck typing，但 Ruby code 通常更加自然咁擁抱呢種寫法。

## 7. Advanced Polymorphism

- Python：Protocol 可以描述預期 interface，但 runtime 仍然係 duck-typed
- Ruby：strategy object 多數靠 respond_to? 或團隊 convention
- 重點分別：Python 有 optional type 工具；Ruby 通常靠 object 行為同測試守住契約。

## 8. Blocks / Lambdas

- Python：callback 通常係 function 或 lambda，當 argument 傳入去
- Ruby：block 係 method-call syntax 一部分，可以用 yield
- 重點分別：Ruby block 係同 Python 最明顯嘅手感差異之一。

## 9. Error Handling

- Python：try / except / else / finally
- Ruby：begin / rescue / ensure，或者直接喺 method 入面 rescue
- 重點分別：概念上兩邊相似，但 Ruby 可以將 method-level rescue 寫得好短。

## 10. Modules / Mixins

- Python：mixin 通常用 multiple inheritance
- Ruby：module 可以 include 入 class
- 重點分別：Ruby module 係分享行為嘅一等工具，唔一定要靠普通 inheritance。

## 11. Enumeration

- Python：enumerate、sum、map/filter、comprehension
- Ruby：each.with_index、sum、map、select
- 重點分別：Ruby Enumerable 提供好豐富、可以 chain 嘅 collection vocabulary。

## 12. Comprehensions vs Enumerable

- Python：list/set/dict comprehension 係 idiomatic 寫法
- Ruby：map、filter_map、flat_map、to_h 係 idiomatic 寫法
- 重點分別：Python 將 transformation syntax 放入語言；Ruby 就保留 method/block 風格。

## 13. None / Nil / Truthiness

- Python：None、False、0、空 string、空 list、空 dict 都係 falsy
- Ruby：只有 nil 同 false 係 falsy
- 重點分別：呢個係實戰好易中伏嘅位：0、''、[] 喺 Ruby 都係 truthy。

## 14. Keyword Arguments

- Python：keyword-only argument 用 \* 放喺 signature 入面
- Ruby：keyword argument 用 name: syntax
- 重點分別：兩邊都支援 keyword argument，但 Ruby API 好常重度使用 keyword-style options。

## 15. File IO

- Python：常用 pathlib 同 with block
- Ruby：常用 File.read/write/open 加 block
- 重點分別：兩邊都有 block/context pattern 去安全處理 resource。

## 16. Regular Expressions

- Python：用 re module
- Ruby：regex literal 例如 /pattern/ 係日常 syntax 一部分
- 重點分別：Ruby 令 regex 感覺更 native；Python 就放喺 standard library module 入面。

## 17. Decorators / Wrappers

- Python：decorator 用 @decorator syntax
- Ruby：wrapping behavior 多數用 block、module 或 metaprogramming 做
- 重點分別：Python 有專用 decorator syntax；Ruby 方法更彈性，但 pattern 冇咁統一。

## 18. Metaprogramming

- Python：getattr、setattr、decorator、descriptor
- Ruby：method_missing、define_method、open class
- 重點分別：Ruby 文化更接受 metaprogramming，方便寫 DSL，但亦可能令行為收埋咗。

## 19. Pattern Matching

- Python：match / case，支援 mapping 同 sequence pattern
- Ruby：case / in，支援 hash 同 array pattern
- 重點分別：兩邊而家都有 structural pattern matching，但 syntax 同社群用法唔同。

## 20. Concurrency

- Python：asyncio async/await，加 threading/process 工具
- Ruby：Thread 易上手；Fiber/Ractor/async gem 處理更進階 case
- 重點分別：Python 有好明顯嘅 async/await 標準模型；Ruby concurrency 選擇就比較分散。
