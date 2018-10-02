#import "RNShakeEvent.h"
#import <React/RCTUtils.h>

#if RCT_DEV
static NSString *const RNShakeEventNotification = @"RCTShowDevMenuNotification";
#else
static NSString *const RNShakeEventNotification = @"RNShakeEventNotification";
#endif


@implementation UIWindow (RNShakeEvent)

- (void)RNShakeEvent:(__unused UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake) {
        [[NSNotificationCenter defaultCenter] postNotificationName:RNShakeEventNotification object:nil];
    }
}

@end

@implementation RNShakeEvent

{
    bool hasListeners;
}


RCT_EXPORT_MODULE();


- (NSArray<NSString *> *)supportedEvents
{
    return @[@"ShakeEventBegan", @"ShakeEventEnded"];
}

-(void)startObserving {
    hasListeners = YES;
}

-(void)stopObserving {
    hasListeners = NO;
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

+ (void)initialize
{
    RCTSwapInstanceMethods([UIWindow class], @selector(motionBegan:withEvent:), @selector(RNShakeEvent:withEvent:));
    RCTSwapInstanceMethods([UIWindow class], @selector(motionEnded:withEvent:), @selector(RNShakeEvent:withEvent:));
}

- (instancetype)init
{
    if ((self = [super init])) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(motionBegan:)
                                                     name:RNShakeEventNotification
                                                   object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(motionEnded:)
                                                     name:RNShakeEventNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)motionBegan:(NSNotification *)notification
{
    if (hasListeners) {
        [self sendEventWithName:@"ShakeEventBegan" body:nil];
    }
}

- (void)motionEnded:(NSNotification *)notification
{
    if (hasListeners) {
        [self sendEventWithName:@"ShakeEventEnded" body:nil];
    }
}

@end
