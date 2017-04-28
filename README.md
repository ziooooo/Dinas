
# Dinas
#### Build your view's frame, like Masonry.


## Installation
Use CocoaPods.

In your Podfile
>`pod 'Dinas'`

Or download and copy `Dinas` to your project

## How to use
It will be very simple for you if you used Masnory.
```objc
UIView *head = [[UIView alloc] init];
head.backgroundColor = [UIColor blackColor];
[self.view addSubview:head];
[head din_makeStructures:^(DINStructureMaker *make) {
    make.centerX.equalTo(self.view);
    make.top.equalToSuperview().offset(100);
    make.size.din_equalTo(CGSizeMake(200, 200));
    make.build();
}];
```
Before `din_makeStructures..` must has `superview`
## Implementation effect
![effect](https://github.com/ziooooo/Dinas/blob/master/effect.png)
