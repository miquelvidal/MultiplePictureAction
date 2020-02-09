//
//  VistaCellaFotosAlbum.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "VistaCellaFotosAlbum.h"

@implementation VistaCellaFotosAlbum

@synthesize unaImageView;
@synthesize botoAfegir;
@synthesize botoTreure;
@synthesize unaImatge;
-(void)actualitzaDades{
    unaImageView.image = unaImatge.thumbnail.imatge;
    if (unaImatge.seleccionada.boolValue) {
        botoTreure.hidden=NO;
        botoAfegir.hidden=YES;
    }
    else{
        botoTreure.hidden=YES;
        botoAfegir.hidden=NO;
    }
}
-(IBAction)seleccionadaFoto:(id)sender{
    if (!unaImatge.seleccionada.boolValue) {
        unaImatge.seleccionada = [NSNumber numberWithBool:YES];
        int contadorAlbum = unaImatge.album.seleccionadesImg.intValue;
        contadorAlbum++;
        unaImatge.album.seleccionadesImg = [NSNumber numberWithInt:contadorAlbum];
        botoTreure.hidden=NO;
        botoAfegir.hidden=YES;
    }
}
-(IBAction)deseleccionarFoto:(id)sender{
    if (unaImatge.seleccionada.boolValue) {
        unaImatge.seleccionada = [NSNumber numberWithBool:NO];
        int contadorAlbum = unaImatge.album.seleccionadesImg.intValue;
        contadorAlbum--;
        unaImatge.album.seleccionadesImg = [NSNumber numberWithInt:contadorAlbum];
        botoTreure.hidden=YES;
        botoAfegir.hidden=NO;
    }
}


@end
