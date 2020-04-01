//
//  ViewController.m
//  DzPasdView
//
//  Created by 陈毅琥 on 2020/3/31.
//  Copyright © 2020 陈毅琥. All rights reserved.
//

#import "ViewController.h"

#import "DzPasdView.h"
#import "DzPasdViewConfig.h"

#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DzPasdView *pasdView = [[DzPasdView alloc] initWithConfig:[DzPasdViewConfig new]];
    [self.view addSubview:pasdView];
    [pasdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view);
        make.center.mas_equalTo(self.view);
    }];
    
    [pasdView becomeFirstResponder];
    // Do any additional setup after loading the view.
}


@end
