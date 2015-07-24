//
//  FlickrFetcher.h
//
//  Created for Stanford CS193p Fall 2013.
//  Copyright 2013 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>

// key paths to photos or places at top-level of Flickr results
#define FLICKR_RESULTS_PHOTOS @"photos.photo"
#define FLICKR_RESULTS_PLACES @"places.place"

// keys (paths) to values in a photo dictionary
#define FLICKR_PHOTO_TITLE @"title"
#define FLICKR_PHOTO_DESCRIPTION @"description._content"
#define FLICKR_PHOTO_ID @"id"
#define FLICKR_PHOTO_OWNER @"ownername"
#define FLICKR_PHOTO_UPLOAD_DATE @"dateupload" // in seconds since 1970
#define FLICKR_PHOTO_PLACE_ID @"place_id"

// keys (paths) to values in a places dictionary (from TopPlaces)
#define FLICKR_PLACE_NAME @"_content"
#define FLICKR_PLACE_ID @"place_id"

// keys applicable to all types of Flickr dictionaries
#define FLICKR_LATITUDE @"latitude"
#define FLICKR_LONGITUDE @"longitude"
#define FLICKR_TAGS @"tags"

typedef enum {
	FlickrPhotoFormatSquare = 1,    // thumbnail
	FlickrPhotoFormatLarge = 2,     // normal size
    FlickrPhotoFormatNormal = 4,     // small size
	FlickrPhotoFormatOriginal = 64  // high resolution
} FlickrPhotoFormat;

@interface FlickrFetcher : NSObject

+ (NSURL *)URLforTopPlaces;

//send out one placeID,return serveral result with different placeID, as thos placeID has some kind of relationship
+ (NSURL *)URLforPhotosInPlace:(id)flickrPlaceId maxResults:(int)maxResults;

//get page information, on certain page, per page has serveral pics
+ (NSURL *)URLforPhotosInPlace:(id)flickrPlaceId
                        onPage:(int)onPage
                       perPage:(int)perPage;

+ (NSURL *)URLforPhoto:(NSDictionary *)photo format:(FlickrPhotoFormat)format;

+ (NSURL *)URLforRecentGeoreferencedPhotos;

//place information, sames area has different placeId
+ (NSURL *)URLforInformationAboutPlace:(id)flickrPlaceId;

//use this method to cmp whether the place with placeID is the same area as place
+ (NSString *)extractNameOfPlace:(id)placeId fromPlaceInformation:(NSDictionary *)place;
+ (NSString *)extractRegionNameFromPlaceInformation:(NSDictionary *)placeInformation;

@end
