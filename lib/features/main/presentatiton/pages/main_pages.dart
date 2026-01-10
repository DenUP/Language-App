import 'package:flutter/material.dart';
import 'package:language_app/getit.dart';
import 'package:pocketbase/pocketbase.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List<Uri> imageUrls = [];
  bool isLoading = true;

  Future<void> loadImages() async {
    try {
      final pb = getIt.get<PocketBase>();
      // Получаем все записи из коллекции
      final records = await pb.collection('stonks').getFullList();

      // Собираем URL для каждой записи
      final urls = <Uri>[];

      for (final record in records) {
        // Получаем имя файла из поля (замените 'field' на нужное поле)
        final fileName = record.get<String>('field');

        if (fileName != null && fileName.isNotEmpty) {
          final url = pb.files.getURL(record, fileName);
          urls.add(url);
          print('Добавлен URL: $url');
        }
      }

      setState(() {
        imageUrls = urls;
        isLoading = false;
      });
    } catch (e) {
      print('Ошибка загрузки изображений: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Галерея изображений')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : imageUrls.isEmpty
          ? Center(child: Text('Нет изображений'))
          : GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrls[index].toString(),
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Icon(Icons.broken_image, color: Colors.grey),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
