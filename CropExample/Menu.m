//
//  Menu.m
//  CropExample
//
//  Created by juhana on 15/06/14.
//  Copyright (c) 2014 juhana. All rights reserved.
//

#import "Menu.h"

@implementation Menu

-(IBAction)openImage:(id)sender
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    if([panel runModal]==NSOKButton){
        NSURL* url = [panel URL];
        NSLog(@"url: %@",url);
        NSDictionary* dict = [NSDictionary dictionaryWithObject:url forKey:@"url"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"fileurl" object:nil userInfo:dict];
    }
}
@end
