// Generated by Apple Swift version 4.0 (swiftlang-900.0.65 clang-900.0.37)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_attribute(external_source_symbol)
# define SWIFT_STRINGIFY(str) #str
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name) _Pragma(SWIFT_STRINGIFY(clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in=module_name, generated_declaration))), apply_to=any(function, enum, objc_interface, objc_category, objc_protocol))))
# define SWIFT_MODULE_NAMESPACE_POP _Pragma("clang attribute pop")
#else
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name)
# define SWIFT_MODULE_NAMESPACE_POP
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import ObjectiveC;
@import CoreGraphics;
@import UIKit;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

SWIFT_MODULE_NAMESPACE_PUSH("SideMenu")
enum MenuPushStyle : NSInteger;
enum MenuPresentMode : NSInteger;
@class UIColor;
@class UISideMenuNavigationController;
@class UIPanGestureRecognizer;
@class UIView;

SWIFT_CLASS("_TtC8SideMenu15SideMenuManager")
@interface SideMenuManager : NSObject
/// The push style of the menu.
/// There are six modes in MenuPushStyle:
/// <ul>
///   <li>
///     defaultBehavior: The view controller is pushed onto the stack.
///   </li>
///   <li>
///     popWhenPossible: If a view controller already in the stack is of the same class as the pushed view controller, the stack is instead popped back to the existing view controller. This behavior can help users from getting lost in a deep navigation stack.
///   </li>
///   <li>
///     preserve: If a view controller already in the stack is of the same class as the pushed view controller, the existing view controller is pushed to the end of the stack. This behavior is similar to a UITabBarController.
///   </li>
///   <li>
///     preserveAndHideBackButton: Same as .preserve and back buttons are automatically hidden.
///   </li>
///   <li>
///     replace: Any existing view controllers are released from the stack and replaced with the pushed view controller. Back buttons are automatically hidden. This behavior is ideal if view controllers require a lot of memory or their state doesn’t need to be preserved..
///   </li>
///   <li>
///     subMenu: Unlike all other behaviors that push using the menu’s presentingViewController, this behavior pushes view controllers within the menu.  Use this behavior if you want to display a sub menu.
///   </li>
/// </ul>
@property (nonatomic) enum MenuPushStyle menuPushStyle;
/// The presentation mode of the menu.
/// There are four modes in MenuPresentMode:
/// <ul>
///   <li>
///     menuSlideIn: Menu slides in over of the existing view.
///   </li>
///   <li>
///     viewSlideOut: The existing view slides out to reveal the menu.
///   </li>
///   <li>
///     viewSlideInOut: The existing view slides out while the menu slides in.
///   </li>
///   <li>
///     menuDissolveIn: The menu dissolves in over the existing view controller.
///   </li>
/// </ul>
@property (nonatomic) enum MenuPresentMode menuPresentMode;
/// Prevents the same view controller (or a view controller of the same class) from being pushed more than once. Defaults to true.
@property (nonatomic) BOOL menuAllowPushOfSameClassTwice;
/// Width of the menu when presented on screen, showing the existing view controller in the remaining space. Default is 75% of the screen width or 240 points, whichever is smaller.
/// Note that each menu’s width can be overridden using the <code>menuWidth</code> property on any <code>UISideMenuNavigationController</code> instance.
@property (nonatomic) CGFloat menuWidth;
/// Duration of the animation when the menu is presented without gestures. Default is 0.35 seconds.
@property (nonatomic) double menuAnimationPresentDuration;
/// Duration of the animation when the menu is dismissed without gestures. Default is 0.35 seconds.
@property (nonatomic) double menuAnimationDismissDuration;
/// Duration of the remaining animation when the menu is partially dismissed with gestures. Default is 0.35 seconds.
@property (nonatomic) double menuAnimationCompleteGestureDuration;
/// Amount to fade the existing view controller when the menu is presented. Default is 0 for no fade. Set to 1 to fade completely.
@property (nonatomic) CGFloat menuAnimationFadeStrength;
/// The amount to scale the existing view controller or the menu view controller depending on the <code>menuPresentMode</code>. Default is 1 for no scaling. Less than 1 will shrink, greater than 1 will grow.
@property (nonatomic) CGFloat menuAnimationTransformScaleFactor;
/// The background color behind menu animations. Depending on the animation settings this may not be visible. If <code>menuFadeStatusBar</code> is true, this color is used to fade it. Default is black.
@property (nonatomic, strong) UIColor * _Nullable menuAnimationBackgroundColor;
/// The shadow opacity around the menu view controller or existing view controller depending on the <code>menuPresentMode</code>. Default is 0.5 for 50% opacity.
@property (nonatomic) float menuShadowOpacity;
/// The shadow color around the menu view controller or existing view controller depending on the <code>menuPresentMode</code>. Default is black.
@property (nonatomic, strong) UIColor * _Nonnull menuShadowColor;
/// The radius of the shadow around the menu view controller or existing view controller depending on the <code>menuPresentMode</code>. Default is 5.
@property (nonatomic) CGFloat menuShadowRadius;
/// Enable or disable interaction with the presenting view controller while the menu is displayed. Enabling may make it difficult to dismiss the menu or cause exceptions if the user tries to present and already presented menu. Default is false.
@property (nonatomic) BOOL menuPresentingViewControllerUserInteractionEnabled;
/// The strength of the parallax effect on the existing view controller. Does not apply to <code>menuPresentMode</code> when set to <code>ViewSlideOut</code>. Default is 0.
@property (nonatomic) NSInteger menuParallaxStrength;
/// Draws the <code>menuAnimationBackgroundColor</code> behind the status bar. Default is true.
@property (nonatomic) BOOL menuFadeStatusBar;
/// The animation options when a menu is displayed. Ignored when displayed with a gesture.
@property (nonatomic) UIViewAnimationOptions menuAnimationOptions;
/// The animation spring damping when a menu is displayed. Ignored when displayed with a gesture.
@property (nonatomic) CGFloat menuAnimationUsingSpringWithDamping;
/// The animation initial spring velocity when a menu is displayed. Ignored when displayed with a gesture.
@property (nonatomic) CGFloat menuAnimationInitialSpringVelocity;
/// Automatically dismisses the menu when another view is pushed from it.
/// Note: to prevent the menu from dismissing when presenting, set modalPresentationStyle = .overFullScreen
/// of the view controller being presented in storyboard or during its initalization.
@property (nonatomic) BOOL menuDismissOnPush;
/// Forces menus to always animate when appearing or disappearing, regardless of a pushed view controller’s animation.
@property (nonatomic) BOOL menuAlwaysAnimate;
/// Default instance of SideMenuManager.
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong, getter=default) SideMenuManager * _Nonnull default_;)
+ (SideMenuManager * _Nonnull)default SWIFT_WARN_UNUSED_RESULT;
/// Default instance of SideMenuManager (objective-C).
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) SideMenuManager * _Nonnull defaultManager;)
+ (SideMenuManager * _Nonnull)defaultManager SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
/// The left menu.
@property (nonatomic, strong) UISideMenuNavigationController * _Nullable menuLeftNavigationController;
/// The right menu.
@property (nonatomic, strong) UISideMenuNavigationController * _Nullable menuRightNavigationController;
/// The left menu swipe to dismiss gesture.
@property (nonatomic, weak) UIPanGestureRecognizer * _Nullable menuLeftSwipeToDismissGesture;
/// The right menu swipe to dismiss gesture.
@property (nonatomic, weak) UIPanGestureRecognizer * _Nullable menuRightSwipeToDismissGesture;
/// Enable or disable gestures that would swipe to dismiss the menu. Default is true.
@property (nonatomic) BOOL menuEnableSwipeGestures;
/// Adds a pan edge gesture to a view to present menus.
/// \param toView The view to add a pan gesture to.
///
///
/// returns:
/// The pan gesture added to <code>toView</code>.
- (UIPanGestureRecognizer * _Nonnull)menuAddPanGestureToPresentToView:(UIView * _Nonnull)toView;
@end

