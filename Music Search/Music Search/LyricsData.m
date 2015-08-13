//
//  LyricsData.m
//  Music Search
//
//  Created by Nuvvala on 8/13/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import "LyricsData.h"
#import "MyMusic.h"
#import "XMLDictionary.h"
@implementation LyricsData


-(void)getStreamsFromURLString:(NSString *)urlString success:(void (^)(NSString *))success failure:(void (^)(NSError *))failure{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:requestUrl];
    operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
      //  NSDictionary *finalDict = (NSDictionary *)responseObject;
        NSLog(@" %@ ",responseObject);
           NSMutableArray *musicArray = [[NSMutableArray alloc]init];
          NSDictionary *dataArray = [[XMLDictionaryParser sharedInstance] dictionaryWithParser:responseObject];
          NSString *stringg = dataArray[@"lyrics"];
          
          MyMusic *music = [[MyMusic alloc]initWithLyrics:[NSString stringWithFormat:@" %@ ",stringg]];
          
         // [musicArray addObject:music];
          
        //  NSString *string = music;
          success(music.lyrics);
        
          
      //    MyMusic *music = [[MyMusic alloc]initWithLyrics:];
       //   success();
          
    }
     
     
     
failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@" %@ ",error);
                                         failure(error);
                                     }];
    [operation start];
    
}

@end
