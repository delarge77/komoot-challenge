//
//  KCModelConverter.h
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface KCModelConverter : MTLModel

+ (id)convertModelFromJSON:(NSDictionary *)JSON class:(Class)classToParse;
+ (NSArray *)convertModelsFromJSON:(NSArray *)JSON class:(Class)classToParse;

@end
