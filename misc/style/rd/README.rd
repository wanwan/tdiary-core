=begin
= RDスタイル
== RDスタイルとは
Ruby 関連のドキュメントを書くために考案された汎用のドキュメントフォーマット
RD風の書式で日記を記述できます。

* ((<What is RD? What is RDtool?|URL:http://www2.pos.to/~tosh/ruby/rdtool/ja/whats.html>))

== RDスタイルを使うために
RDスタイルを使うには RDtool がインストールされている必要があります。 RDtool
は RAA((-Ruby Application Archive-)) から入手できます。

((<RDtool|URL:http://raa.ruby-lang.org/list.rhtml?name=rdtool>))

== RD との違い
=== Headline element
'=' 1つが <h3> になりセクションの開始になります。'==' が <h4>、'===' が <h5>、
'====' が <h6> となります。'+'、'++' は使用しません。

=== Inline element
==== プラグイン
本来はキーボード入力を表す (('((% %))')) が tDiary のプラグインになります。

 ((%amazon '4906470068'%))

==== 生HTML
(('((: :))')) で囲むと生の HTML を記述できます。

 ((:<del>この部分は取り消し</de>:))

==== URL
URL 以外に画像、RAA、Ruby関連のメーリングリストへのリンクが RWiki
((-書式にRDを使用するWikiクローン-)) 同様、簡単に記述できるようになっていま
す。

 ((<テスト画像|"IMG:test.jpg">))
 ((<RAA:tdiary>))
 ((<ruby-list:0001>))

=== その他
'=begin', '=end' は必要ありません。

=end

