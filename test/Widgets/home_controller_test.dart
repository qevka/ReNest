void main() {
//   test('''
// Test the state of the reactive variable "name" across all of its lifecycles''', () {
//     /// You can test the controller without the lifecycle,
//     /// but it's not recommended unless you're not using
//     ///  GetX dependency injection
//     final controller = HomeController();
//     expect(controller.name.value, 'name1');
//
//     /// If you are using it, you can test everything,
//     /// including the state of the application after each lifecycle.
//     Get.put(controller); // onInit was called
//     expect(controller.name.value, 'name2');
//
//     /// Test your functions
//     controller.changeName();
//     expect(controller.name.value, 'name3');
//
//     /// onClose was called
//     Get.delete<Controller>();
//
//     expect(controller.name.value, '');
//   });
}
