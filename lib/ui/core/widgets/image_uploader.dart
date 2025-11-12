import 'dart:typed_data';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class ImageUploader extends StatefulWidget {
  final ImageUploadController controller;
  final void Function(Uint8List? bytes, String? name)? onChanged;
  final double width;
  final double height;

  const ImageUploader({
    super.key,
    required this.controller,
    this.onChanged,
    this.width = 300,
    this.height = 300,
  });

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  Uint8List? imageBytes;
  String? imageName;
  bool highlighted = false;
  late DropzoneViewController dropzoneCtrl;

  @override
  void initState() {
    super.initState();

    widget.controller
      .._setPickCallback(_pickFile)
      .._setClearCallback(_removeImage);
  }

  Future<void> _pickFile() async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: ['jpg', 'jpeg', 'png', 'gif'],
    );

    final XFile? file = await openFile(acceptedTypeGroups: [typeGroup]);
    if (file != null) {
      final bytes = await file.readAsBytes();
      setState(() {
        imageBytes = bytes;
        imageName = file.name;
      });
      widget.controller._updateFile(bytes, file.name);
      widget.onChanged?.call(bytes, file.name);
    }
  }

  void _removeImage() {
    setState(() {
      imageBytes = null;
      imageName = null;
    });
    widget.controller._updateFile(null, null);
    widget.onChanged?.call(null, null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: _pickFile,
            child: Ink(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.outline, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surfaceContainerLow,
              ),
              child: Stack(
                children: [
                  IgnorePointer(
                    ignoring: !highlighted,
                    child: DropzoneView(
                      operation: DragOperation.copy,
                      cursor: CursorType.grab,
                      mime: const ['image/jpeg', 'image/png', 'image/gif'],
                      onCreated: (ctrl) => dropzoneCtrl = ctrl,
                      onHover: () => setState(() => highlighted = true),
                      onLeave: () => setState(() => highlighted = false),
                      onDropFile: (file) async {
                        final bytes = await dropzoneCtrl.getFileData(file);
                        setState(() {
                          imageBytes = bytes;
                          imageName = file.name;
                          highlighted = false;
                        });
                        widget.controller._updateFile(bytes, file.name);
                        widget.onChanged?.call(bytes, file.name);
                      },
                      onError: (err) => debugPrint('Drop error: $err'),
                    ),
                  ),

                  // Conteúdo
                  Center(
                    child: imageBytes != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.memory(
                              imageBytes!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                        : Center(
                          child: Column(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Icon(Icons.cloud_upload_outlined, size: 48, color: colorScheme.primary,),
                              Text(
                                'Arraste uma imagem ou clique para selecionar',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (imageBytes != null)
          Positioned(
            top: 5,
            left: 5,
            child: IconButton.filled(
              iconSize: 15,
              onPressed: _removeImage,
              icon: const Icon(Icons.close),
              tooltip: 'Remover',
              style: IconButton.styleFrom(
                padding: EdgeInsets.all(0),
                maximumSize: Size(25, 25),
                minimumSize: Size(20, 20)
              ),
            ),
          ),
      ],
    );
  }
}

class ImageUploadController extends ChangeNotifier {
  Uint8List? _bytes;
  String? _fileName;
  void Function()? _pickFile;
  void Function()? _clearFile;

  Uint8List? get bytes => _bytes;
  String? get fileName => _fileName;

  void _setPickCallback(void Function() pick) => _pickFile = pick;
  void _setClearCallback(void Function() clear) => _clearFile = clear;

  void _updateFile(Uint8List? bytes, String? name) {
    _bytes = bytes;
    _fileName = name;
    notifyListeners();
  }

  /// Chamado pelo pai para abrir o seletor de arquivo
  void pick() => _pickFile?.call();

  /// Chamado pelo pai para limpar a imagem
  void clear() => _clearFile?.call();
}
