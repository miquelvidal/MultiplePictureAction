//
//  VistaEntrada.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "VistaEntrada.h"

@interface VistaEntrada ()

@end

@implementation VistaEntrada
@synthesize txtAccio;
@synthesize txtImatges;
@synthesize txtLog;

@synthesize okStep1;
@synthesize txtStep1;
@synthesize botoStep1;

@synthesize okStep2;
@synthesize txtStep2;
@synthesize botoStep2;

@synthesize okStep3;
@synthesize txtStep3;
@synthesize botoStep3;

@synthesize temps;

@synthesize reset;

@synthesize okReset;


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
    [MkTransporter setObject:self forNSString:@"vistaEntrada"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//[MkTransporter setObject:unaAccio forNSString:@"accio"];

-(IBAction)accioApply:(id)sender{
    MkAccio* unaAccio = [MkTransporter getObjectFromNSString:@"accio"];
    //NSLog(@"%@",[unaAccio passarNom]);
    [unaAccio ferAccio];
    
}

-(void)step0{
    
    okStep1.hidden =YES;
    okStep2.hidden =YES;
    okStep3.hidden =YES;
    
    txtStep2.hidden = YES;
    botoStep2.hidden = YES;
    txtStep3.hidden = YES;
    botoStep3.hidden = YES;
    
    reset.enabled = NO;
    
    txtAccio.text = @"";
    txtImatges.text = @"";
    txtLog.text = @"";
    
    [MkTransporter setObject:nil forNSString:@"accio"];
}

-(void)step1Done{
    okStep1.hidden = NO;
    txtStep2.hidden = NO;
    botoStep2.hidden = NO;
    reset.enabled = YES;
    
    NSInteger numImatges, numAlbums;
    numAlbums = [MkDbFetcher albumsSeleecionats:[MkTransporter getObjectFromNSString:@"managedObjectContext"]].count;
    numImatges = [MkDbFetcher imatgesSeleccionades:[MkTransporter getObjectFromNSString:@"managedObjectContext"]].count;
    
    if (numImatges==0) {
    //no hi ha imatges seleccionades, llavors posem txt albums (tot i que potser no n'hi ha de seleccionats).
        txtImatges.text = [NSString stringWithFormat:@"Selected %i albums",numAlbums];
    }
    else if (numAlbums==0){
        txtImatges.text=[NSString stringWithFormat:@"Selected %i images",numImatges];
    } else {
        txtImatges.text=[NSString stringWithFormat:@"Selected %i albums and % i images",numAlbums, numImatges];
    }
    txtImatges.hidden=NO;
}
-(void)step2Done{
    okStep2.hidden = NO;
    txtStep3.hidden = NO;
    botoStep3.hidden = NO;
    MkAccio* unaAccio = [MkTransporter getObjectFromNSString:@"accio"];
    txtAccio.text = [unaAccio passarNom];
    NSLog(@"%@",[unaAccio passarNom]);
    txtAccio.hidden=NO;
}
-(void)step3Done{
    okStep3.hidden = NO;
    txtLog.hidden=NO;
    
    //txtLog.text = @"Done";
}

//confiramció vull resetejar
-(IBAction)resetejar:(id)sender{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reset" message:@"Do you want to reset select pictures, actions, etc" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes, I confirm", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex!=0) {
        [MkAlbumLoader refrescarAlbums];
        [self step0];
        okReset = NO;
    }

}

@end
