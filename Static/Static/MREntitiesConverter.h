/*
 //  MREntitiesConverter.h
 //  Primary
 //
 //  Via StackOverflow.com: 
 //  http://stackoverflow.com/questions/659602/objective-c-html-escape-unescape
 //
 //  Created by Brennan Stehling on 8/5/11.
 //  Copyright 2011 Marquette University. All rights reserved.
 */

@interface MREntitiesConverter : NSObject <NSXMLParserDelegate> {
    NSMutableString* resultString;
}

@property (nonatomic, retain) NSMutableString* resultString;

- (NSString*)convertEntiesInString:(NSString*)s;

@end
