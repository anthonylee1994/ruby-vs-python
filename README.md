# Ruby vs Python：哲學上嘅分別

Ruby 同 Python 都係高階、動態、重視可讀性嘅語言，但佢哋背後嘅設計哲學好唔同。簡單講：Ruby 更重視「寫程式嗰個人開心」，Python 更重視「讀程式嗰個人清楚」。

## 一句講晒

- Ruby：追求表達力、自然語感、DSL、開發者幸福感。
- Python：追求清晰、明確、一致、易讀易維護。

## Syntax 對照例子

每個主題都有一個 `.rb` 同一個 `.py`：

- `1-strings.rb` / `1-strings.py`
- `2-arrays.rb` / `2-arrays.py`
- `3-functions.rb` / `3-functions.py`
- `4-hashes_and_dicts.rb` / `4-hashes_and_dicts.py`
- `5-classes.rb` / `5-classes.py`
- `6-polymorphism.rb` / `6-polymorphism.py`
- `7-advanced-polymorphism.rb` / `7-advanced-polymorphism.py`
- `8-blocks_lambdas.rb` / `8-blocks_lambdas.py`
- `9-error_handling.rb` / `9-error_handling.py`
- `10-modules_mixins.rb` / `10-modules_mixins.py`
- `11-enumeration.rb` / `11-enumeration.py`
- `12-comprehensions_vs_enumerable.rb` / `12-comprehensions_vs_enumerable.py`
- `13-none_nil_truthiness.rb` / `13-none_nil_truthiness.py`
- `14-keyword_arguments.rb` / `14-keyword_arguments.py`
- `15-file_io.rb` / `15-file_io.py`
- `16-regular_expressions.rb` / `16-regular_expressions.py`
- `17-decorators_vs_wrappers.rb` / `17-decorators_vs_wrappers.py`
- `18-metaprogramming.rb` / `18-metaprogramming.py`
- `19-pattern_matching.rb` / `19-pattern_matching.py`
- `20-concurrency.rb` / `20-concurrency.py`

執行方式：

```sh
ruby 1-strings.rb
python3 1-strings.py
```

其他主題同樣將檔名換走就得，例如：

```sh
ruby 6-polymorphism.rb
python3 6-polymorphism.py
```

可以留意幾個 syntax 分別：

- Ruby string interpolation 用 `"Hello, #{name}"`；Python 用 f-string，例如 `f"Hello, {name}"`。
- Ruby array 常用 `map` / `select` block；Python list 常用 list comprehension。
- Ruby hash 常用 symbol key，例如 `user[:name]`；Python dict 常用 string key，例如 `user["name"]`。
- Ruby method 最後一行可以 implicit return；Python function 通常會明確 `return`。
- Ruby instance variable 用 `@name`；Python instance attribute 通常用 `self.name`。
- Ruby polymorphism 常見係 duck typing：物件有同名 method 就得；Python 都可以用 duck typing，用法較明確地經 `self` method 定義。
- `7-advanced-polymorphism` 示範 strategy object / dependency injection：checkout pipeline 唔需要知道實際 discount、tax、receipt class，只要物件有相應 method 就可以互換。
- Ruby block 係語言核心設計；Python 通常用 function / lambda / decorator 表達類似 callback 或 wrapping 行為。
- Ruby `nil` 同 `false` 先係 falsy；Python 入面 `None`、`False`、`0`、空 string、空 list、空 dict 都係 falsy。
- Ruby 常用 `Enumerable` chain，例如 `map` / `select` / `sum`；Python 常用 comprehension、generator expression 同標準 library function。
- Ruby module 可以 `include` 做 mixin；Python 通常用 multiple inheritance 或 composition 做類似效果。
- Python 有 `asyncio` 作為 async/await 標準模型；Ruby 常見入門寫法係 `Thread`，更進階可以再研究 Fiber / Ractor / async gem。

## Ruby：為咗表達而設計

