//
//  ViewController.m
//  PKImagePickerDemo
//
//  Created by pavan krishnamurthy on 7/7/14.
//  Copyright (c) 2014 pavan krishnamurthy. All rights reserved.
//

#import "ViewController.h"
#import "PKImagePickerViewController.h"

@interface ViewController ()<PKImagePickerViewControllerDelegate>
@property (nonatomic,strong) PKImagePickerViewController *imagePicker;
@property (nonatomic, strong) CAShapeLayer* overlayLayer;
@property (nonatomic,strong) UIImageView*imageView;
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
    self.imagePicker.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, 200, 200)];
    [self.view addSubview:self.imageView ];
    
    [button setTranslatesAutoresizingMaskIntoConstraints: NO];
    [_imageView setTranslatesAutoresizingMaskIntoConstraints: NO];
    
    NSDictionary *views =  NSDictionaryOfVariableBindings (button,_imageView);
    
    NSDictionary *metrics = @{@"size":@(300)};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(200)]"
                                                                            options:kNilOptions metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_imageView(size)]"
                                                                          options:kNilOptions metrics:metrics views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:
                               @"V:|-50-[button(50)]-30-[_imageView(size)]"
                                                                      options:kNilOptions metrics:metrics views:views]];
    
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:button
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0],
                                
                                [NSLayoutConstraint constraintWithItem:_imageView
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0]
                                ]];
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


-(void)ImagePickerImageSelected:(UIImage*)img{
    self.imageView.image = img;
}

-(void)ImagePickerImageSelectionCancelled{

}
-(void)ImagePickerOverlayForCamera:(UIView*)view{
    if (!self.overlayLayer) {
        NSInteger radius = (view.bounds.size.width - 30) /2;
        CGFloat width = view.bounds.size.width;
        CGFloat height = view.bounds.size.height;
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:0];
        
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake((width-2.0*radius)/2, (height-2.0*radius)/2, 2.0*radius, 2.0*radius) cornerRadius:radius];
        [path appendPath:circlePath];
        [path setUsesEvenOddFillRule:YES];
        
        
        self.overlayLayer = [CAShapeLayer layer];
        self.overlayLayer.path = path.CGPath;
        self.overlayLayer.fillRule = kCAFillRuleEvenOdd;
        self.overlayLayer.fillColor = [UIColor grayColor].CGColor;
        self.overlayLayer.opacity = 0.5;
        [view.layer addSublayer:self.overlayLayer];
    }
}
@end