typedef SWIFT_ENUM(NSInteger, MenuPushStyle) {
  MenuPushStyleDefaultBehavior = 0,
  MenuPushStylePopWhenPossible = 1,
  MenuPushStyleReplace = 2,
  MenuPushStylePreserve = 3,
  MenuPushStylePreserveAndHideBackButton = 4,
  MenuPushStyleSubMenu = 5,
};

typedef SWIFT_ENUM(NSInteger, MenuPresentMode) {
  MenuPresentModeMenuSlideIn = 0,
  MenuPresentModeViewSlideOut = 1,
  MenuPresentModeViewSlideInOut = 2,
  MenuPresentModeMenuDissolveIn = 3,
};


@interface SideMenuManager (SWIFT_EXTENSION(SideMenu))
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) enum MenuPushStyle menuPushStyle;)
+ (enum MenuPushStyle)menuPushStyle SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuPushStyle:(enum MenuPushStyle)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) enum MenuPresentMode menuPresentMode;)
+ (enum MenuPresentMode)menuPresentMode SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuPresentMode:(enum MenuPresentMode)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL menuAllowPushOfSameClassTwice;)
+ (BOOL)menuAllowPushOfSameClassTwice SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAllowPushOfSameClassTwice:(BOOL)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) CGFloat menuWidth;)
+ (CGFloat)menuWidth SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuWidth:(CGFloat)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) double menuAnimationPresentDuration;)
+ (double)menuAnimationPresentDuration SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationPresentDuration:(double)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) double menuAnimationDismissDuration;)
+ (double)menuAnimationDismissDuration SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationDismissDuration:(double)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) double menuAnimationCompleteGestureDuration;)
+ (double)menuAnimationCompleteGestureDuration SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationCompleteGestureDuration:(double)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) CGFloat menuAnimationFadeStrength;)
+ (CGFloat)menuAnimationFadeStrength SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationFadeStrength:(CGFloat)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) CGFloat menuAnimationTransformScaleFactor;)
+ (CGFloat)menuAnimationTransformScaleFactor SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationTransformScaleFactor:(CGFloat)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) UIColor * _Nullable menuAnimationBackgroundColor;)
+ (UIColor * _Nullable)menuAnimationBackgroundColor SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationBackgroundColor:(UIColor * _Nullable)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) float menuShadowOpacity;)
+ (float)menuShadowOpacity SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuShadowOpacity:(float)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) UIColor * _Nonnull menuShadowColor;)
+ (UIColor * _Nonnull)menuShadowColor SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuShadowColor:(UIColor * _Nonnull)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) CGFloat menuShadowRadius;)
+ (CGFloat)menuShadowRadius SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuShadowRadius:(CGFloat)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL menuPresentingViewControllerUserInteractionEnabled;)
+ (BOOL)menuPresentingViewControllerUserInteractionEnabled SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuPresentingViewControllerUserInteractionEnabled:(BOOL)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) NSInteger menuParallaxStrength;)
+ (NSInteger)menuParallaxStrength SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuParallaxStrength:(NSInteger)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL menuFadeStatusBar;)
+ (BOOL)menuFadeStatusBar SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuFadeStatusBar:(BOOL)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) UIViewAnimationOptions menuAnimationOptions;)
+ (UIViewAnimationOptions)menuAnimationOptions SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationOptions:(UIViewAnimationOptions)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) CGFloat menuAnimationUsingSpringWithDamping;)
+ (CGFloat)menuAnimationUsingSpringWithDamping SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationUsingSpringWithDamping:(CGFloat)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) CGFloat menuAnimationInitialSpringVelocity;)
+ (CGFloat)menuAnimationInitialSpringVelocity SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAnimationInitialSpringVelocity:(CGFloat)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL menuDismissOnPush;)
+ (BOOL)menuDismissOnPush SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuDismissOnPush:(BOOL)newValue;
/// -Warning: Deprecated. Use <code>menuPushStyle = .subMenu</code> instead.
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL menuAllowSubmenus;)
+ (BOOL)menuAllowSubmenus SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAllowSubmenus:(BOOL)newValue;
/// -Warning: Deprecated. Use <code>menuPushStyle = .popWhenPossible</code> instead.
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL menuAllowPopIfPossible;)
+ (BOOL)menuAllowPopIfPossible SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuAllowPopIfPossible:(BOOL)newValue;
/// -Warning: Deprecated. Use <code>menuPushStyle = .replace</code> instead.
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL menuReplaceOnPush;)
+ (BOOL)menuReplaceOnPush SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuReplaceOnPush:(BOOL)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) UISideMenuNavigationController * _Nullable menuLeftNavigationController;)
+ (UISideMenuNavigationController * _Nullable)menuLeftNavigationController SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuLeftNavigationController:(UISideMenuNavigationController * _Nullable)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) UISideMenuNavigationController * _Nullable menuRightNavigationController;)
+ (UISideMenuNavigationController * _Nullable)menuRightNavigationController SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuRightNavigationController:(UISideMenuNavigationController * _Nullable)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, weak) UIPanGestureRecognizer * _Nullable menuLeftSwipeToDismissGesture;)
+ (UIPanGestureRecognizer * _Nullable)menuLeftSwipeToDismissGesture SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuLeftSwipeToDismissGesture:(UIPanGestureRecognizer * _Nullable)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, weak) UIPanGestureRecognizer * _Nullable menuRightSwipeToDismissGesture;)
+ (UIPanGestureRecognizer * _Nullable)menuRightSwipeToDismissGesture SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuRightSwipeToDismissGesture:(UIPanGestureRecognizer * _Nullable)newValue;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL menuEnableSwipeGestures;)
+ (BOOL)menuEnableSwipeGestures SWIFT_WARN_UNUSED_RESULT;
+ (void)setMenuEnableSwipeGestures:(BOOL)newValue;
+ (UIPanGestureRecognizer * _Nonnull)menuAddPanGestureToPresentToView:(UIView * _Nonnull)toView SWIFT_DEPRECATED_MSG("SideMenuManager class methods deprecated.", "default.menuAddPanGestureToPresent");
@end


