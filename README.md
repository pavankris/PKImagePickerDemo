PKImagePickerDemo
=================

**Replacement for UIIMagePickerController, which has camera and album integrated and easy to switch between them**

![PKImagePicker](https://raw.githubusercontent.com/pavankris/PKImagePickerDemo/master/ImagePickerScreenShot.png)

##Usage

`PKImagePickerController *imagePicker = [[PKImagePickerController alloc]init];`

`imagePicker.delegate = self;`

`[self presentViewController:self.imagePicker animated:YES completion:nil];`
