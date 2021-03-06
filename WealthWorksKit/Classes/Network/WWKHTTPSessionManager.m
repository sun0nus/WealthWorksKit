//
//  WWKHTTPSessionManager.m
//  WealthWorksKit
//
//  Created by JianLei on 16/8/1.
//  Copyright © 2016年 WealthWorks. All rights reserved.
//

#import "WWKHTTPSessionManager.h"

static NSString * const kWWKBaseURL = @"http://c.lcgc.pub/";

@implementation WWKHTTPSessionManager

+ (instancetype)wwk_manager
{
    return [self wwk_managerWithBaseURL:kWWKBaseURL];
}

+ (instancetype)wwk_managerWithBaseURL:(NSString *)baseURL
{
    NSURL *URL = [NSURL URLWithString:baseURL];
    WWKHTTPSessionManager *manager = [[self alloc] initWithBaseURL:URL];
    return manager;
}

- (NSURLSessionDataTask *)wwk_GET:(NSString *)URLString
                       parameters:(NSDictionary *)parameters
                          success:(void (^)(NSURLSessionDataTask *task, NSDictionary *responseObject))success
                          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    return [super GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSNumber *successNumber = responseObject[@"success"];
        if (!successNumber || [successNumber boolValue]) {
            if (success) success(task, responseObject);
        } else {
            NSNumber *codeNumber = responseObject[@"code"];
            NSInteger code = codeNumber ? [codeNumber integerValue] : 0;
            NSString *messageString = responseObject[@"message"];
            NSString *message = messageString ? : @"";
            
            NSError *error = [NSError errorWithDomain:@"WWKErrorDomainAFNetworking" code:code userInfo:@{NSLocalizedDescriptionKey: message}];
            if (failure) failure(task, error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(task, error);
    }];
}

- (NSURLSessionDataTask *)wwk_POST:(NSString *)URLString
                        parameters:(NSDictionary *)parameters
                           success:(void (^)(NSURLSessionDataTask *task, NSDictionary *responseObject))success
                           failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    return [super POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSNumber *successNumber = responseObject[@"success"];
        if (!successNumber || [successNumber boolValue]) {
            if (success) success(task, responseObject);
        } else {
            NSNumber *codeNumber = responseObject[@"code"];
            NSInteger code = codeNumber ? [codeNumber integerValue] : 0;
            NSString *messageString = responseObject[@"message"];
            NSString *message = messageString ? : @"";
            
            NSError *error = [NSError errorWithDomain:@"WWKErrorDomainAFNetworking" code:code userInfo:@{NSLocalizedDescriptionKey: message}];
            if (failure) failure(task, error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(task, error);
    }];
}

@end
