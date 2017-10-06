//
//  Movie.h
//  GoMovies
//
//  Created by Hassan on 10/5/17.
//  Copyright © 2017 hassaneskandari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface Rating : JSONModel

@property (nonatomic) NSNumber <Optional> *average;

@end


@interface Country : JSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *code;
@property (nonatomic) NSString *timezone;

@end


@interface Network : JSONModel

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic) Country *country;

@end


@interface Image: JSONModel

@property (nonatomic) NSString *medium;
@property (nonatomic) NSString *original;

@end


@interface Movie : JSONModel

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *url;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *language;
@property (nonatomic) NSArray<NSString*> *genres;
@property (nonatomic) NSString *status;
@property (nonatomic) NSInteger runtime;
@property (nonatomic) NSString *premiered;
@property (nonatomic) NSString <Optional> *officialSite;
@property (nonatomic) Rating *rating;
@property (nonatomic) NSInteger weight;
@property (nonatomic) Network <Optional> *network;
@property (nonatomic) Image *image;
@property (nonatomic) NSString *summary;

@end




