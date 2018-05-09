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
