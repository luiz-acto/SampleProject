//
//  ViewController.m
//  SampleProject
//
//  Created by Luiz Fernando Dias on 2020-03-04.
//  Copyright © 2020 ACTO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIToolbar *toolbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor greenColor]];
    [button addTarget:self
               action:@selector(acceptButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Accept" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    UIBarButtonItem *umItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *anotherItem = [[UIBarButtonItem alloc] initWithTitle:@"Another item" style:UIBarButtonItemStyleDone target:self action:@selector(acceptButtonPressed:)];

    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat toolbarHeight = 44.0;
    
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screenSize.height-toolbarHeight, screenSize.width, toolbarHeight)];
    
    self.toolbar.barTintColor = [UIColor redColor];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self.toolbar setItems:@[anotherItem, flexItem, umItem]];
    
    [self.view addSubview:self.toolbar];
    [self.toolbar setTranslatesAutoresizingMaskIntoConstraints:NO];
    if (@available(iOS 11.0, *)) {
        [NSLayoutConstraint activateConstraints:@[
            [self.toolbar.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
            [self.toolbar.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
            [self.toolbar.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
//            [self.toolbar.heightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.heightAnchor],
            [self.toolbar.heightAnchor constraintEqualToConstant:toolbarHeight],
        ]
         ];
    } else {
        // Fallback on earlier versions
    }

    [self.view addSubview:self.toolbar];
//    UIView *targetView = (UIView *)[self.toolbar.items.firstObject performSelector:@selector(view)];
//    CGRect firstItemFrame = targetView.frame;

    CGRect frame = CGRectMake(0, 230, screenSize.width/2, toolbarHeight);
    [[umItem customView] setFrame:frame];

}

-(void)acceptButtonPressed:(id)sender {
    NSLog(@"nothing here");
}
@end
