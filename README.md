
# Dinas
##### Build your view's frame, like Masonry.


## Installation
Use CocoaPods.

In your Podfile
>`pod 'Masonry'`

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
![effect](http://upload-images.jianshu.io/upload_images/1659260-d2c441c4bd784abd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
