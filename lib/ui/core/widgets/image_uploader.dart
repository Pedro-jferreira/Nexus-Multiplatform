import 'package:Nexus/domain/models/requests/gen_models.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:http/http.dart' as http;

class ImageUploader extends StatefulWidget {
  final ImageUploadController controller;
  final void Function(Uint8List? bytes, String? name)? onChanged;
  final double width;
  final double height;
  final bool readOnly;

  const ImageUploader({
    super.key,
    required this.controller,
    this.onChanged,
    this.width = 300,
    this.height = 300,
    this.readOnly = false,
  });

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
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
    if (widget.readOnly) return;
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: ['jpg', 'jpeg', 'png', 'gif'],
    );

    final XFile? file = await openFile(acceptedTypeGroups: [typeGroup]);
    if (file != null) {
      final bytes = await file.readAsBytes();
      widget.controller._updateFile(bytes, file.name);
      widget.onChanged?.call(bytes, file.name);
    }
  }

  void _removeImage() {
    widget.controller._updateFile(null, null);
    widget.onChanged?.call(null, null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        return Stack(
          children: [
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: widget.readOnly ? null :_pickFile,
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
                      if(!widget.readOnly)
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
                        child: widget.controller.bytes != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.memory(
                                  widget.controller.bytes!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              )
                            : Center(
                                child: widget.controller.isLoading
                                    ? CircularProgressIndicator()
                                    : Column(
                                        spacing: 8,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.cloud_upload_outlined,
                                            size: 48,
                                            color: colorScheme.primary,
                                          ),
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
            if (widget.controller.bytes != null)
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
                    minimumSize: Size(20, 20),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class ImageUploadController extends ChangeNotifier {
  ImageUploadController();
  ImageUploadController.fromUrl(String url) {
    loadFromUrl(url);
  }
  ImageUploadController.fromBytes(Uint8List bytes, {String? name}) {
    _bytes = bytes;
    _fileName = name ?? "image.png";
  }
  final List<FileRequest> _cache = [];
  Uint8List? _bytes;
  String? _fileName;
  void Function()? _pickFile;
  void Function()? _clearFile;

  bool _isLoading = false;

  Uint8List? get bytes => _bytes;
  String? get fileName => _fileName;

  bool get isLoading => _isLoading;
  List<FileRequest> get cache => _cache;


  void _setPickCallback(void Function() pick) => _pickFile = pick;
  void _setClearCallback(void Function() clear) => _clearFile = clear;

  void _updateFile(Uint8List? bytes, String? name) {
    if(bytes!= null ) {
      _cache.add(FileRequest(file: bytes, fileName: name));
    }
    _bytes = bytes;
    _fileName = name;
    notifyListeners();
  }

  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _finishLoading() {
    _isLoading = false;
    notifyListeners();
  }

  /// Chamado pelo pai para abrir o seletor de arquivo
  void pick() => _pickFile?.call();

  /// Chamado pelo pai para limpar a imagem
  void clear() => _clearFile?.call();

  void loadFromBytes(Uint8List bytes, {String? name}) {
    _updateFile(bytes, name ?? "image.png");
  }

  /// Carregar imagem inicial por URL (faz download)
  Future<void> loadFromUrl(String url, {String? name}) async {
    _startLoading();
    try {
      final uri = Uri.parse(url);

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        _updateFile(bytes, name ?? url.split("/").last);
      } else {
        print('Erro ao baixar imagem: ${response.statusCode}');
      }

    } catch (e) {
      print('Erro ao baixar imagem: $e');
    } finally {
      _finishLoading();
    }
  }
}
