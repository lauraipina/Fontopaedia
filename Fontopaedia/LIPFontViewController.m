//
//  LIPFontViewController.m
//  Fontopaedia
//
//  Created by Laura Iglesias Piña on 28/1/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPFontViewController.h"

@interface LIPFontViewController ()

@end

@implementation LIPFontViewController

-(id)initWithFont:(UIFont *)font{
    
    if (self == [super init]) {
        
        _font = font;
        self.title = @"Fontopaedia";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tituloLabel.font = self.font;
    self.txtLabel.font = self.font;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
