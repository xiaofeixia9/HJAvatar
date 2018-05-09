//
//  ViewController.m
//  HJAvatar
//
//  Created by ios119 on 2018/4/28.
//  Copyright © 2018年 ios119. All rights reserved.
//

#import "ViewController.h"
#import <YYKit.h>
#import "HJAvatarView.h"

@interface ViewController ()

@property (nonatomic, strong) HJAvatarView *avatarView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.avatarView];
    
    NSURL *avatarURL = [NSURL URLWithString:@"https://img1.famulei.com/m/2254302/p/185/0911311530263_800x1422.jpg"];
    
    [self.avatarView hj_makeAvatarWithAttribute:^(HJAvatarAttribute *attribute) {
        attribute.imageURL(avatarURL);
        attribute.avatarSize(CGSizeMake(50, 50));
        attribute.borderColor([UIColor redColor]).borderWidth(1).radius(25);
    }];
}

- (HJAvatarView *)avatarView
{
    if (!_avatarView) {
        _avatarView = [HJAvatarView new];
        _avatarView.size = CGSizeMake(50, 50);
        _avatarView.center = CGRectGetCenter(self.view.frame);
    }
    
    return _avatarView;
}

@end
