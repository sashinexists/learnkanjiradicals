module Radicals exposing (radicals)

import Meaning exposing (..)
import Multilingual exposing (..)
import Part exposing (..)
import Radical exposing (Radical)
import Subject exposing (..)


radicals : List Radical
radicals =
    [ Radical '水' {copy="みず", translations=[(En, "Water (みず)"), (Ja, "みず")]}  Same [ '氵' ] None [] Nature
    , Radical '氵' {copy="さんずい", translations=[(En, "Three drops (さんずい)"), (Ja, "さんずい")]} (Different { copy = "水", translations = [ ( En, "Water" ), ( Ja, "水" ) ] }) [ '水' ] None [] Nature
    , Radical '木' {copy="き", translations=[(En, "Tree"), (Ja, "き")]} Same [] None [] Nature
    , Radical '土' {copy="つち", translations=[(En, "Dirt, Earth"), (Ja, "つち")]} Same [] None [] Nature
    , Radical '日' {copy="ひ", translations=[(En, "Sun"), (Ja, "ひ")]} Same [] None [] Nature
    , Radical '艸' {copy="くさ", translations=[(En, "Grass"), (Ja, "くさ")]} Same [ '艹' ] None [] Nature
    , Radical '艹' {copy="くさかんむり", translations=[(En, "Grass (Crown)"), (Ja, "くさかんむり")]} (Different { copy = "草", translations = [ ( En, "Grass" ), ( Ja, "草" ) ] }) [ '艸' ] Top [] Nature
    , Radical '火' {copy="ひ", translations=[(En, "Fire"), (Ja, "ひ")]} Same [ '灬' ] None [] Nature
    , Radical '灬' {copy="れっか", translations=[(En, "Raging Fire (れっか)"), (Ja, "れっか")]} (Different { copy = "火", translations = [ ( En, "Fire" ), ( Ja, "火" ) ] }) [ '火' ] Bottom [] Nature
    , Radical '田' {copy="た", translations=[(En, "Rice Paddy"), (Ja, "た")]} Same [] None [] Nature
    , Radical '貝' {copy="かい", translations=[(En, "Shell"), (Ja, "かい")]} Same [] None [] Nature
    , Radical '頁' {copy="おおがい", translations=[(En, "Big Shell"), (Ja, "おおがい")]} Same [] Right [] Nature
    , Radical '月' {copy="つき", translations=[(En, "Moon (つき)"), (Ja, "つき")]} Same [] None [] Nature
    , Radical '石' {copy="いし", translations=[(En, "Stone"), (Ja, "いし")]} Same [] None [] Nature
    , Radical '川' {copy="さんぼんがわ", translations=[(En, "River"), (Ja, "さんぼんがわ")]} (Different { copy = "かわ", translations = [ ( En, "River" ), ( Ja, "かわ" ) ] }) [] None [] Nature
    , Radical '山' {copy="やま", translations=[(En, "Mountain"), (Ja, "やま")]} Same [] None [] Nature
    , Radical '雨' {copy="あめ", translations=[(En, "Rain"), (Ja, "あめ")]} Same [] None [] Nature
    , Radical '⽓' {copy="きがまえ", translations=[(En, "Steam (Enclosure)"), (Ja, "きがまえ")]} (Different { copy = "蒸気", translations = [ ( En, "Steam" ), ( Ja, "蒸気" ) ] }) [] Enclose [] Nature
    , Radical '冫' {copy="にすい", translations=[(En, "Two Drops"), (Ja, "にすい")]} (Different { copy = "氷・二つの水敵", translations = [ ( En, "Ice or two drops of water" ), ( Ja, "氷・二つの水敵" ) ] }) [] Left [] Nature
    , Radical '穴' {copy="あな", translations=[(En, "Hole"), (Ja, "あな")]} (Different { copy = "洞窟・穴", translations = [ ( En, "Cave or Hole" ), ( Ja, "洞窟・穴" ) ] }) [] None [] Nature
    , Radical '谷' {copy="たに", translations=[(En, "Valley"), (Ja, "たに")]} Same [] None [] Nature
    , Radical '支' {copy="しにょう", translations=[(En, "Branch (Bottom)"), (Ja,"しにょう"  )]} (Different { copy = "枝", translations = [ ( En, "Branch" ), ( Ja, "枝" ) ] }) [] None [] Nature
    , Radical '口' {copy="くち" , translations=[(En, "Mouth"), (Ja,"くち"  )]} Same [] None [] BodyParts
    , Radical '手' {copy="て" , translations=[(En, "Hand"), (Ja,"て"  )]} Same [ '扌' ] None [] BodyParts
    , Radical '扌' {copy="てへん" , translations=[(En, "Hand (Left)"), (Ja,"てへん"  )]} (Different { copy = "手", translations = [ ( En, "Hand" ), ( Ja, "手" ) ] }) [ '手' ] None [] BodyParts
    , Radical '心' {copy="こころ" , translations=[(En, "Heart"), (Ja,"こころ"  )]} Same [ '⺗', '⺖' ] None [] BodyParts
    , Radical '⺗' {copy="したごころ" , translations=[(En, "Heart (Bottom)"), (Ja,"したごころ"  )]} (Different { copy = "心", translations = [ ( En, "Heart" ), ( Ja, "心" ) ] }) [ '心', '⺖' ] Bottom [] BodyParts
    , Radical '⺖' {copy="りっしんべん" , translations=[(En, "Heart (Left)"), (Ja,"りっしんべん"  )]} (Different { copy = "心", translations = [ ( En, "Heart" ), ( Ja, "心" ) ] }) [ '心', '⺗' ] Left [] BodyParts
    , Radical '肉' {copy="にく" , translations=[(En, "Meat"), (Ja,"にく"  )]} Same [ '月' ] None [] BodyParts
    , Radical '月' {copy="にくづき" , translations=[(En, "Meat (Side)"), (Ja,"にくづき"  )]} Same [] None [] BodyParts
    , Radical '目' {copy= "め", translations=[(En, "Eye"), (Ja,"め"  )]} Same [] None [] BodyParts
    , Radical '儿' {copy="ひとあし" , translations=[(En, "Person's Legs"), (Ja,"ひとあし"  )]} Same [] Bottom [] BodyParts
    , Radical '欠' {copy= "あくび", translations=[(En, ""), (Ja,"あくび"  )]} Same [] None [] BodyParts
    , Radical '尸' {copy="しかばね" , translations=[(En, "Corpse"), (Ja,"しかばね"  )]} (Different { copy = "死体", translations = [ ( En, "Corpse" ), ( Ja, "死体" ) ] }) [] Hang [] BodyParts
    , Radical '癶' {copy="はつがしら" , translations=[(En, "Tent"), (Ja,"はつがしら"  )]} (Different { copy = "足音", translations = [ ( En, "Footsteps" ), ( Ja, "足音" ) ] }) [] Top [] BodyParts
    , Radical '足' {copy="あし" , translations=[(En, "Legs"), (Ja,"あし"  )]} Same [] None [] BodyParts
    , Radical '首' {copy="くび" , translations=[(En, "Neck"), (Ja,"くび"  )]} Same [] None [] BodyParts
    , Radical '身' {copy="み" , translations=[(En, "Body"), (Ja,"み"  )]} Same [] None [] BodyParts
    , Radical '皮' {copy="けがわ" , translations=[(En, "Skin"), (Ja,"けがわ"  )]} (Different { copy = "肌", translations = [ ( En, "Skin" ), ( Ja, "肌" ) ] }) [] None [] BodyParts
    , Radical '彡' {copy="さんづくり" , translations=[(En, "Three, Hair Ornament"), (Ja,"さんづくり"  )]} (Different { copy = "髪・三", translations = [ ( En, "Hair or Three" ), ( Ja, "髪・三" ) ] }) [] Right [] BodyParts
    , Radical '血' {copy="ち" , translations=[(En, "Blood"), (Ja,"ち"  )]} Same [] None [] BodyParts
    , Radical '歯' {copy="は" , translations=[(En, "Tooth"), (Ja,"は"  )]} Same [] None [] BodyParts
    , Radical '人' {copy="ひと" , translations=[(En, "Person"), (Ja,"ひと"  )]} Same [ '亻', '𠆢' ] None [] People
    , Radical '亻' {copy="にんべん" , translations=[(En, "Person (Left)"), (Ja,"にんべん"  )]} (Different { copy = "人", translations = [ ( En, "Person" ), ( Ja, "人" ) ] }) [ '人', '𠆢' ] Left [] People
    , Radical '𠆢' {copy="ひとやね" , translations=[(En, "Person (Top)"), (Ja,"ひとやね"  )]} (Different { copy = "人", translations = [ ( En, "Person" ), ( Ja, "人" ) ] }) [ '人', '亻' ] Top [] People
    , Radical '女' {copy="おんな" , translations=[(En,  "Womamn"), (Ja,"おんな"  )]} Same [] None [] People
    , Radical '雨' {copy="あめ" , translations=[(En, "Rain"), (Ja,"あめ"  )]} Same [] None [] People
    , Radical '老' {copy="おいかんむり" , translations=[(En, "Old (Crown/Top)"), (Ja,"おいかんむり"  )]} (Different { copy = "お年寄り", translations = [ ( En, "Elderly" ), ( Ja, "お年寄り" ) ] }) [ '耂' ] None [] People
    , Radical '耂' {copy="おいかんむり" , translations=[(En, "Old (Crown/Top)"), (Ja,"おいかんむり"  )]} (Different { copy = "お年寄り", translations = [ ( En, "Elderly" ), ( Ja, "お年寄り" ) ] }) [ '老' ] Top [] People
    , Radical '王' {copy="おう" , translations=[(En, "King"), (Ja,"おう"  )]} Same [] None [] People
    , Radical '⽟' {copy="たま" , translations=[(En, "Ball"), (Ja,"たま"  )]} Same [] None [] People
    , Radical '子' {copy="こ" , translations=[(En, "Child"), (Ja,"こ"  )]} Same [] None [] People
    , Radical '氏' {copy="うじ" , translations=[(En, "Clan"), (Ja,"うじ"  )]} (Different { copy = "家族の名前", translations = [ ( En, "Family Name" ), ( Ja, "家族の名前" ) ] }) [] None [] People
    , Radical '士' {copy="さむらい" , translations=[(En, "Samurai"), (Ja,"さむらい"  )]} Same [] None [] People
    , Radical '臣' {copy="しん" , translations=[(En, "Sincerity"), (Ja,"しん"  )]} (Different { copy = "政府の役人", translations = [ ( En, "Government Official" ), ( Ja, "政府の役人" ) ] }) [] None [] People
    , Radical '自' {copy="みずから" , translations=[(En, "Onself"), (Ja,"みずから"  )]} (Different { copy = "自分", translations = [ ( En, "Oneself" ), ( Ja, "自分" ) ] }) [] None [] People
    , Radical '己' {copy="おのれ" , translations=[(En, "Oneself"), (Ja,"おのれ"  )]} Same [] None [] People
    , Radical 'ム' {copy="む" , translations=[(En, "Katakana ム"), (Ja,"む"  )]} (Different { copy = "民間・カタカナのム", translations = [ ( En, "Private, Katakana \"ム\"" ), ( Ja, "民間・カタカナのム" ) ] }) [] None [] People
    , Radical '辶' {copy="しんにょう" , translations=[(En, "Road, Advance"), (Ja,"しんにょう"  )]} (Different { copy = "動き・歩く・進む", translations = [ ( En, "Movement, Walking, Advancing" ), ( Ja, "動き・歩く・進む" ) ] }) [] Wrap [] Enclosures
    , Radical '疒' {copy="やまいだれ" , translations=[(En, "Illness"), (Ja,"やまいだれ"  )]} (Different { copy = "病気", translations = [ ( En, "Sickness" ), ( Ja, "病気" ) ] }) [] Hang [] Enclosures
    , Radical '⼴' {copy="まだれ" , translations=[(En, "Dotted Cliff"), (Ja,"まだれ"  )]} (Different { copy = "屋上", translations = [ ( En, "Rooftop" ), ( Ja, "屋上" ) ] }) [] Hang [] Enclosures
    , Radical '彳' {copy="ぎょうにんべん" , translations=[(En, "\"Going\" Man"), (Ja,"ぎょうにんべん"  )]} (Different { copy = "歩", translations = [ ( En, "Step" ), ( Ja, "歩" ) ] }) [] Left [] Enclosures
    , Radical '阝' {copy="こざとへん" , translations=[(En, "Mound, Small Village"), (Ja,"こざとへん"  )]} (Different { copy = "左の村", translations = [ ( En, "Village (\"Left\")" ), ( Ja, "左の村" ) ] }) [] Left [] Enclosures
    , Radical '阝' {copy="おおざと" , translations=[(En, "Large Village"), (Ja,"おおざと"  )]} (Different { copy = "左の村", translations = [ ( En, "Village (\"Right\")" ), ( Ja, "左の村" ) ] }) [] Right [] Enclosures
    , Radical '囗' {copy="くにがまえ" , translations=[(En, "Box, Country"), (Ja,"くにがまえ"  )]} (Different { copy = "国境", translations = [ ( En, "Country Border" ), ( Ja, "国境" ) ] }) [] Enclose [] Enclosures
    , Radical '門' {copy="もんがまえ" , translations=[(En, "Gate"), (Ja,"もんがまえ"  )]} (Different { copy = "もん", translations = [ ( En, "Gate" ), ( Ja, "もん" ) ] }) [] Enclose [] Enclosures
    , Radical '宀' {copy="う かんむり" , translations=[(En, "ゥ Crown"), (Ja,"う かんむり"  )]} (Different { copy = "屋上・カタカナのゥ", translations = [ ( En, "Rooftop, Katakana \"ウ\"" ), ( Ja, "屋上・カタカナのゥ" ) ] }) [] Top [] Enclosures
    , Radical '亠' {copy="なべぶた" , translations=[(En, "Pot Lid"), (Ja,"なべぶた"  )]} Same [] Top [] Enclosures
    , Radical '廴' {copy="えんにょう" , translations=[(En, "Stretch"), (Ja,"えんにょう"  )]} (Different { copy = "伸ばす・長いステップ", translations = [ ( En, "To Lengthen, A Long Stride" ), ( Ja, "伸ばす・長いステップ" ) ] }) [] Wrap [] Enclosures
    , Radical '⼚' {copy="がんだれ" , translations=[(En, "Cliff"), (Ja,"がんだれ"  )]} (Different { copy = "崖", translations = [ ( En, "Cliff" ), ( Ja, "崖" ) ] }) [] Hang [] Enclosures
    , Radical '勹' {copy="つつみがまえ" , translations=[(En, "Wrapping"), (Ja,"つつみがまえ"  )]} (Different { copy = "包装", translations = [ ( En, "Wrapping" ), ( Ja, "包装" ) ] }) [] Enclose [] Enclosures
    , Radical '⼐' {copy="かんにょう" , translations=[(En, "Box"), (Ja,"かんにょう"  )]} (Different { copy = "受け箱", translations = [ ( En, "Inbox" ), ( Ja, "受け箱" ) ] }) [] Wrap [] Enclosures
    , Radical '匚' {copy="はこがまえ" , translations=[(En, "Box on Side"), (Ja,"はこがまえ"  )]} (Different { copy = "箱", translations = [ ( En, "Box" ), ( Ja, "箱" ) ] }) [] Enclose [] Enclosures
    , Radical '丶' {copy="てん" , translations=[(En, "Dot"), (Ja,"てん"  )]} Same [] None [] Enclosures
    , Radical '⺍' {copy="つ かんむり" , translations=[(En, "ツ Crown"), (Ja,"つ かんむり"  )]} (Different { copy = "カタカナのツ", translations = [ ( En, "Katakana \"ツ\"" ), ( Ja, "カタカナのツ" ) ] }) [] Top [] Enclosures
    , Radical '冖' {copy="わかんむり" , translations=[(En, "ワ Crown"), (Ja,"わかんむり"  )]} (Different { copy = "覆う・冠", translations = [ ( En, "To Cover, Crown" ), ( Ja, "覆う・冠" ) ] }) [] Top [] Enclosures
    , Radical '丿' {copy="の" , translations=[(En, "Katana ノ"), (Ja,"の"  )]} (Different { copy = "カタカナのノ", translations = [ ( En, "Katakana ノ" ), ( Ja, "カタカナのノ" ) ] }) [] None [] Enclosures
    , Radical '亅' {copy="はねぼう" , translations=[(En, "Feather, Stick"), (Ja,"はねぼう"  )]} (Different { copy = "釣り針", translations = [ ( En, "Fishing Hook" ), ( Ja, "釣り針" ) ] }) [] None [] Enclosures
    , Radical '言' {copy="げん" , translations=[(En, "Speech"), (Ja,"げん"  )]} (Different { copy = "話している", translations = [ ( En, "Speaking" ), ( Ja, "釣り針" ) ] }) [] None [] VerbsAndLanguage
    , Radical '食' {copy="しょく" , translations=[(En, "Meal"), (Ja,"しょく"  )]} Same [ '飠' ] None [] VerbsAndLanguage
    , Radical '飠' {copy="しょくへん" , translations=[(En, "Meal (Left)"), (Ja,"しょくへん"  )]} (Different { copy = "食べ物", translations = [ ( En, "Food" ), ( Ja, "食べ物" ) ] }) [ '食' ] Left [] VerbsAndLanguage
    , Radical '示' {copy="しめす" , translations=[(En, "Altar, Festival"), (Ja,"しめす"  )]} Same [ '礻' ] None [] VerbsAndLanguage
    , Radical '礻' {copy="しめすへん" , translations=[(En, "Alter, Festival (Left)"), (Ja,"しめすへん"  )]} (Different { copy = "示す", translations = [ ( En, "To Demonstrate" ), ( Ja, "示す" ) ] }) [ '示' ] Left [] VerbsAndLanguage
    , Radical '又' {copy="また" , translations=[(En, "Again, Right Hand"), (Ja,"また"  )]} (Different { copy = "また・右の手", translations = [ ( En, "Again, Right Hand" ), ( Ja, "また・右の手" ) ] }) [] None [] VerbsAndLanguage
    , Radical '立' {copy="たつ" , translations=[(En, "Stand"), (Ja,"たつ"  )]} Same [] None [] VerbsAndLanguage
    , Radical '止' {copy="とめる" , translations=[(En, "Stop"), (Ja,"とめる"  )]} Same [] None [] VerbsAndLanguage
    , Radical '工' {copy="たくみ" , translations=[(En, "Skillful"), (Ja,"たくみ"  )]} (Different { copy = "働く・カタカナのエ", translations = [ ( En, "Work, Katakana \"エ\"" ), ( Ja, "働く・カタカナのエ" ) ] }) [] None [] VerbsAndLanguage
    , Radical '⾒' {copy="みる" , translations=[(En, "See"), (Ja,"みる"  )]} Same [] None [] VerbsAndLanguage
    , Radical '走' {copy="はしる" , translations=[(En, "Run"), (Ja,"はしる"  )]} Same [] None [] VerbsAndLanguage
    , Radical '干' {copy="かん" , translations=[(En, "To Dry, Shield"), (Ja,"かん"  )]} (Different { copy = "干した", translations = [ ( En, "Dried" ), ( Ja, "干した" ) ] }) [] None [] VerbsAndLanguage
    , Radical '曰' {copy="ひらび" , translations=[(En, "Weekday"), (Ja,"ひらび"  )]} (Different { copy = "言う", translations = [ ( En, "To Speak" ), ( Ja, "言う" ) ] }) [] None [] VerbsAndLanguage
    , Radical '比' {copy="くらべる" , translations=[(En, "Compare"), (Ja,"くらべる"  )]} Same [] None [] VerbsAndLanguage
    , Radical '生' {copy="うまれる" , translations=[(En, "Birth"), (Ja,"うまれる"  )]} (Different { copy = "うまれる・住む", translations = [ ( En, "To be born, to live" ), ( Ja, "うまれる・住む" ) ] }) [] None [] VerbsAndLanguage
    , Radical '非' {copy="あらず" , translations=[(En, "Not"), (Ja,"あらず"  )]} (Different { copy = "違う・反対・カタカナのヒ", translations = [ ( En, "Difference, Opposite" ), ( Ja, "違う・反対・カタカナのヒ" ) ] }) [] None [] VerbsAndLanguage
    , Radical '⾏' {copy="ぎょうがまえ" , translations=[(En, "Going"), (Ja,"ぎょうがまえ"  )]} (Different ({copy="いく", translations=[(En, "Go, Move"), (Ja, "いく")]})) [] Enclose [] VerbsAndLanguage
    , Radical '竹' {copy="たけ" , translations=[(En, "Bamboo"), (Ja,"たけ"  )]} Same [] None [] NaturalMaterials
    , Radical '糸' {copy="いと" , translations=[(En, "Thread"), (Ja,"いと"  )]} Same [ '幺' ] None [] NaturalMaterials
    , Radical '幺' {copy="いとへん" , translations=[(En, "Thread (Left)"), (Ja,"いとへん"  )]} (Different ({copy="織物", translations=[(En, "Textiles, Fabric"), (Ja, "織物")]})) [ '糸' ] Left [] NaturalMaterials
    , Radical '金' {copy="かね" , translations=[(En, "Money"), (Ja,"かね"  )]} Same [] None [] NaturalMaterials
    , Radical '巾' {copy="はば" , translations=[(En, "Width"), (Ja,"はば"  )]} (Different ({copy="布", translations=[(En, "Cloth"), (Ja, "布")]})) [] None [] NaturalMaterials
    , Radical '衣' {copy="ころも" , translations=[(En, "Clothes"), (Ja,"ころも"  )]} Same [ '衤' ] None [] NaturalMaterials
    , Radical '衤' {copy="ころもへん" , translations=[(En, "Clothes (Left)"), (Ja,"ころもへん"  )]} (Different ({copy="衣服", translations=[(En, "Clothes"), (Ja, "衣服")]})) [ '衣' ] Left [] NaturalMaterials
    , Radical '麻' {copy="あさ" , translations=[(En, "Hemp"), (Ja,"あさ"  )]} Same [] None [] NaturalMaterials
    , Radical '韋' {copy="なめしがわ" , translations=[(En, "Leather"), (Ja,"なめしがわ"  )]} (Different ({copy="鞣皮", translations=[(En, "Leather"), (Ja,"鞣皮")]})) [] None [] NaturalMaterials
    , Radical '⽦' {copy="ひき" , translations=[(En, "Roll of Cloth"), (Ja,"ひき"  )]} Same [ '⺪' ] None [] NaturalMaterials
    , Radical '⺪' {copy="ひきへん" , translations=[(En, "Roll of Cloth (Left)"), (Ja,"ひきへん"  )]} (Different ({copy="⽦",translations=[(En, "Roll, Bolt of Cloth"), (Ja, "⽦")]})) [ '⽦' ] Left [] NaturalMaterials
    , Radical '一' {copy="いち" , translations=[(En, "One"), (Ja,"いち"  )]} (Different ({copy="一つ", translations=[(En, "One"), (Ja, "一つ")]})) [] None [] MathAndMeasurement
    , Radical '二' {copy="に" , translations=[(En, "Two"), (Ja,"に"  )]} (Different ({copy="二つ", translations=[(En, "Two"), (Ja, "二つ")]})) [] None [] MathAndMeasurement
    , Radical '八' {copy="はち" , translations=[(En, "Eight"), (Ja,"はち"  )]} (Different ({copy="八つ", translations=[(En, "Eight"),(Ja, "八つ")]})) [] None [] MathAndMeasurement
    , Radical '十' {copy="じゅう" , translations=[(En, "Ten"), (Ja,"じゅう"  )]} (Different ({copy="十つ", translations=[(En, "Ten"), (Ja, "十つ")]})) [] None [] MathAndMeasurement
    , Radical '寸' {copy="すん" , translations=[(En, "Measurement"), (Ja,"すん"  )]} Same [] None [] MathAndMeasurement
    , Radical '大' {copy="だい" , translations=[(En, "Big"), (Ja,"だい"  )]} (Different ({copy="大きい",translations=[(En, "Big"), (Ja, "大きい")]})) [] None [] MathAndMeasurement
    , Radical '小' {copy="しょう" , translations=[(En, "Small"), (Ja,"しょう"  )]} (Different ({copy="小さい", translations=[(En, "Small"), (Ja, "小さい")]})) [] None [] MathAndMeasurement
    , Radical '長' {copy="ながい" , translations=[(En, "Long"), (Ja,"ながい"  )]} Same [ '镸' ] None [] MathAndMeasurement
    , Radical '镸' {copy="ながいへん" , translations=[(En, "Long (Length)"), (Ja,"ながいへん"  )]} (Different ({copy="長い", translations=[(En, "Long"), (Ja, "長い")]})) [ '長' ] Left [] MathAndMeasurement
    , Radical '高' {copy="たかい" , translations=[(En, "Tall, Expensive"), (Ja,"たかい"  )]} Same [] None [] MathAndMeasurement
    , Radical '乙' {copy="おつ" , translations=[(En, "Second"), (Ja,"おつ"  )]} Same [ '乚' ] None [] MathAndMeasurement
    , Radical '乚' {copy="おつ" , translations=[(En, "Second"), (Ja,"おつ"  )]} (Different ({copy="乙", translations=[(En,"Second" ), (Ja, "乙")]})) [ '乙' ] None [] MathAndMeasurement
    , Radical '片' {copy="かた" , translations=[(En, "Template"), (Ja,"かた"  )]} (Different ({copy="切った木", translations=[(En, "Slice, Fragment"), (Ja, "切った木")]})) [] None [] MathAndMeasurement
    , Radical '釆' {copy="のごめ" , translations=[(En, "Field"), (Ja,"のごめ"  )]} (Different ({copy="分割する", translations=[(En, "Dividing, Splitting"), (Ja, "分割する")]})) [] None [] MathAndMeasurement
    , Radical '面' {copy="めん" , translations=[(En, "Face"), (Ja,"めん"  )]} (Different ({copy="面", translations=[(En, "Face"), (Ja, "面")]})) [] None [] MathAndMeasurement
    , Radical '方' {copy="ほう" , translations=[(En, "Direction"), (Ja,"ほう"  )]} (Different ({copy="方向", translations=[(En, "Direction"), (Ja, "方向")]})) [] None [] MathAndMeasurement
    , Radical '西' {copy="にし" , translations=[(En, "West"), (Ja,"にし"  )]} Same [ '⾑', '⻃' ] None [] MathAndMeasurement
    , Radical '⾑' {copy="にしへん" , translations=[(En, "West (Left)"), (Ja,"にしへん"  )]} (Different ({copy="西", translations=[(En, "West"), (Ja,"西" )]})) [ '西', '⻃' ] None [] MathAndMeasurement
    , Radical '⻃' {copy="にしへん" , translations=[(En, "West (Left)"), (Ja,"にしへん"  )]} (Different ({copy="西", translations=[(En, "West"), (Ja, "西")]})) [ '西', '⾑' ] None [] MathAndMeasurement
    , Radical '艮' {copy="こん" , translations=[(En, "This"), (Ja,"こん"  )]} (Different ({copy="境界", translations=[(En, "Boundary"), (Ja, "境界")]})) [] None [] MathAndMeasurement
    , Radical '斉' {copy="せい" , translations=[(En, "Blue"), (Ja,"せい"  )]} (Different ({copy="らしい", translations=[(En, "Even"), (Ja, "らしい")]})) [] None [] MathAndMeasurement
    , Radical '夂' {copy="ふゆ がしら" , translations=[(En, "Winter"), (Ja,"ふゆ がしら"  )]} (Different ({copy="冬",translations=[(En, "Winter"), (Ja, "冬")]})) [] None [] MathAndMeasurement
    , Radical '⼣' {copy="ゆうべ" , translations=[(En, "Evening"), (Ja,"ゆうべ"  )]} (Different ({copy="夕べ", translations=[(En, "Evening"), (Ja,"夕べ")]})) [] None [] MathAndMeasurement
    , Radical '米' {copy="こめ" , translations=[(En, "Rice"), (Ja,"こめ"  )]} Same [] None [] Food
    , Radical '禾' {copy="のぎへん" , translations=[(En, "Grain Stalk (Left)"), (Ja,"のぎへん"  )]} (Different ({copy="粒", translations=[(En, "Grain, Bread"), (Ja, "粒")]})) [] Left [] Food
    , Radical '皿' {copy="さら" , translations=[(En, "Plate"), (Ja,"さら"  )]} Same [] None [] Food
    , Radical '匕' {copy="さじのひ" , translations=[(En, "Spoon"), (Ja,"さじのひ"  )]} (Different ({copy="匙", translations=[(En, "Spoon"), (Ja, "匙")]})) [] Right [] Food
    , Radical '酉' {copy="ひよみのとり" , translations=[(En, "Bird of the Zodiac"), (Ja,"ひよみのとり"  )]} (Different ({copy="酒", translations=[(En, "Alcohol"), (Ja, "酒")]})) [] None [] Food
    , Radical '麦' {copy="むぎ" , translations=[(En, "Wheat"), (Ja,"むぎ"  )]} Same [] None [] Food
    , Radical '豆' {copy="まめ" , translations=[(En, "Beans"), (Ja,"まめ"  )]} Same [] None [] Food
    , Radical '馬' {copy="うま" , translations=[(En, "Horse"), (Ja,"うま"  )]} Same [] None [] Animals
    , Radical '犬' {copy="いぬ" , translations=[(En, "Dog"), (Ja,"いぬ"  )]} Same [ '⺨' ] None [] Animals
    , Radical '虫' {copy="むし" , translations=[(En, "Insect"), (Ja,"むし"  )]} Same [] None [] Animals
    , Radical '⺨' {copy="いぬ" , translations=[(En, "Dog"), (Ja,"いぬ"  )]} (Different ({copy="犬", translations=[(En, "Dog"), (Ja, "犬")]})) [ '犬' ] None [] Animals
    , Radical '羊' {copy="ひつじ" , translations=[(En, "Sheep"), (Ja,"ひつじ"  )]} Same [] None [] Animals
    , Radical '鳥' {copy="とり" , translations=[(En, "Bird"), (Ja,"とり"  )]} Same [] None [] Animals
    , Radical '隹' {copy="ふるとり" , translations=[(En, "Old Bird"), (Ja,"ふるとり"  )]} Same [] None [] Animals
    , Radical '羽' {copy="はね" , translations=[(En, "Wing, Feather"), (Ja,"はね"  )]} Same [] None [] Animals
    , Radical '牛' {copy="うし" , translations=[(En, "Cow"), (Ja,"うし"  )]} Same [] None [] Animals
    , Radical '禾' {copy="のぎ" , translations=[(En, "Grain"), (Ja,"のぎ"  )]} Same [] None [] Animals
    , Radical '魚' {copy="うお" , translations=[(En, "Fish"), (Ja,"うお"  )]} Same [] None [] Animals
    , Radical '毛' {copy="け" , translations=[(En, "Fur"), (Ja,"け"  )]} Same [] None [] Animals
    , Radical '牙' {copy="きばへん" , translations=[(En, "Tusk, Fang"), (Ja,"きばへん"  )]} Same [] Left [] Animals
    , Radical '刀' {copy="かたな" , translations=[(En, "Katana, Blade"), (Ja,"かたな"  )]} Same [ '刂' ] None [] Warfare
    , Radical '刂' {copy="りっとう" , translations=[(En, "Katana, Blade (Right)"), (Ja,"りっとう"  )]} (Different ({copy="刀", translations=[(En, "Katana, Blade"), (Ja,"刀")]})) [ '刀' ] Right [] Warfare
    , Radical '⽁' {copy="ぼくづくり" , translations=[(En, "Strike"), (Ja,"ぼくづくり"  )]} (Different ({copy="殴る", translations=[(En, "To Strike"), (Ja, "殴る")]})) [ '⺙' ] Right [] Warfare
    , Radical '⺙' {copy="ぼくづくり" , translations=[(En, "Strike"), (Ja, "ぼくづくり" )]} (Different ({copy="殴る", translations=[(En, "To Strike"), (Ja, "殴る")]})) [ '⽁' ] Right [] Warfare
    , Radical '力' {copy="ちから" , translations=[(En, "Power"), (Ja,"ちから"  )]} Same [ '⺙' ] None [] Warfare
    , Radical '弓' {copy="ゆみ" , translations=[(En, "Bow"), (Ja,"ゆみ"  )]} Same [] None [] Warfare
    , Radical '矢' {copy="や" , translations=[(En, "Arrow"), (Ja,"や"  )]} Same [] None [] Warfare
    , Radical '⼽' {copy="ほこ" , translations=[(En, "Spear, Weapon"), (Ja,"ほこ"  )]} Same [ '矛' ] None [] Warfare
    , Radical '矛' {copy="ほこ" , translations=[(En, "Halbeard, Weapon"), (Ja,"ほこ"  )]} Same [ '⼽' ] None [] Warfare
    , Radical '斤' {copy="おの" , translations=[(En, "Axe"), (Ja,"おの"  )]} Same [] None [] Warfare
    , Radical '丨' {copy="ぼう" , translations=[(En, "Stick"), (Ja,"ぼう"  )]} Same [] None [] Warfare
    , Radical '戸' {copy="と" , translations=[(En, "Door"), (Ja,"と"  )]} Same [] None [] ManMadeTools
    , Radical '罒' {copy="あみがしら" , translations=[(En, "Net"), (Ja,"あみがしら"  )]} (Different ({copy="網目", translations=[(En,"Mesh (of a net)"), (Ja,"網目")]})) [ '网', '⺳' ] Top [] ManMadeTools
    , Radical '⺳' {copy="あみがしら" , translations=[(En, "Net"), (Ja,"あみがしら"  )]} (Different ({copy="網目", translations=[(En, "Mesh (of a net)"), (Ja,"網目")]})) [ '罒', '网' ] None [] ManMadeTools
    , Radical '网' {copy="あみめ" , translations=[(En, "Net"), (Ja,"あみめ"  )]}  Same [ '罒', '⺳' ] None [] ManMadeTools
    , Radical '耒' {copy="らいすき" , translations=[(En, "Spade, Plough, Three-branched Tree"), (Ja,"らいすき"  )]} (Different ({copy="鋤", translations=[(En, "Spade, Plough"),(Ja, "鋤")]})) [] Left [] ManMadeTools
    , Radical '几' {copy="つくえ" , translations=[(En, "Desk"), (Ja,"つくえ"  )]} Same [] None [] ManMadeTools
    , Radical '⼙' {copy="ふしづくり" , translations=[(En, "Stamp, Seal (Right)"), (Ja,"ふしづくり"  )]} (Different ({copy="印鑑", translations=[(En, "Stamp, Seal"), (Ja, "印鑑")]})) [] Right [] ManMadeTools
    , Radical '車' {copy="くるま" , translations=[(En, "Car, Chariot"), (Ja,"くるま"  )]} Same [] None [] ManMadeTools
    , Radical '白' {copy="しろ" , translations=[(En, "White"), (Ja,"しろ"  )]} Same [] None [] Senses
    , Radical '青' {copy="あお" , translations=[(En, "Blue"), (Ja,"あお"  )]} Same [ '⾭' ] None [] Senses
    , Radical '⾭' {copy="あお" , translations=[(En, "Blue"), (Ja,"あお"  )]} (Different ({copy="青", translations=[(En, "Blue"), (Ja, "青")]})) [ '青' ] None [] Senses
    , Radical '音' {copy="おと" , translations=[(En, "Sound"), (Ja,"おと"  )]} Same [] None [] Senses
    , Radical '辰' {copy="しんのたつ" , translations=[(En, "Fifth Zodia Sign"), (Ja,"しんのたつ"  )]} (Different ({copy="竜", translations=[(En,"Dragon" ), (Ja, "竜")]})) [] None [] Supernatural
    , Radical '竜' {copy="りゅう" , translations=[(En, "Dragon"), (Ja,"りゅう"  )]} Same [ '龍' ] None [] Supernatural
    , Radical '龍' {copy="りゅう" , translations=[(En, "Dragon"), (Ja,"りゅう"  )]} (Different ({copy="竜", translations=[(En, "Dragon"), (Ja, "竜")]})) [ '竜' ] None [] Supernatural
    , Radical '鬼' {copy="おに" , translations=[(En, "Oni (Japanese Demon)"), (Ja,"おに"  )]} Same [] None [] Supernatural
    , Radical 'ト' {copy="ぼく" , translations=[(En, "Fortune Telling"), (Ja,"ぼく"  )]} (Different ({copy="占い・カタカナのト", translations=[(En, "Old, Katakana ト"), (Ja, "占い・カタカナのト")]})) [] None [] Supernatural
    ]
