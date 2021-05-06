# JapaneseConversion
This is the sample code about converting and searching Japanese string, allowing changing the options to find text with exact Katakana, Hiragana, or both. 

It's the first time I use MVVM Architecture, SwiftUI in combination with Combine. So I doubt of the code what I have written 😙😙😙😙.
If something goes wrong, please let me in on it. I'd appreciate that.

### Previews
![Conversion](./Previews/Conversion.gif) ![Searching](./Previews/Searching.gif)


### Core

I've used the constant below to distinguish characters which one is katakana, hiragana, or neither
```
    struct Constant {
        static let minKatakana: UInt32 = 0x30a0
        static let maxKatakana: UInt32 = 0x30ff
        static let minHiragana: UInt32 = 0x3040
        static let maxHiragana: UInt32 = 0x309f
        static let minKanji: UInt32 = 0x4e00
        static let maxKnaji: UInt32 = 0x9faf
    }
```

### References
https://stackoverflow.com/a/3827144/1654338
