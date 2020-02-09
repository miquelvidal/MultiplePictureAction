//
//  VistaOpcions.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "VistaOpcions.h"

@interface VistaOpcions ()

@end

@implementation VistaOpcions

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    /*
     id unPossibleFlag = [MkTransporter getObjectFromNSString:@"flagAccio"];
    if (unPossibleFlag) {
        NSNumber* elFlag = unPossibleFlag;
        if (elFlag.boolValue) {
            [MkTransporter setObject:[NSNumber numberWithBool:NO] forNSString:@"flagAccio"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