SWIFT_CLASS("_TtC8SideMenu18SideMenuTransition")
@interface SideMenuTransition : UIPercentDrivenInteractiveTransition
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@protocol UIViewControllerContextTransitioning;

@interface SideMenuTransition (SWIFT_EXTENSION(SideMenu)) <UIViewControllerAnimatedTransitioning>
- (void)animateTransition:(id <UIViewControllerContextTransitioning> _Nonnull)transitionContext;
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning> _Nullable)transitionContext SWIFT_WARN_UNUSED_RESULT;
- (void)updateInteractiveTransition:(CGFloat)percentComplete;
@end

@class UIViewController;
@protocol UIViewControllerInteractiveTransitioning;

@interface SideMenuTransition (SWIFT_EXTENSION(SideMenu)) <UIViewControllerTransitioningDelegate>
- (id <UIViewControllerAnimatedTransitioning> _Nullable)animationControllerForPresentedController:(UIViewController * _Nonnull)presented presentingController:(UIViewController * _Nonnull)presenting sourceController:(UIViewController * _Nonnull)source SWIFT_WARN_UNUSED_RESULT;
- (id <UIViewControllerAnimatedTransitioning> _Nullable)animationControllerForDismissedController:(UIViewController * _Nonnull)dismissed SWIFT_WARN_UNUSED_RESULT;
- (id <UIViewControllerInteractiveTransitioning> _Nullable)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning> _Nonnull)animator SWIFT_WARN_UNUSED_RESULT;
- (id <UIViewControllerInteractiveTransitioning> _Nullable)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning> _Nonnull)animator SWIFT_WARN_UNUSED_RESULT;
@end

