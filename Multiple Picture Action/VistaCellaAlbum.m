//
//  VistaCellaAlbum.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/3/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "VistaCellaAlbum.h"

@implementation VistaCellaAlbum

@synthesize unaImageView;
@synthesize totes;
@synthesize titol;
@synthesize quantes;
@synthesize unButo;
@synthesize controller;
@synthesize unAlbum;


/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)veureAlbum:(id)sender{
    //NSLog(@"VeureAlbum");
    [MkTransporter setObject:unAlbum forNSString:@"album"];
    [controller performSegueWithIdentifier:@"toPicture" sender:controller];
}
- (IBAction)seleccionarTotes:(id)sender{
    //NSLog(@"Seleccionades totes");
    [self unAlbum].totes = [NSNumber numberWithBool:totes.isOn];
    
    NSString *recompte;
    
    if(unAlbum.totes.boolValue){
        recompte = [NSString stringWithFormat:@"%i/%i ",unAlbum.totalImg.intValue, unAlbum.totalImg.intValue];
        
    }else{
        recompte = [NSString stringWithFormat:@"%i/%i ",unAlbum.seleccionadesImg.intValue, unAlbum.totalImg.intValue];
    }
    //quantes.text = recompte;
    //NSSet *unSet = unAlbum.imatges;
    //NSLog(@"El set de l'album te %i imatges",unSet.count);
}

-(void)actualitzar{
    titol.text = unAlbum.nom;
    totes.on = unAlbum.totes.boolValue;
    unaImageView.image = unAlbum.thumbnail.imatge;
    
    NSString *recompte;
    
    if(unAlbum.totes.boolValue){
        recompte = [NSString stringWithFormat:@"%i/%i ",unAlbum.totalImg.intValue, unAlbum.totalImg.intValue];
        
    }else{
        recompte = [NSString stringWithFormat:@"%i/%i ",unAlbum.seleccionadesImg.intValue, unAlbum.totalImg.intValue];
    }
    quantes.text = recompte;

}

@end