Ruby 嘅核心哲學通常會被總結成「developer happiness」。佢唔只係想程式可以運行，而係想寫 code 嘅過程順手、自然、有美感。

Ruby 好鼓勵你寫出接近英文或者 domain language 嘅 code。例如 Rails 入面好多 API 都似一句句描述：

```ruby
validates :email, presence: true
has_many :comments
before_action :authenticate_user
```

呢種風格背後嘅想法係：程式語言應該貼近人嘅表達，而唔係逼人完全遷就機器。Ruby 會畀你好多語法彈性，例如省略括號、block、method missing、open class、metaprogramming。好處係可以寫到好漂亮、好有表達力嘅 abstraction；壞處係如果團隊冇紀律，code 可能會變得太魔法，讀嗰個人要估背後發生咩事。

## Python：為咗清晰而設計

Python 嘅哲學可以喺 `import this` 入面見到，其中最出名係：

```text
Explicit is better than implicit.
There should be one-- and preferably only one --obvious way to do it.
Readability counts.
```

Python 唔係冇表達力，但佢通常會偏向「一眼睇得明」多過「寫得最優雅」。例如 Python 用 indentation 作為語法一部分，強制大家用相近嘅排版方式。佢亦比較少鼓勵太重嘅 metaprogramming，因為 Python 社群普遍重視直接、透明、容易 debug。

Python 嘅設計態度係：code 會被讀好多次，所以讀起嚟要少驚喜。呢個好適合 data science、automation、backend service、教育同大型團隊協作。代價係有時會覺得比較囉嗦，或者冇 Ruby 咁容易寫出好似自然語言嘅 DSL。

## 對「優雅」嘅理解唔同

Ruby 覺得優雅係：

- code 好似人話；
- abstraction 可以好貼近 domain；
- 語法唔阻住你表達；
- framework 可以提供強大慣例同魔法。

Python 覺得優雅係：

- code 一眼睇得明；
- 行為明確，少隱藏機制；
- 風格一致，少個人花款；
- 新人接手都唔需要估太多。

所以 Ruby 嘅優雅偏向「表達嘅美感」，Python 嘅優雅偏向「理解嘅穩定」。

## 慣例同自由

Ruby，特別係 Rails，出名係「convention over configuration」。佢會畀你一套強烈慣例，只要跟住做，就可以好快起到功能。Ruby 本身亦好自由，甚至可以改 core class：

```ruby
class String
  def shout
    upcase + "!"
  end
end
```

Python 都有慣例，但佢一般唔鼓勵太隨便改語言本身嘅行為。Python 更傾向用明確嘅 module、class、function 組織 code。你可以寫得好 dynamic，但社群文化通常會問：咁做係咪真係值得？

## 魔法嘅取捨

Ruby 接受「好用嘅魔法」。如果魔法可以令 API 好順、令 business logic 好似自然語言，Ruby 社群好多時會覺得值得。

Python 對魔法比較警惕。唔係完全拒絕，而係要求魔法背後要容易理解、容易追蹤、容易 debug。Python 嘅典型態度係：清楚比聰明重要。

## 適合咩人

Ruby 適合鍾意 expressive code、DSL、快速產品開發、Rails-style convention 嘅人。你會享受語言畀你嘅彈性，但亦要接受彈性帶嚟嘅維護風險。

Python 適合重視清晰、穩定、廣泛用途、團隊協作同工具生態嘅人。你未必會覺得語法最浪漫，但通常會覺得可靠、直接、易教易用。

## 總結

Ruby 問：「點樣令寫 code 更自然、更開心？」

Python 問：「點樣令 code 更清楚、更一致、更容易讀？」

兩者都唔係絕對好壞，而係價值排序唔同。Ruby 將表達力同開發者感受放得更前；Python 將可讀性、明確性同一致性放得更前。揀邊個，唔只係揀語法，而係揀一套你願意長期接受嘅工程文化。
