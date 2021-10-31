// ignore: file_names
// ignore_for_file: file_names

class Menu {
  final int id;
  final String title;
  final int task;
  final String image;

  Menu({
    required this.id,
    required this.title,
    required this.task,
    required this.image,
  });
}

List<Menu> categories_data = [
  new Menu(id: 1, title: 'All', task: 8, image: 'assets/images/note.png'),
  new Menu(id: 2, title: 'Work', task: 14, image: 'assets/images/work.png'),
  new Menu(id: 3, title: 'Music', task: 15, image: 'assets/images/headset.png'),
  new Menu(
    id: 4,
    title: 'Travel',
    task: 16,
    image: 'assets/images/airplane.png',
  ),
  new Menu(id: 5, title: 'Study', task: 4, image: 'assets/images/book.png'),
  new Menu(id: 6, title: 'Home', task: 1, image: 'assets/images/home.png'),
];