@protocol UISideMenuNavigationControllerDelegate;
@class NSBundle;
@class NSCoder;
@protocol UIViewControllerTransitionCoordinator;

SWIFT_CLASS("_TtC8SideMenu30UISideMenuNavigationController")
@interface UISideMenuNavigationController : UINavigationController
/// Delegate for receiving appear and disappear related events. If <code>nil</code> the visible view controller that displays a <code>UISideMenuNavigationController</code> automatically receives these events.
@property (nonatomic, weak) id <UISideMenuNavigationControllerDelegate> _Nullable sideMenuDelegate;
/// SideMenuManager instance associated with this menu. Default is <code>SideMenuManager.default</code>. This property cannot be changed after the menu has loaded.
@property (nonatomic, weak) SideMenuManager * _Null_unspecified sideMenuManager;
/// Width of the menu when presented on screen, showing the existing view controller in the remaining space. Default is zero. When zero, <code>sideMenuManager.menuWidth</code> is used. This property cannot be changed while the isHidden property is false.
@property (nonatomic) CGFloat menuWidth;
/// Whether the menu appears on the right or left side of the screen. Right is the default. This property cannot be changed after the menu has loaded.
@property (nonatomic) BOOL leftSide;
/// Indicates if the menu is anywhere in the view hierarchy, even if covered by another view controller.
@property (nonatomic, readonly) BOOL isHidden;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER SWIFT_UNAVAILABLE_MSG("'init' has been renamed to 'init(rootViewController:)'");
- (nonnull instancetype)initWithRootViewController:(UIViewController * _Nonnull)rootViewController OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)awakeFromNib;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator> _Nonnull)coordinator;
- (void)pushViewController:(UIViewController * _Nonnull)viewController animated:(BOOL)animated;
- (nonnull instancetype)initWithNavigationBarClass:(Class _Nullable)navigationBarClass toolbarClass:(Class _Nullable)toolbarClass SWIFT_UNAVAILABLE;
@end


SWIFT_PROTOCOL("_TtP8SideMenu38UISideMenuNavigationControllerDelegate_")
@protocol UISideMenuNavigationControllerDelegate
@optional
- (void)sideMenuWillAppearWithMenu:(UISideMenuNavigationController * _Nonnull)menu animated:(BOOL)animated;
- (void)sideMenuDidAppearWithMenu:(UISideMenuNavigationController * _Nonnull)menu animated:(BOOL)animated;
- (void)sideMenuWillDisappearWithMenu:(UISideMenuNavigationController * _Nonnull)menu animated:(BOOL)animated;
- (void)sideMenuDidDisappearWithMenu:(UISideMenuNavigationController * _Nonnull)menu animated:(BOOL)animated;
@end


SWIFT_CLASS("_TtC8SideMenu22UITableViewVibrantCell")
@interface UITableViewVibrantCell : UITableViewCell
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

SWIFT_MODULE_NAMESPACE_POP
#pragma clang diagnostic pop
