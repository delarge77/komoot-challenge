//
//  KCPhotoCardCell.m
//  komoot
//
//  Created by Alessandro dos santos pinto on 1/11/16.
//  Copyright © 2016 Alessandro dos Santos Pinto. All rights reserved.
//

#import "KCPhotoCardCell.h"
#import <UIImageView+WebCache.h>

@interface KCPhotoCardCell()


@property (weak, nonatomic) IBOutlet UIImageView *ivPhotoCard;

@end

@implementation KCPhotoCardCell

- (void) showPhotoCard:(KCPhoto *) photo {

    [self.ivPhotoCard sd_setImageWithURL:[NSURL URLWithString:photo.photo_file_url]];
    
}

@end
