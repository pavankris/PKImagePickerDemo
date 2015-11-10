PKImagePickerDemo
=================

**Replacement for UIIMagePickerController, which has camera and album integrated and easy to switch between them**

![PKImagePicker](https://raw.githubusercontent.com/pavankris/PKImagePickerDemo/master/ImagePickerScreenShot.png)

##Usage

`pod 'PKImagePicker', '~> 0.0.5'`

`#import 'PKImagePickerViewController.h'`
`PKImagePickerViewController *imagePicker = [[PKImagePickerViewController alloc]init];`
`imagePicker.delegate = self;`
`[self presentViewController:imagePicker animated:YES completion:nil];`
