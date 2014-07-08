//
//  ViewController.m
//  PKImagePickerDemo
//
//  Created by pavan krishnamurthy on 7/7/14.
//  Copyright (c) 2014 pavan krishnamurthy. All rights reserved.
//

#import "ViewController.h"
#import "PKImagePickerViewController.h"

@interface ViewController ()
@property (nonatomic,strong) PKImagePickerViewController *imagePicker;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    [button setTitle:@"Show Camera" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.imagePicker = [[PKImagePickerViewController alloc]init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showCamera:(id)sender
{
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

@end
