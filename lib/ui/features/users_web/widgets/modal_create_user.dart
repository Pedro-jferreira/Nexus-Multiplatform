import 'package:flutter/material.dart';
import 'package:Nexus/ui/core/modal/custom_modal.dart';
import 'package:Nexus/ui/core/widgets/image_uploader.dart';
import 'package:Nexus/ui/features/users_web/widgets/form_create_user.dart';

class ModalCreateUser extends StatefulWidget {
  const ModalCreateUser({super.key});

  @override
  State<ModalCreateUser> createState() => _ModalCreateUserState();
}

class _ModalCreateUserState extends State<ModalCreateUser> {
  final ImageUploadController controller = ImageUploadController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomModal(
      title: 'Cadastrar usúario',
      child: Flexible(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [

            ImageUploader(controller: controller),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 618, minWidth: 617),
                child: SingleChildScrollView(
                  child: FormCreateUser(formKey: _formKey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
