//
//  VistaMail.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "VistaMail.h"

@interface VistaMail ()

@end

@implementation VistaMail

@synthesize unStepper;
@synthesize msgNumMails;
@synthesize zipCompression;

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
    MkAccioMail* unaAccioMail = [MkTransporter getObjectFromNSString:@"mailAccio"];
    if (unaAccioMail) {
        unStepper.value = (double)unaAccioMail.numSplit;
        msgNumMails.text = [NSString stringWithFormat:@"Split in %i mails", (int)unStepper.value];
        zipCompression.on = unaAccioMail.zipCompress;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)modificatStepper:(id)sender{
    msgNumMails.text = [NSString stringWithFormat:@"Split in %i mails", (int)unStepper.value];
}
-(IBAction)sendByMail:(id)sender{
    MkAccioMail* unaAccio = [[MkAccioMail alloc] init];
    unaAccio.numSplit = (int)unStepper.value;
    unaAccio.zipCompress = zipCompression.isOn;
    [MkTransporter setObject:unaAccio forNSString:@"accio"];
    [MkTransporter setObject:unaAccio forNSString:@"mailAccio"];
    VistaEntrada* entrada = [MkTransporter getObjectFromNSString:@"vistaEntrada"];
    
    if (entrada) {
        [entrada step2Done];

        [self.navigationController popToViewController:entrada animated:YES];
    }
    
    /*
    NSInteger noOfViewControllers = [self.navigationController.viewControllers count];
    [self.navigationController
     popToViewController:[self.navigationController.viewControllers
                          objectAtIndex:(noOfViewControllers-2)] animated:YES];
    */
    //[self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:2] animated:YES];
    /*
     
    NSNumber* flagAccioAcabadaDeTriar = [NSNumber numberWithBool:YES];
     [MkTransporter setObject:flagAccioAcabadaDeTriar forNSString:@"flagAccio"];
    [self.navigationController popViewControllerAnimated:YES];
    */
    
}

@end
