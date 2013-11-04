Description
=====

UIColor categories and APIs for generating colors

![Demo application using these APIs](demo/display.jpg "Demo application using these APIs")

Headers
=====

####`UIColor+Components.h`
This contains methods to get different component values for different colorspaces including RGB, CMYK, HSB, YUV, and CIE-LAB.

---


####`UIColor+ColorFinder.h`
This contains a method to find a color in a set that is most like its receiver.

---


####`UIColor+DeviceColor.h`
This contains methods to get color information about the device, case, app icon, user wallpaper, and more.

---


####`UIColor+KeyColor.h`
This contains a method to see if a color is appropriate for use as a key color (`tintColor` for active controls) as well as a method to find the first key-color-appropriate color in a set. This is useful for finding fallbacks for colors. Can't find a good enough color from an image to use? Fall back to another color and so on.

---

####`UIColor+Manipulation.h`
This contains a method to find the perceived difference in two colors. It uses the CIEDE2000 Color-Difference Formula.

---

####`UIColor+NeueColors.h`
This contains the standard system colors used in Apple's default apps as well as the colors of device hardware.

---

####`UIImage+Colors.h`
This contains methods for getting colors from images. You can specify that you want a general-purpose color or a color to be used as a key color. You can specify if you want to guarantee a specified minimum contrast against another color, which is useful when displaying another color (in button text, for example) against a background color.
