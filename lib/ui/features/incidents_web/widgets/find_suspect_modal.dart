import 'package:Nexus/ui/core/modal/custom_modal.dart';
import 'package:Nexus/ui/core/widgets/image_uploader.dart';
import 'package:flutter/material.dart';

class FindSuspectModal extends StatefulWidget {
  const FindSuspectModal({super.key});

  @override
  State<FindSuspectModal> createState() => _FindSuspectModalState();
}

class _FindSuspectModalState extends State<FindSuspectModal> {
  ImageUploadController controller = ImageUploadController();
  @override
  Widget build(BuildContext context) {
    return CustomModal(
      title: 'Buscar Foragido',
      primaryActionButton: FilledButton.icon(
        onPressed: () {},
        label: Text('Buscar'),
        icon: Icon(Icons.person_search_outlined),
        iconAlignment: IconAlignment.end,
      ),
      child: Column(children: [
        ImageUploader(controller: controller, width: 372, height: 303,),
        
      ]),
    );
  }
}
