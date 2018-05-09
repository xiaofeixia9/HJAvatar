# HJAvatar
使用链式编程方式简化多个参数传递

使用如下方式加载头像
```objc
NSURL *avatarURL = [NSURL URLWithString:@"<#显示的头像地址#>"];
[self.avatarView hj_makeAvatarWithAttribute:^(HJAvatarAttribute *attribute) {
    attribute.imageURL(avatarURL);
    attribute.avatarSize(CGSizeMake(50, 50));
    attribute.borderColor([UIColor redColor]).borderWidth(1).radius(25);
}];

```

详情可查看 [我的简书](https://www.jianshu.com/p/b84b518ac32b)

下载该项目后，使用`pod install`进行安装依赖库
