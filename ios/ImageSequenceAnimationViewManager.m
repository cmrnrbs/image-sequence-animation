#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(ImageSequenceAnimationViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(images, NSArray);
RCT_EXPORT_VIEW_PROPERTY(framesPerSecond, NSUInteger);
RCT_EXPORT_VIEW_PROPERTY(loop, BOOL);
RCT_EXPORT_VIEW_PROPERTY(reverse, BOOL);
RCT_EXPORT_VIEW_PROPERTY(isFirstStart, BOOL);

@end
